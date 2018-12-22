#!/bin/bash
#
#    Theme pack support for Sailfish OS - Enables theme pack support in Sailfish OS.
#    Copyright (C) 2015-2016  fravaccaro fravaccaro90@gmail.com - Initial release
#    Copyright (C) 2016  dfstorm dfstorm@riseup.net - Change from ImageMagik to Inkscape
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Usage
# Place some icons in scalable folders and launche this script from the root folder of the themepack.

# Resize Jolla stock icons
if [ "$(ls ./jolla/scalable/icons)" ]; then

    ls ./jolla/scalable/icons/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 86 -h 86 -e ./jolla/z1.0/icons/$destFile
            inkscape -f $file -w 108 -h 108 -e ./jolla/z1.25/icons/$destFile
            inkscape -f $file -w 129 -h 129 -e ./jolla/z1.5/icons/$destFile
            inkscape -f $file -w 129 -h 129 -e ./jolla/z1.5-large/icons/$destFile
            inkscape -f $file -w 151 -h 151 -e ./jolla/z1.75/icons/$destFile
            inkscape -f $file -w 172 -h 172 -e ./jolla/z2.0/icons/$destFile
        done
fi

# Resize native apps icons
if [ "$(ls ./native/scalable/apps)" ]; then
    ls ./native/scalable/apps/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 86 -h 86 -e ./native/86x86/apps/$destFile
            inkscape -f $file -w 108 -h 108 -e ./native/108x108/apps/$destFile
            inkscape -f $file -w 128 -h 128 -e ./native/128x128/apps/$destFile
            inkscape -f $file -w 256 -h 256 -e ./native/256x256/apps/$destFile
        done
fi

# Resize Android icons
if [ "$(ls ./apk/scalable)" ]; then
    ls ./apk/scalable/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 86 -h 86 -e ./apk/86x86/$destFile
            inkscape -f $file -w 128 -h 128 -e ./apk/128x128/$destFile
        done
fi

# Resize DynCal icons
if [ "$(ls ./dyncal/scalable/)" ]; then
    ls ./dyncal/scalable/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 86 -h 86 -e ./dyncal/86x86/$destFile
            inkscape -f $file -w 256 -h 256 -e ./dyncal/256x256/$destFile
        done
fi

# Resize DynClock icons
if [ "$(ls ./dynclock/scalable/)" ]; then
    ls ./dynclock/scalable/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 86 -h 86 -e ./dynclock/86x86/$destFile
            inkscape -f $file -w 256 -h 256 -e ./dynclock/256x256/$destFile
        done
fi

# Resize overlays
if [ "$(ls ./overlay/)" ]; then
    ls ./overlay/*.svg | while read file
        do
            filename=$(basename "$file")
            destFile=`echo $filename | sed 's/\.svg/\.png/'`
            inkscape -f $file -w 512 -h 512 -e ./overlay/$destFile
        done
fi
exit 0
