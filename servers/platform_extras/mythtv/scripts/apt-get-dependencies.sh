#!/bin/bash

# dependency sorter for mythtv
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


# apt-get remove the existing mythtv instalation
echo ""
echo ""
echo "--------------------"
echo "REMOVING MYTHTV 0.23"
echo "--------------------"
echo ""
echo ""
apt-get -y remove libmythtv-perl libmyth-python libmyth-0.23-0 || exit 1

# apt-get install the necessary prerequisit packages
echo ""
echo ""
echo "------------------------"
echo "INSTALLING PREREQUISITES"
echo "------------------------"
echo ""
echo ""
apt-get -y install build-essential qt4-qmake libfreetype6-dev libasound2-dev libmp3lame-dev libqt4-dev libxxf86vm-dev pkg-config libXinerama-dev yasm subversion python-pyrex libxtst-dev || exit 1
