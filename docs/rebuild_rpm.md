######################################################################
#                                                                    #
#  How to rebuild Mullvad VPN 2024.1 for openSUSE Tumbleweed & Leap  #
#                                                                    #
######################################################################

1) Downloading the original RPM from server:

   wget https://mullvad.net/media/app/MullvadVPN-2024.1_x86_64.rpm

2) Testing if installation will fail and list all required/missing packages:

   sudo rpm -ivh --test MullvadVPN-2024.1_x86_64.rpm

   The result will display something like this error message on Tumbleweed or Leap:

   error : Dependencies required:
           dbus-libs needed by mullvad-vpn-2024.1-1.x86_64

   However, as original RPM is build only to be compatible with Fedora, dbus-libs package must be renamed libdbus-1-3 on
   Tumbleweed & Leap, otherwise it will cause the installation to fail. If you force installation by ignoring dependencies,
   Mullvad VPN will work but annoying dependencies errors will always be reported later. Is not the recommended method!
   Rebuild the RPM for Tumbleweed or Leap with RPMRebuild utility is a much better solution.

3) Installation of RPMRebuild package:

   sudo zypper install rpmrebuild

4) Use the following command to edit specfile of original RPM package:

   sudo rpmrebuild -enp MullvadVPN-2024.1_x86_64.rpm

5) In RPM specfile, all packages name will be listed in alphabetic order. With RPMRebuild you'll have just to rename dbus-libs
   package (Fedora/CentOS) to libdbus-1-3 (Tumbleweed/Leap equivalence). What do you have to do:

   Type [Inser] key to switch between insert/replace mode (it uses ViM text editor). Use cursor keys to go to line #56, search
   for "Requires: dbus-libs" and rename to "Requires: libdbus-1-3"

   Alternatively, you can also rename "Requires: libnotify" to "Requires: libnotify4" (even if it works fine without this). I will
   do it in my future Mullvad VPN rebuilds.

   When all modifications are finished, use [Esc] key to end and type :x letters to exit edition and start to build the new rpm.
   It will be created in the /usr/src/packages/RPMS/x86_64/ folder. The new rpm filename will be: mullvad-vpn-2024.1-1.x86_64.rpm

6) Now it's time to testing if the new RPM have all required dependencies:

   sudo rpm -ivh --test mullvad-vpn-2024.1-1.x86_64.rpm

   The final result should be:
   Verifying...                         ################################# [100%]
   Preparation...                       ################################# [100%]

7) Installation of the new package on Tumbleweed or Leap with Zypper, Rpm or YaST Software:

   sudo zypper install -f --allow-unsigned-rpm mullvad-vpn-2024.1-1.x86_64.rpm
or
   sudo rpm -ivh --force --nosignature mullvad-vpn-2024.1-1.x86_64.rpm

or with YaST (a warning box will inform you that the package header is unsigned, ignore this to start installation)


[bernado82] for Mullvad VPN users on Tumbleweed or Leap
"ChipTunes etc..." is my public playlist for Spotify (a truncated version is on Deezer also) with nearly 1800 titles and
over 110 hours of listening, go to: https://open.spotify.com/playlist/1juVxm3beomqM38isNZRIj
