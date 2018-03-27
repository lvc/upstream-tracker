Upstream Tracker 2.2
====================

Upstream Tracker — a project to monitor and verify compatibility of upstream API/ABI changes in C/C++ libraries.

Web: https://abi-laboratory.pro/tracker/

Contents
--------

1. [ About           ](#about)
2. [ Requires        ](#requires)
3. [ Test Plan       ](#test-plan)
4. [ Daily Run       ](#daily-run)
5. [ Logs            ](#logs)
6. [ Publish Reports ](#publish-reports)
7. [ Add library     ](#add-library)

About
-----

JSON-format reports: https://github.com/lvc/abi-reports

The tool is developed by Andrey Ponomarenko: https://abi-laboratory.pro/

Requires
--------

* Perl 5
* ABI Tracker (1.11 or newer)
* ABI Monitor (1.12 or newer)
* ABI Compliance Checker (2.2 or newer)
* ABI Dumper (1.1 or newer)
* PkgDiff (1.7.2 or newer)

You can use the installer to automatically download from github and install necessary tools: https://github.com/lvc/installer

Test Plan
---------

The file `scripts/testplan` contains the list of libraries to be monitored. You can write several libraries in one line separated by semicolon if you want to handle these libraries one-by-one in the specific order on one CPU. Other libraries will be processed in parallel on different CPUs.

Daily Run
---------

This script is used to organize daily runs of the ABI Tracker and ABI Monitor tools:

    perl scripts/daily-run.pl -all

Logs
----

See logs in the `daily_log/` directory.

Publish Reports
---------------

You can copy reports to a hosting defined by `HOST_ADDR` and `HOST_DIR` variables in the `scripts/host.conf` file. The script will copy all necessary reports and styles (compressed as tar.gz) via scp to the hosting directory:

    perl scripts/copy-files.pl -fast [library]

Add library
-----------

Please report an issue if you'd like to add some open-source library to the tracker: https://github.com/lvc/upstream-tracker/issues

Enjoy!
