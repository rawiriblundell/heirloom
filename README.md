# heirloom
Personal fork of `heirloom` tools for Debian and Effing Package Manager (FPM)

This fork configures `heirloom` and its tools and files to reside in `/opt/heirloom`.  It also implements a couple of fixes from https://www.virtualbox.org/wiki/SolarisCrossCompiler.  The most important one (to me) being:

* fix the cpio command lines in libpkg/pkgtrans.c lines 1151, 1164, 1595 and 1827 to remove the "-D"

The existence of the "-D" argument for `cpio` causes `pkgtrans` to fail, as the `heirloom` version of `cpio` does not seem to have "-D" as an available argument.  It seems to have at some point been added, and at another point removed.

Ultimately I want to be able to use `fpm` on Debian to build Solaris packages.  For that, I need the `heirloom` pkgtools, and for that, I need the rest of the `heirloom` suite.  It was a pain in the ass to manually compile this on Debian, to the point that I considered finding some RPM's and throwing them at `alien`.

Now that this is building, however, I can (ironically?) build deb packages of `heirloom` with `fpm`.

## Installing
Clone the repo or download+extract the auto-generated zip.  Then simply:

`chmod +x install.sh`    
`./install.sh`

The install script is simple and stupid and doesn't cater for errors at all.  It will try to ensure your dependencies are installed, at least.

## Manually compiling
### Requirements
These were built on a Debian 8.1 64 bit VM that was already in use for `fpm`, so it had packages already that may be pre-requisites.  I'm going to guess `build-essential` is one of them, the others listed here had to be installed specifically for compiling `heirloom`:

* `build-essential`
* `libncurses5-dev`
* `ed`
* `bison`
* `libssl-dev`

These may also be useful:
* `flex`
* `gzip`
* `bzip2`
* `zlib1g-dev` or some other package(s) similar to `libz` plus `libbz2`

The various `make` files refer to needing a BSD compatible `install`, the GNU one seems to work perfectly fine.  One is provided by `heirloom` but... chicken and the egg situation.

### Order of compilation
The tools must be built in this order, after setting your `PATH` like so:

`PATH=$PATH:/opt/heirloom/bin`  
`export PATH`

* shell
* devtools
* toolchest
* pkgtools
* doctools (optional, requires devtools)

### Tips
If you get an error about inability to find `/sbin/sh` it means I possibly missed something.  You can work around it by declaring the shell like so:

`make SHELL=/opt/heirloom/bin/sh`

## Legal stuff
I have made no conscious licence violations, please notify me if I have.  Any changes that I have made are done so with the intent of remaining in accordance with, and in keeping the original licence(s) and copyright(s) of the changed files.  I am not attempting any relicencing etc conciously or not.

If you use this repository:
THIS SOFTWARE IS PROVIDED 'AS-IS', WITHOUT ANY EXPRESS OR IMPLIED
WARRANTY.  IN NO EVENT WILL THE AUTHORS BE HELD LIABLE FOR ANY DAMAGES
ARISING FROM THE USE OF THIS SOFTWARE.

If you fork this repository:
Please respect and keep the original licence(s) and copyright(s).

---

### Original heirloom documentation

From http://heirloom.sourceforge.net/index.html

#### The Heirloom Project

The Heirloom Project provides traditional implementations of standard Unix utilities. In many cases, they have been derived from original Unix material released as Open Source by Caldera and Sun.

Interfaces follow traditional practice; they remain generally compatible with System V, although extensions that have become common use over the course of time are sometimes provided. Most utilities are also included in a variant that aims at POSIX conformance.

On the interior, technologies for the twenty-first century such as the UTF-8 character encoding or OpenType fonts are supported.

The project includes the following components:

* The Heirloom Toolchest: awk, cpio, grep, tar, etc.
* The Heirloom Bourne Shell
* The Heirloom Documentation Tools: nroff, troff, dpost, etc.
* The Heirloom Development Tools: lex, yacc, m4, and SCCS
* Heirloom mailx
* The Heirloom Packaging Tools: pkgadd, pkgmk, etc.

—Why? Some people like to drive classic cars, others like to arrange their domiciles with period furniture. The Heirloom Project caters to people who like to operate their computers using a traditional Unix command line interface. The Heirloom Project is not a software museum; it does not attempt to preserve utilities unmodified. Rather, it keeps stylistic, algorithmic, and interface aspects intact while modernizing the framework as appropriate.

For example, the Heirloom Project provides the grep family of utilities with its traditional algorithm implementations, as they have appeared in the computer science literature: a grep utility with the NFA simulation originally derived from ed, an egrep utility with a directly constructed DFA simulation, and a fgrep utility with the original implementation of the Aho-Corasick algorithm. All of them have been modernized to support multibyte characters, have been relieved of static limits to the complexity of expressions, and have been embedded in a common framework that supports lines of unlimited length, recursive search in a directory hierarchy, and transparent handling of compressed files. Additionally, a POSIX-style grep utility is available; it uses the same framework with the regular expression library originating from SVR4.2MP.

Another example is the cpio utility, which keeps the traditional interface but has been rewritten with machine-independent read-write support for almost all known Unix archiving formats as well as zip archives. Again, as a tribute to POSIX, the same functionality is available with a pax utility.

In effect, the Heirloom Project makes it possible to perform today's work in a traditional Unix manner.

Gunnar Ritter <gunnarr@acm.org> 2007-01-05
