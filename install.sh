#!/bin/bash

# Purpose: This script attempts to blindly compile heirloom
#          and its related tools into /opt/heirloom
# Author:  Rawiri Blundell, 2015
# Date:    20150106
# Licence: WTFPL with the following disclaimer:
#   THIS SOFTWARE IS PROVIDED 'AS-IS', WITHOUT ANY EXPRESS OR IMPLIED WARRANTY. 
#   IN NO EVENT WILL THE AUTHORS BE HELD LIABLE FOR ANY DAMAGES ARISING FROM THE USE OF THIS SOFTWARE.

################################################################################
# Use at your own risk
################################################################################

# First, set the PATH variable
PATH=$PATH:/opt/heirloom/bin:/opt/heirloom/ccs/bin:/opt/heirloom/sbin
export PATH

# Next, check dependencies
# Are we on a debian box
if [[ ! -f /etc/debian_version ]]; then
  printf "%\sn" "ERROR: This doesn't appear to be a Debian host.  I couldn't find /etc/debian_version..."
  exit 1
fi

# Do we have the packages we need?
for Pkg in build-essential libncurses5-dev ed bison libssl-dev; do
  if ! dpkg -s "${Pkg}" &>/dev/null; then
    apt-get install -y "${Pkg}"
  fi
done

# Next, we start milling through each directory in order
cd heirloom-sh || exit 1
make && make install
cd -

cd heirloom-devtools
make && make install
cd -

cd heirloom
make && make install
cd -

cd heirloom-pkgtools
make && make install
cd -

cd heirloom-doctools
make && make install
cd -

read -d '' Fun << EOF
                             M  ..M.                                            
                           .~.   ..M.        . I  ~ .                           
                            8.    ...        M..  .D..                          
                           .:       ..      :..   .,.                           
              ....         .,.      ..     .~     .?.                           
             M .. ..        I        .     ..     .M.                           
           .+.  . .        .M.     .?.     :.     .I.                           
           .8     .Z.      .M.      M.    .O.    .  .                           
            ~.    ....     .M.      ?.    .~.    .M                             
           ...    . N.     .8.      ,.    O.      O                             
           . M.    .D.     .:       . . ..Z.     .M.                            
             .~     .M .    .,      .Z. ...      .O                             
               ..   . M .  ...      .M.  ..       .                             
.              Z.      8    .       .D. .I.     .$.                             
M...M,        .. .     .D.  .=..     O. ...     .N.                             
.. .. M..       M.     ..    M.     .M..?..     .7.                             
.      ? .     ....     .7  .$      .$..M.       ..                             
7.     ....        .      M. .      .=..+.     .O.                              
,.      ....      M.      .O.. .    .....      .M.                              
.7..     ..D.    ..       ... ..    ..Z..      ...                              
  ,..     ..O    ..D.      .,         ..       $.                               
  .,M...    ....  ..                          .$                      ...       
   ..I       . M    7.                        .M                   . MD+NN .    
    . .M.     . M...=.                         M.               .+: .    . ?.   
       .,..     . .                            M.            ..M.         . .   
         ~..        .                         M.          . ...          ...   
          ,..                                  ...        . D .       ...D.     
         .. .                                  .. .     ..O          ..=  .     
           .Z           Place Hand             .O.  ...$,           M..        
            N.             Here                  .N...D. .        .Z..          
           ...                                   ..  ...      ..  +.            
            .M..        HIGH FIVE!!!                          ..N  .             
            ..                                              ..M..               
            ..I.  ..    .        . . .  . ..                .: .                
             .M.     ,M MM       :8MM.MMO:M.              .+.                   
              7.       ,MMM     M,OMM.MMO:M              .M..                   
               .      ....  ... ....  ...              ..,.                     
              .$         ......     .                 .. .                      
               7..       .M??M.M8~M .               ..M..                       
               .O.       .MI?M.M8:M..                ,..                        
               . ..        . .   ..               . : ..                        
                 Z.                               .M..                          
                  ~ .                          ..M                              
                  . , .                    ...M, .                              
                   ..:...        ...  ..~DMO...                                 
                       .D?. ..  ZMZ, . .                                        
                           ... . .                                 
EOF

printf "%s\n" "${Fun}" \
"" \
"INFO: If you're seeing this message, then I've either completed successfully" \
  "Or failed through well enough to get to this point.  High five the monitor."
