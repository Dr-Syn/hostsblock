hostsblock [Unbound sinkholing variant]
==========
An ad- and malware-blocking script for Linux, now modded to work with Unbound DNS

Instructions
-----------
First, install unbound. For debian and derivatives, this is:
>sudo apt-get install unbound

Then, clone this repo with
> git clone https://github.com/Dr-Syn/hostsblock.git

Then, change to the repo's directory and issue a make:
> cd hostsblock
> make all

Then, make install to complete the installation. You should be asked for a sudo password.
> make install

Finally, either reboot your system or execute the hostsblock script to initialize the blacklists:
> sudo /usr/bin/hostsblock.sh 

And you're done! Point any systems you want to use the sinkholed DNS to the IP of the system that you've installed this on, and it should work for you.

Description
-----------
**`Hostsblock`** is a bash script for Linux designed to take advantage of the [HOSTS file](https://en.wikipedia.org/wiki/Hosts_file) to provide [system-wide blocking](http://winhelp2002.mvps.org/hosts.htm) of internet advertisements, malicious domains, trackers, and other undesirable content. To do so, it downloads a configurable set of blocklists and processes and their entries into a singular HOSTS file.

`Hostsblock` also includes `hostsblock-urlcheck`, a command-line utility that allows you to block and unblock certain websites and any other domains contained in that website, in the event that the included blocklists don't block enough or block too little on a specific site.

Features
--------
* **System-wide blocking.** All non-proxied connections use the HOSTS file.
* **Zip- and 7zip-capable.** Can download and process zip- and 7zip-compressed files.
* **Non-interactive.** Can be run as a periodic cronjob or systemd service without needing user interaction.
* **Extensive configurability.** Allows for custom black and white listing, redirection, post-processing scripting, target HOSTS file, etc.
* **Bandwith-efficient.** Only downloads blocklists that have been changed, uses compression when available.
* **Resource-efficient.** Only processes blocklists when changes are registered, uses minimal pipes.
* **High performance blocking.** When using dns caching and pseudo-server daemons.
* **Extensive choice of blocklists included.** Allows user to customize how much or how little is blocked or redirected.
* **Redirection capability.** Combats [DNS cache poisoning](https://en.wikipedia.org/wiki/DNS_cache_poisoning).

Dependencies
------------
Hostsblock only requires a few utilities that are standard on most Linux distros, including GNU [bash](http://www.gnu.org/software/bash/bash.html), [curl](http://curl.haxx.se/), GNU [grep](http://www.gnu.org/software/grep/grep.html), GNU [sed](http://www.gnu.org/software/sed), and GNU [coreutils](http://www.gnu.org/software/coreutils).

This package -will- require that Unbound DNS be installed beforehand. It can be found [here](https://www.unbound.net/index.html)

Optional dependencies. Hostsblock allows for additional features if the following utilities are installed and in the path:

Unarchivers, so that archive blocklists can be used instead of just plaintext, e.g.:
* [unzip](http://www.info-zip.org/UnZip.html) for zip archives, AND
* [p7zip](http://p7zip.sourceforge.net/) for 7z archives (must include either 7z or 7za executables)

A pseudo-server that serves blank pages in order to remove the boilerplate page and speed up page resolution on blocked domains. Examples include:
* [kwakd](https://code.google.com/p/kwakd/) (recommended), OR
* [pixelserv](http://proxytunnel.sourceforge.net/pixelserv.php)

[Gzip](http://www.gnu.org/software/gzip/) or [pigz](http://www.zlib.net/pigz/) to compress backup files and the annotation database. 


TODO: Rewrite this into a proper daemon using the much more polite 'HEAD' verb to check whether lists have been updated rather than this 'GET' nonsense.
