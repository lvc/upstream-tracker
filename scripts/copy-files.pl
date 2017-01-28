#!/usr/bin/perl
##################################################################
# A script to transfer reports of the ABI Tracker to hosting
#
# Copyright (C) 2015-2017 Andrey Ponomarenko's ABI Laboratory
#
# Written by Andrey Ponomarenko
#
# PLATFORMS
# =========
#  Linux
#
# REQUIREMENTS
# ============
#  Perl 5
#  ssh
#  scp
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
use Getopt::Long;
Getopt::Long::Configure ("posix_default", "no_ignore_case", "permute");
use File::Basename qw(dirname);
use Cwd qw(cwd);
use strict;

my $Testplan_Init = "scripts/testplan";

my $HostAddr = undef;
my $HostDir = undef;

my $ORIG_DIR = cwd();
my $JREPORTS = "abi-reports/report";

my %Opt;

GetOptions(
    "fast!" => \$Opt{"Fast"}, # 3 times faster but 3 times more web traffic
    "json!" => \$Opt{"Json"}
) or exit(1);

my $Target = undef;
if(@ARGV) {
    $Target = $ARGV[0];
}

sub initHosting()
{
    my $HostInfo = readFile("scripts/host.conf");
    
    if($HostInfo=~/HOST_ADDR\s*\=\s*(.+)/) {
        $HostAddr = $1;
    }
    
    if($HostInfo=~/HOST_DIR\s*\=\s*(.+)/) {
        $HostDir = $1;
    }
    
    if(not $HostAddr or not $HostDir)
    {
        print STDERR "ERROR: please init HOST_ADDR and HOST_DIR in host.conf\n";
        exit(1);
    }
}

sub readFile($)
{
    my $Path = $_[0];
    
    open(FILE, "<", $Path) || die ("can't open file \'$Path\': $!\n");
    local $/ = undef;
    my $Content = <FILE>;
    close(FILE);
    
    return $Content;
}

sub sendPackage($)
{
    my $Pkg = $_[0];
    
    if(not $Pkg or $Pkg eq "." or $Pkg eq "/") {
        return;
    }
    
    system("scp $Pkg $HostAddr:$HostDir");
    if($?) {
        print STDERR "ERROR: failed to send package\n";
    }
    
    system("ssh $HostAddr \"cd $HostDir && tar -xf $Pkg && rm -f $Pkg\"");
    if($?) {
        print STDERR "ERROR: failed to extract package\n";
    }
    
    return 1;
}

sub sendFiles(@)
{
    my @Files = @_;
    
    my ($Ext, $Opt) = ("txz", "cJf");
    if(defined $Opt{"Fast"}) {
        ($Ext, $Opt) = ("tgz", "czf");
    }
    
    my $Pkg = "update.package.$Ext";
    system("tar -$Opt $Pkg ".join(" ", @Files)." --exclude='*.json'");
    
    sendPackage($Pkg);
    unlink($Pkg);
}

sub scenario()
{
    if(not -d "scripts")
    {
        print STDERR "ERROR: can't find ./scripts directory\n";
        exit(1);
    }
    
    initHosting();
    
    my @List = split(/\s*\n\s*/, readFile($Testplan_Init));
    my @List_F = ();
    
    foreach my $L (@List)
    {
        foreach my $LL (split(/;/, $L))
        {
            push(@List_F, $LL);
        }
    }
    
    if(defined $Target)
    {
        if(not grep {$_ eq $Target} @List_F)
        {
            print STDERR "WARNING: the library \'$Target\' is not presented in the testplan\n";
            
            if(not -d "timeline/".$Target)
            {
                print STDERR "ERROR: there is no report for \'$Target\'\n";
                exit(1);
            }
            
            @List_F = ($Target);
        }
    }
    
    foreach my $L (@List_F)
    {
        if(defined $Target)
        {
            if($L ne $Target) {
                next;
            }
        }
        
        print "Copy $L\n";
        
        my @Files = ("timeline/$L", "objects_report/$L", "compat_report/$L");
        if(-d "package_diff/$L") {
            push(@Files, "package_diff/$L");
        }
        if(-d "changelog/$L") {
            push(@Files, "changelog/$L");
        }
        if(-d "objects_view/$L") {
            push(@Files, "objects_view/$L");
        }
        if(-d "abi_view/$L") {
            push(@Files, "abi_view/$L");
        }
        if(-d "headers_diff/$L") {
            push(@Files, "headers_diff/$L");
        }
        if(-d "graph/$L") {
            push(@Files, "graph/$L");
        }
        
        sendFiles(@Files);
    }
    
    my @Other = ("index.html", "css");
    if(-d "js") {
        push(@Other, "js");
    }
    
    sendFiles(@Other);
    system("ssh $HostAddr \"cd $HostDir && sed -i -e \'s/index\.html//\' index.html\"");
    
    if(defined $Opt{"Json"})
    {
        chdir($JREPORTS);
        system("git diff --exit-code || git pull && git add . && git commit -m 'AUTO update of reports' && git push");
        chdir($ORIG_DIR);
    }
    
    exit(0);
}

scenario();
