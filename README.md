This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag



-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------

Matrix42 AG
Elbinger Straße 7
60487 Frankfurt am Main
Deutschland
Tel.: +49 (0)69 6677 38 380
Fax: +49 (0)69 6677 88 657
E-Mail: info@matrix42.de
Web: https://www.matrix42.com/


-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
Unified Endpoint Management; Empirum

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
The Matrix42 product is comparable to Microsoft SCCM to deploy operating systems in enterprise environments within a corporate network. Our customers use the product Matrix42 Unified Endpoint Management, and here the Empirum OS Installer module to install virtual hardware, personal computers or laptops with a Windows 7 or Windows 10 operating system - including Secure Boot. Our Tool is using a linux based Preinstallation Environment, called EPE, for installation Linux or Windows based operating systems in the customer’s environment. We’d like to use SHIM to support secure boot for os deployments via PXE scenarios in corporate environments. For example an OEM Hardware is delivered with activated secure boot  by default and this includes the PXE boot. It is important to understand that our customers are deploying many computers at the same time, which requires a full unattended and silent installation process. Therefore it is necessary to support OS installations without manual steps - or interruptions -  and without the need to configure BIOS/UEFI options.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------

- Name:             Andreas Wolf
- Position:         Developer
- Email address:    andreas.wolf@matrix42.com

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------

- Name:             Joachim Knoth
- Position:         Product Manager
- Email address:    joachim.knoth@matrix42.com

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
d9a4c912c0aa72905ca793b555dcb0afb33e3b30

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
The binary was build from:
https://matrix42.visualstudio.com/DefaultCollection/IM/_git/M42Shim

The (copied) code can be found here:
https://github.com/matrix42epe/shim-review

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
This state was improved by some changes to add some network boot related capabilities.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------

- Ubuntu          16.04.4 Kernel 4.4.0-98-generic
- gcc version     5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.4) 
- binutils        2.26.1-1ubuntu1~16.04.4
- gnu-efi         3.0.2-1ubuntu1

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
buildlogs\Shim-logs_96569\

-------------------------------------------------------------------------------
Put info about what bootloader you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------
It is Grub2 2.02~beta2-36ubuntu3 (https://anonscm.debian.org/cgit/pkg-grub/grub.git/commit/?id=b070b9f34bf10ed2fa57d2774b42a82949a9492a) plus some secure boot patch.
Our Grub patches added to Grub\patches. Grub build logs can be found in buildlogs\Grub-logs_89645.

-------------------------------------------------------------------------------
Put info about what kernel you're using, including which patches it includes to enforce Secure Boot here:
-------------------------------------------------------------------------------

4.13.2 and above
The Linux Kernel we are using is configured to only load a module, if it is signed with the signing key generated during kernel build. So it is impossible to load any module which is not provided by Matrix42. The default policy set by the Kernel is: FORCE (CONFIG_MODULE_SIG_FORCE=yes)




