<img src="https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/mylogos/myunofficialChocolateylogo_icon.png" width="139" height="88">

**BCURRAN3'S PACKAGE NOTES:**

* A BCURRAN3 original!
* I personally use and endorse this script.
* In your header and footer files, if you want to add lines above and below your header and/or footer text like I do, I recommend using "___" for a line in markdown as apposed to "***" or "---". Chocolatey.org's package pages are fickle with "***" and "---" where sometimes the lines will be different shades of gray. "___" seems to consistently get displayed as a dark gray line. I've played with white space before and after "***" and "---" and I can't find any rhyme or reason to why I'll get a light gray line in one place and a dark gray line in another. I give up. "___" works.

***
[choco://choco-nuspec-checker](choco://choco-nuspec-checker)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support ](https://chocolatey.org/packages/choco-protocol-support)
***
	
![Screenshot of (unofficial) Chocolatey .nuspec Checker (Script)](https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/choco-nuspec-checker/choco-nuspec-checker_screenshot.png)

##**choco-nuspec-checker** (**CNC**) is a PowerShell script I designed for Chocolatey package maintainers/creators to check Chocolatey .nuspec files for common errors and omissions... and automatically fix most of them! Find out AND FIX what the Chocolatey validator is going to tell you BEFORE you submit your package. **CNC** also goes beyond it's original scope and checks for common Chocolatey install/uninstall script errors and omissions as well.

###FEATURES:
* **CNC** checks all .nuspec elements and reports any missing or template default values
* **CNC** checks for all verifier messages (guidelines, suggestions, and notes) and reports them if applicable
* **CNC** checks for dead URLs and reports them
* **CNC** checks for GitHub direct links, reports them, and can convert them to various CDN URLs (default=Staticaly)
* **CNC** checks for RawGit CDN links, reports them, and can convert them to various CDN URLs (default=Staticaly)
* **CNC** can open all your .nuspec element URLs in your default browser for quick viewing
* **CNC** can add a standard template header and/or footer to your .nuspec description and replace tokens in it
* **CNC** checks nuspec and PowerShell scripts for correct UTF-8 encoding and reports if the encoding is incorrect
* **CNC** can re-write your nuspec in UTF-8 w/o BOM format
* **CNC** can re-write your PowerShell scripts in UTF-8 w/ BOM format
* **CNC** checks all your PowerShell scripts for syntax errors
* **CNC** checks for and can add $ErrorActionPreference = 'Stop' to your PowerShell scripts
* **CNC** can optimize PNG files in your nuspec directory if PNGOptimizer.commandline is installed

###Helps make packaging Chocolateasy!

###INSTRUCTIONS:
* **CNC -help** for help with options and switches
* Run **CNC** to check the .nuspec in your current directory, run **CNC X:\SOMEWHERE** to check the .nuspec in that directory. (Do not specify the file, just the directory.)
* To check all your packages' .nuspec files, change to the root directory of your packages, and via PowerShell run **Get-ChildItem | ?{if ($__.PSIsContainer){cls;cd $__.Name;cnc;cd ..;pause}}**
* To update all your packages' .nuspec files, change to the root directory of your packages, and via PowerShell run **Get-ChildItem | ?{if ($__.PSIsContainer){cd $__.Name;cnc -UpdateAll;cd ..}}** (no clear screen or pausing)

**[PACKAGE NOTES](https://github.com/bcurran3/ChocolateyPackages/blob/master/choco-nuspec-checker/readme.md)**

**If you find choco-nuspec-checker useful please consider donating: https://www.paypal.me/bcurran3donations or become a patron at https://www.patreon.com/bcurran3**

###KNOWN BUG:	
* CNC doesn't yet know how to handle multiple .nuspec files found in the same directory.
	
###CHANGELOG:
* 2019.08.21 - added checking for package release notes in description (ability to add them is coming in a future version)
* 2019.08.14 - now validates the nuspec as a valid XML file and reports common errors, notifies if there is a submitted/unapproved version on chocolatey.org, better checking for failed and trusted package notifications 
* 2019.08.13 - minor fix to cinst checking in chocolateyinstall.ps1
* 2019.03.04 - now checks for msiexec calls in scripts, checks for correctly named install script, checks that install scripts don't use choco commands, checks the XML namespace/schema, cosmetic changes
* 2019.02.22 - now notifies if the package is trusted and if the package is failing tests on chocolatey.org, -OptimizePNGs superseded by -OptimizeImages which will now optimize BMP, GIF, and TGA files as well as PNG files, added checking for FossHub download links in chocolateyInstall.ps1, more minor tweaks
* 2019.02.18 - now checks download URLs in install scripts, minor message updates
* 2019.02.16 - -UpdateScripts will re-write PowerShell scripts to UTF-8 w/BOM (even if EAP statement doesn't need to be added), now checks for and reports templated values, adding the XML UTF-8 check comment now implemented, more updates to summary, added checking for SourceForge download links in chocolateyInstall.ps1, -MakeBackups option to create *.CNC.bak files - this is a breaking change from v2019.01.29 where making backups was default, check for CDATA in description and parse it for problems but not change it when saving, some more tweaks that I forgot before writing this
* 2019.02.04 - New --UpdateScripts will add EAP statement to script files and re-write out to UTF-8 w/BOM, New -UseGitHack, -UseGitCDN, and -UsejsDelivr allows you to use image CDNs other than Staticaly (default), **CNC** now gives a summary count of warnings and fixes, now checks for header/footer before adding so duplicates aren't created, now checks all PowerShell scripts (previously only chocolateyinstall/uninstall), cosmetic changes to highlight required changes
* 2019.01.29 - you can now use the following tokens in your header and footer files: $NuspecAuthors, $NuspecID, $NuspecOwners, $NuspecTitle, and $NuspecVersion - they will be parsed and replaced with the values from your nuspec file, added checking iconUrl image dimensions, new -OptimizePNGs option to run PNGOptimizerCL (if installed via Chocolatey) on PNG files in nuspec dir, added checking for lack of BOM in install/uninstall scripts, added checking for $ErrorActionPreference statement in install/uninstall scripts, now aborts when there are multiple nuspec files found in the same directory, now aborts if nuspec appears corrupt, cosmetic enhancements
* 2019.01.26 - **CNC is now considered "Ready for Prime Time."** (I still have more updates planned.) **CNC** can now write changes to your nuspec file including the iconUrl, description, and XML declaration (Finally!!!), added ability to update the XML declaration, added -UpdateAll and -Update options, updates are written as UTF-8 w/o BOM, cleaned up UTF-8 reporting, added PowerShell syntax error checking of chocolateyInstall.ps1 and chocolateyUninstall.ps1, new -WhatIf option for testing without saving changes, the normal minor tweaks and cosmetic changes. I will keep making it better though, of course.
* 2019.01.22 - added XML declaration and UTF-8 comment checking, better dependency version checking, a rare verifier message I missed
* 2019.01.15 - you can now specify a path to a directory containing a .nuspec file to check, misc minor tweaks
* 2019.01.13 - finished the dependencies checking, all verifier messages (guidelines, suggestions, and notes) now reporting in **CNC**
* 2019.01.12 - minor fixes
* 2019.01.09 - many more checks and warnings added, almost all known verifier guidelines, suggestions and notes added, some beautifications, added option to view Chocolatey validator info page, added optional image GitHub direct and RawGit URL conversions to Staticaly CDN URLs
* 2019.01.07 - added help, added option to open and view all URLs in your default browser, added options to view, edit, and add "standard" (template) headers and footers to the description (can't save yet), added reporting of standard header and footer if found, added more verifier messages, added checking for descriptions that are too large (&gt;4,000), now checks for license files other than LICENSE.txt, probably more I don't remember :)
* 2019.01.04 - implemented included binary files checking and messages, laid out the groundwork for the future enhancements
* 2019.01.03 - fixed some URL checking handling that could cause PS errors, updated list of CDN recommendations, added checking for RawGit URLs in description, cosmetic updates
* 2018.12.22-2018-12.28 - initial release

###ROADMAP:
* capture and test URLs found in description
* add packaging tips/tweaks/etc

***

Like my [original Chocolatey add-ons and packages](https://chocolatey.org/search?q=tag%3Abcurran3)? or my [400+ other program packages](https://chocolatey.org/profiles/bcurran3)? Find them useful? Appreciate my hard work, time, and effort?


<h1>How about buying me a <img src="https://cdn.rawgit.com/bcurran3/ChocolateyPackages/master/mylogos/beer.png" alt="" width="40" height="40"> via PayPal?</h1>

[![PayPal Donate](https://www.paypalobjects.com/webstatic/mktg/logo/AM_SbyPP_mc_vs_dc_ae.jpg)](https://www.paypal.me/bcurran3donations)

<h1>Better yet... Keep me incentivized by Patreonizing me!</h1>

[![Patreonize me!](https://c5.patreon.com/external/logo/downloads_wordmark_white_on_coral.png)](https://www.patreon.com/bcurran3)


If applicable, please always consider donating or purchasing the software you installed - including [Chocolatey's licensed editions](https://chocolatey.org/pricing).

<h3>TIA,</h3>

<h3>Bill</h3>




=======
<img src="https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/InstChoco/InstChoco_icon.png" width="139" height="88">

**BCURRAN3'S PACKAGE NOTES:**

* A BCURRAN3 original!
* I personally use and endorse this extension.

![Screenshot of Chocolatey Toast Notifications Extension](https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/chocolatey-toast-notifications.extension_extras/chocolatey-toast-notifications.extension_screenshot.png)

###It's HERE! The 100% Chocolatey user OPT-IN toast notification extension for Chocolatey and Windows 10 (only).

##**Chocolatey Toast Notifications Extension** is a Chocolatey extension that displays a toast notification after installing or uninstalling a program. This extension will start working automatically once installed and does NOT need to be implemented by package creators/maintainers. **Chocolatey Toast Notifications Extension** is meant to be installed and used directly by Chocolatey end users.

###PURPOSE:

* Chocogeeky fun!

###FEATURES: 
* **Chocolatey Toast Notifications Extension** will display a toast notification with the package name, program name, program version, status message (installed or uninstalled), and a link to the package page on the chocolatey.org website after a program is installed or uninstalled.

###WHAT IT WON'T DO:
* **Chocolatey Toast Notifications Extension** will NOT work on anything other than Windows 10, this is a limitation of the [BurntToast](https://github.com/Windos/BurntToast) PowerShell module and its use of the [UWP Community Toolkit](https://github.com/Microsoft/WindowsCommunityToolkit). (Yes, I tried it on Windows Server 2016 and it did NOT work.)
* **Chocolatey Toast Notifications Extension** will NOT display messages for programs that don't use standard installers, i.e. portable programs.
* **Chocolatey Toast Notifications Extension** will NOT display messages for programs installed/uninstalled via any background processes; i.e. my **[choco-upgrade-all-at-startup](https://chocolatey.org/packages/choco-upgrade-all-at-startup)**, **[choco-upgrade-all-at](https://chocolatey.org/packages/choco-upgrade-all-at)**, and **[choco-persistent-packages](https://chocolatey.org/packages/choco-persistent-packages)** packages... YET!

**[PACKAGE NOTES](https://github.com/bcurran3/ChocolateyPackages/blob/master/chocolatey-toast-notifications.extension/readme.md)**

***
**Click here to [Patreon-ize](https://www.patreon.com/bcurran3) the package maintainer.**
***

###CHANGE LOG:
* 0.0.3 - Notifications will now display in the foreground when sent from a background task using the system account.
* 0.0.2 - baked in compatibility with [chocolatey-preinstaller-checks.extension](https://chocolatey.org/packages/chocolatey-preinstaller-checks.extension) if installed
* 0.0.1 - initial release

###ROADMAP:
* Possibly make it Windows 8 compatible after packaging up an old version of [BurntToast](https://github.com/Windos/BurntToast)
* Possibly make it Windows Server 2016 compatible.
* Attempt to make it work with PORTABLE packages as well.

***

Like my [original Chocolatey add-ons and packages](https://chocolatey.org/search?q=tag%3Abcurran3)? or my [400+ other program packages](https://chocolatey.org/profiles/bcurran3)? Find them useful? Appreciate my hard work, time, and effort?


<h1>How about buying me a <img src="https://cdn.rawgit.com/bcurran3/ChocolateyPackages/master/mylogos/beer.png" alt="" width="40" height="40"> via PayPal?</h1>

[![PayPal Donate](https://www.paypalobjects.com/webstatic/mktg/logo/AM_SbyPP_mc_vs_dc_ae.jpg)](https://www.paypal.me/bcurran3donations)

<h1>Better yet... Keep me incentivized by Patreonizing me!</h1>

[![Patreonize me!](https://c5.patreon.com/external/logo/downloads_wordmark_white_on_coral.png)](https://www.patreon.com/bcurran3)


If applicable, please always consider donating or purchasing the software you installed - including [Chocolatey's licensed editions](https://chocolatey.org/pricing).

<h3>TIA,</h3>

<h3>Bill</h3>




=======
<<<<<<< HEAD
<img src="https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/mylogos/myunofficialChocolateylogo_icon.png" width="139" height="88">

**BCURRAN3'S PACKAGE NOTES:**

* A BCURRAN3 original!
* I personally use and endorse this script.
* In your header and footer files, if you want to add lines above and below your header and/or footer text like I do, I recommend using "___" for a line in markdown as apposed to "***" or "---". Chocolatey.org's package pages are fickle with "***" and "---" where sometimes the lines will be different shades of gray. "___" seems to consistently get displayed as a dark gray line. I've played with white space before and after "***" and "---" and I can't find any rhyme or reason to why I'll get a light gray line in one place and a dark gray line in another. I give up. "___" works.

***
[choco://choco-nuspec-checker](choco://choco-nuspec-checker)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support ](https://chocolatey.org/packages/choco-protocol-support)
***
	
![Screenshot of (unofficial) Chocolatey .nuspec Checker (Script)](https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/choco-nuspec-checker/choco-nuspec-checker_screenshot.png)

***	
[choco://choco-nuspec-checker](choco://choco-nuspec-checker)
To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support ](https://chocolatey.org/packages/choco-protocol-support)
***
	
![Screenshot of (unofficial) Chocolatey .nuspec Checker (Script)](https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/choco-nuspec-checker/choco-nuspec-checker_screenshot.png)

#**choco-nuspec-checker** (**CNC**) is a PowerShell script designed for Chocolatey package maintainers/creators to check Chocolatey .nuspec files for common errors and ommisions. Find out what the Chocolatey validator is going to tell you BEFORE you submit your package. 

###FEATURES:
* **CNC** checks for all .nuspec elements and reports any missing
* **CNC** checks for all verifier messages (guidelines, suggestions, and notes) and reports them if applicable
* **CNC** checks for dead URLs and reports them
* **CNC** checks for GitHub direct links, reports them, and can convert them to Staticaly CDN URLs
* **CNC** checks for RawGit CDN links, reports them, and can convert them to Staticaly CDN URLs
* **CNC** can open all your .nuspec element URLs in your default browser for quick viewing
* **CNC** can add a standard template header and/or footer to your .nuspec description
* **CNC** checks for UTF-8 encoding and reports the type of encoding if not UTF-8
* **CNC** can re-write your nuspec in UTF-8 w/o BOM format (default for all updates)
* **CNC** checks your chocolateyInstall.ps1 and chocolateyUninstall.ps1 for PowerShell syntax errors (default=no)

###Helps make packaging Chocolateasy!

###INSTRUCTIONS:
* **CNC -help** for help with options and switches
* Run **CNC** to check the .nuspec in your current directory, run **CNC X:\SOMEWHERE** to check the .nuspec in that directory. (Do not specify the file, just the directory.)
* To check all your packages' .nuspec files, change to the root directory of your packages, and via PowerShell run **Get-ChildItem | ?{if ($__.PSIsContainer){cls;cd $__.Name;cnc;cd ..;pause}}**
* To update all your packages' .nuspec files, change to the root directory of your packages, and via PowerShell run **Get-ChildItem | ?{if ($__.PSIsContainer){cd $__.Name;cnc -UpdateAll;cd ..}}** (no clear screen or pausing)

**[PACKAGE NOTES](https://github.com/bcurran3/ChocolateyPackages/blob/master/choco-nuspec-checker/readme.md)**

**If you find choco-nuspec-checker useful please consider donating: https://www.paypal.me/bcurran3donations or become a patron at https://www.patreon.com/bcurran3**

###KNOWN BUG:	
* CNC doesn't yet know how to handle multiple .nuspec files found in the same directory.
	
###CHANGELOG:
* 2019.01.26 - **CNC is now considered "Ready for Prime Time."** (I still have more updates planned.) **CNC** can now write changes to your nuspec file including the iconUrl, description, and XML declaration (Finally!!!), added ability to update the XML declaration, added -UpdateAll and -Update options, updates are written as UTF-8 w/o BOM, cleaned up UTF-8 reporting, added PowerShell syntax error checking of chocolateyInstall.ps1 and chocolateyUninstall.ps1, new -WhatIf option for testing without saving changes, the normal minor tweaks and cosmetic changes. I will keep making it better though, of course.
* 2019.01.22 - added XML declaration and UTF-8 comment checking, better dependency version checking, a rare verifier message I missed
* 2019.01.15 - you can now specify a path to a directory containing a .nuspec file to check, misc minor tweaks
* 2019.01.13 - finished the dependencies checking, all verifier messages (guidelines, suggestions, and notes) now reporting in **CNC**
* 2019.01.12 - minor fixes
* 2019.01.09 - many more checks and warnings added, almost all known verifier guidelines, suggestions and notes added, some beautifications, added option to view Chocolatey validator info page, added optional image GitHub direct and RawGit URL conversions to Staticaly CDN URLs
* 2019.01.07 - added help, added option to open and view all URLs in your default browser, added options to view, edit, and add "standard" (template) headers and footers to the description (can't save yet), added reporting of standard header and footer if found, added more verifier messages, added checking for descriptions that are too large (&gt;4,000), now checks for license files other than LICENSE.txt, probably more I don't remember :)
* 2019.01.04 - implemented included binary files checking and messages, laid out the groundwork for the future enhancements
* 2019.01.03 - fixed some URL checking handling that could cause PS errors, updated list of CDN recommendations, added checking for RawGit URLs in description, cosmetic updates
* 2018.12.22-2018-12.28 - initial release

###ROADMAP:
* capture and test URLs found in description
* add packaging tips/tweaks/etc

***

Like my [original Chocolatey add-ons and packages](https://chocolatey.org/search?q=tag%3Abcurran3)? or my [400+ other program packages](https://chocolatey.org/profiles/bcurran3)? Find them useful? Appreciate my hard work, time, and effort?


<h1>How about buying me a <img src="https://cdn.rawgit.com/bcurran3/ChocolateyPackages/master/mylogos/beer.png" alt="" width="40" height="40"> via PayPal?</h1>

[![PayPal Donate](https://www.paypalobjects.com/webstatic/mktg/logo/AM_SbyPP_mc_vs_dc_ae.jpg)](https://www.paypal.me/bcurran3donations)

<h1>Better yet... Keep me incentivized by Patreonizing me!</h1>

[![Patreonize me!](https://c5.patreon.com/external/logo/downloads_wordmark_white_on_coral.png)](https://www.patreon.com/bcurran3)


If applicable, please always consider donating or purchasing the software you installed - including [Chocolatey's licensed editions](https://chocolatey.org/pricing).

<h3>TIA,</h3>

<h3>Bill</h3>




=======
<img src="https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/InstChoco/InstChoco_icon.png" width="139" height="88">

**BCURRAN3'S PACKAGE NOTES:**

* A BCURRAN3 original!
* I personally use and endorse this extension.

![Screenshot of Chocolatey Toast Notifications Extension](https://cdn.staticaly.com/gh/bcurran3/ChocolateyPackages/master/chocolatey-toast-notifications.extension_extras/chocolatey-toast-notifications.extension_screenshot.png)

###It's HERE! The 100% Chocolatey user OPT-IN toast notification extension for Chocolatey and Windows 10 (only).

##**Chocolatey Toast Notifications Extension** is a Chocolatey extension that displays a toast notification after installing or uninstalling a program. This extension will start working automatically once installed and does NOT need to be implemented by package creators/maintainers. **Chocolatey Toast Notifications Extension** is meant to be installed and used directly by Chocolatey end users.

###PURPOSE:

* Chocogeeky fun!

###FEATURES: 
* **Chocolatey Toast Notifications Extension** will display a toast notification with the package name, program name, program version, status message (installed or uninstalled), and a link to the package page on the chocolatey.org website after a program is installed or uninstalled.

###WHAT IT WON'T DO:
* **Chocolatey Toast Notifications Extension** will NOT work on anything other than Windows 10, this is a limitation of the [BurntToast](https://github.com/Windos/BurntToast) PowerShell module and its use of the [UWP Community Toolkit](https://github.com/Microsoft/WindowsCommunityToolkit). (Yes, I tried it on Windows Server 2016 and it did NOT work.)
* **Chocolatey Toast Notifications Extension** will NOT display messages for programs that don't use standard installers, i.e. portable programs.
* **Chocolatey Toast Notifications Extension** will NOT display messages for programs installed/uninstalled via any background processes; i.e. my **[choco-upgrade-all-at-startup](https://chocolatey.org/packages/choco-upgrade-all-at-startup)**, **[choco-upgrade-all-at](https://chocolatey.org/packages/choco-upgrade-all-at)**, and **[choco-persistent-packages](https://chocolatey.org/packages/choco-persistent-packages)** packages... YET!

**[PACKAGE NOTES](https://github.com/bcurran3/ChocolateyPackages/blob/master/chocolatey-toast-notifications.extension/readme.md)**

***
**Click here to [Patreon-ize](https://www.patreon.com/bcurran3) the package maintainer.**
***

###CHANGE LOG:
* 0.0.3 - Notifications will now display in the foreground when sent from a background task using the system account.
* 0.0.2 - baked in compatibility with [chocolatey-preinstaller-checks.extension](https://chocolatey.org/packages/chocolatey-preinstaller-checks.extension) if installed
* 0.0.1 - initial release

###ROADMAP:
* Possibly make it Windows 8 compatible after packaging up an old version of [BurntToast](https://github.com/Windos/BurntToast)
* Possibly make it Windows Server 2016 compatible.
* Attempt to make it work with PORTABLE packages as well.

***

Like my [original Chocolatey add-ons and packages](https://chocolatey.org/search?q=tag%3Abcurran3)? or my [400+ other program packages](https://chocolatey.org/profiles/bcurran3)? Find them useful? Appreciate my hard work, time, and effort?


<h1>How about buying me a <img src="https://cdn.rawgit.com/bcurran3/ChocolateyPackages/master/mylogos/beer.png" alt="" width="40" height="40"> via PayPal?</h1>

[![PayPal Donate](https://www.paypalobjects.com/webstatic/mktg/logo/AM_SbyPP_mc_vs_dc_ae.jpg)](https://www.paypal.me/bcurran3donations)

<h1>Better yet... Keep me incentivized by Patreonizing me!</h1>

[![Patreonize me!](https://c5.patreon.com/external/logo/downloads_wordmark_white_on_coral.png)](https://www.patreon.com/bcurran3)


If applicable, please always consider donating or purchasing the software you installed - including [Chocolatey's licensed editions](https://chocolatey.org/pricing).

<h3>TIA,</h3>

<h3>Bill</h3>
