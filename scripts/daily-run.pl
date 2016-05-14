#!/usr/bin/perl
##################################################################
# A script to organize daily runs of the ABI Tracker
#
# Copyright (C) 2015-2016 Andrey Ponomarenko's ABI Laboratory
#
# Written by Andrey Ponomarenko
#
# PLATFORMS
# =========
#  Linux
#
# REQUIREMENTS
# ============
#  Perl 5 (5.8 or newer)
#  ABI Tracker (1.6 or newer)
#  ABI Monitor (1.8 or newer)
#  ABI Compliance Checker (1.99.20 or newer)
#  ABI Dumper (0.99.15 or newer)
#  PkgDiff (1.6.4 or newer)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License or the GNU Lesser
# General Public License as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# and the GNU Lesser General Public License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
##################################################################
use Data::Dumper;
use Fcntl qw(:flock SEEK_END);
use File::Path qw(mkpath rmtree);
use File::Basename qw(dirname);

my $Testplan_Init = "scripts/testplan";
my $Testplan = ".testplan";
my $TestplanLock = ".testplan.lock";
my $Date = getDate();
my $LogDir = "daily_log";
my %LogPath = (
    "0"=>$LogDir."/LOG-".$Date.".0",
    "1"=>$LogDir."/LOG-".$Date.".1"
);

sub getDate()
{
    my ($Sec,$Min,$Hour,$Mday,$Mon,$Year,$Wday,$Yday,$Isdst) = localtime(time);
    
    return (1900+$Year)."-".fNum($Mon+1)."-".fNum($Mday);
}

sub fNum($)
{
    my $Num = $_[0];
    
    if(length($Num)==1) {
        return "0".$Num;
    }
    
    return $Num;
}

sub writeFile($$)
{
    my ($Path, $Content) = @_;
    return if(not $Path);
    
    open(FILE, ">", $Path) || die ("can't open file \'$Path\': $!\n");
    print FILE $Content;
    close(FILE);
}

sub readFile($)
{
    my $Path = $_[0];
    return "" if(not $Path);
    
    open(FILE, "<", $Path) || die ("can't open file \'$Path\': $!\n");
    local $/ = undef;
    my $Content = <FILE>;
    close(FILE);
    
    return $Content;
}

sub runUpdate($$)
{
    my ($Library, $N) = @_;
    
    my $Log = $LogPath{$N};
    
    system("echo ".uc($Library)." >>".$Log);
    system("abi-monitor -get -build-new profile/$Library.json >>$Log 2>&1");
    system("abi-tracker -build profile/$Library.json >>$Log 2>&1");
    
    if(-f "graph/$Library/graph.png") {
        system("abi-tracker -build -target graph profile/$Library.json >>$Log 2>&1");
    }
}

sub getLibs()
{
    open(my $Lock, $TestplanLock) or die "Can't open testplan lock: $!";
    flock($Lock, LOCK_EX) or die "Can't lock testplan: $!\n";
    
    my $Content = eval(readFile($Testplan));
    my @Libs = ();
    
    foreach my $L (sort keys(%{$Content}))
    {
        if(not $Content->{$L})
        {
            foreach my $LE (split(";", $L)) {
                push(@Libs, $LE);
            }
            $Content->{$L} = 1;
            
            last;
        }
    }
    
    writeFile($Testplan, Dumper($Content));
    
    flock($Lock, LOCK_UN) or die "Can't unlock testplan: $!\n";
    close($Lock);
    
    return @Libs;
}

sub scenario()
{
    if(not -d "scripts")
    {
        print STDERR "ERROR: can't find ./scripts directory\n";
        exit(1);
    }
    
    mkpath($LogDir);
    
    unlink($LogPath{0});
    unlink($LogPath{1});

    my @List = split(/\s*\n\s*/, readFile($Testplan_Init));

    my %Hash = map {$_=>0} @List;
    writeFile($Testplan, Dumper(\%Hash));
    writeFile($TestplanLock, "This file is used to lock testplan");
    
    my $Pid = fork();
    
    if($Pid)
    {
        while(my @Ls = getLibs())
        {
            foreach my $L (@Ls) {
                runUpdate($L, 0);
            }
        }
    }
    else
    {
        while(my @Ls = getLibs())
        {
            foreach my $L (@Ls) {
                runUpdate($L, 1);
            }
        }
        exit(0);
    }
    
    waitpid($Pid, 0);
    
    unlink($Testplan);
    unlink($TestplanLock);
    
    system("abi-tracker -global-index");
    
    exit(0);
}

scenario();
