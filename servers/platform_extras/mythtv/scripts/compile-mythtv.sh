#!/bin/bash

# Compile MythTV
# Copyright (C) 2011 British Broadcasting Corporation    
#
# This code may be used under the terms of either of the following  
# licences:  
#       
# 1) GPLv2:  
# 
#   This program is free software; you can redistribute it and/or modify  
#   it under the terms of the GNU General Public License as published by  
#   the Free Software Foundation; either version 2 of the License, or  
#   (at your option) any later version.  
# 
#   This program is distributed in the hope that it will be useful,  
#   but WITHOUT ANY WARRANTY; without even the implied warranty of  
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
#   GNU General Public License for more details.  
# 
#   You should have received a copy of the GNU General Public License along  
#   with this program; if not, write to the Free Software Foundation, Inc.,  
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.  
#
#
# 2) Apache 2.0:  
#                                         
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#


IROOT=`pwd`/install-root
# Compile MythTV
echo ""
echo ""
echo "----------------"
echo "COMPILING MYTHTV"
echo "----------------"
echo ""
echo ""
cd mythtv-source/mythtv || exit 1
./configure --enable-audio-alsa --prefix=/usr || exit 1
make -j 2
if [ $? != 0 ]
then
    exit 1
fi
make INSTALL_ROOT=$IROOT install || exit 1
cd ../.. || exit 1

# Compile MythPlugins
echo ""
echo ""
echo "---------------------"
echo "COMPILING MYTHPLUGINS"
echo "---------------------"
echo ""
echo ""
cd mythtv-source/mythplugins || exit 1
./configure --prefix=/usr --mythroot=$IROOT || exit 1
make -j 2
if [ $? != 0 ]
then
    exit 1
fi
make INSTALL_ROOT=$IROOT install || exit 1
cd ../.. || exit 1

# Compile MythThemes
#echo ""
#echo ""
#echo "--------------------"
#echo "COMPILING MYTHTHEMES"
#echo "--------------------"
#echo ""
#echo ""
#cd mythtv-source/myththemes || exit 1
#./configure --prefix=/usr --sysroot=$IROOT || exit 1
#make -j 2
#if [ $? != 0 ]
#then
#    exit 1
#fi
#make INSTALL_ROOT=$IROOT install || exit 1
#cd ../.. || exit 1