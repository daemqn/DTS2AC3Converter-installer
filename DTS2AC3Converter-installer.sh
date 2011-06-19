#THIS SHELL IS CREATED TO AUTOMATE THE PROCESS OF DOWNLOADING ALL THE REQUIRED LIBRARIES & STUFF FOR A MAC #OSX SYSTEM, SO mkvdts2ac3.sh ( cc. JakeWharton ) WILL WORK.

#ALTHOUGH THESE STEPS ARE FUNNY FOR  PROs, ITS A BIT OF PAIN IN THE ASS ALL THESE STUFF TO UNDERSTAND SOME ROOKIE. THAT WAS THE REASON TO CREATE THIS.

#REQUIRMENTS - XCODE installed (Look at your OSX discs)

#ALL FILES WILL BE DOWNLOADED & COMPILED INTO " /DTS2AC3Convert " FOLDER ON YOUR MAC

# CREATED BY evripidis argyropoulos aka macedonas
# contact @evripidis 
# www.macedonas.gr


# PROCEDURE GOES THROUGH
# 1.DOWNLOAD & INSTALL MACPORTS
# 1.DOWNLOAD & INSTALL mkvtoolnix
# 2.DOWNLOAD & INSTALL libdca
# 3.DOWNLOAD & INSTALL aften
# 4.DOWNLOAD & INSTALL rsync



#Create the main folder of the script

mkdir DTS2AC3Converter




#INSTALL Macports

cd DTS2AC3Converter
curl -O http://distfiles.macports.org/MacPorts/MacPorts-1.9.2.tar.gz && tar xvzf MacPorts-1.9.2.tar.gz
rm MacPorts-1.9.2.tar.gz
cd MacPorts-1.9.2
./configure && make && sudo make install
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DISPLAY=:0.0
sudo port -v selfupdate




#INSTALL MKVTOOLNIX
cd
sudo port install mkvtoolnix.




#Install CMake
cd
cd DTS2AC3Converter
curl -O http://www.cmake.org/files/v2.8/cmake-2.8.4.tar.gz && tar xvzf cmake-2.8.4.tar.gz
rm cmake-2.8.4.tar.gz
cd cmake-2.8.4
./configure
make
sudo make install



#Install libdca
cd
cd DTS2AC3Converter
svn co svn://svn.videolan.org/libdca/trunk libdca
cd libdca
sudo ./bootstrap
sudo ./configure
sudo make
sudo make install



#Install Aften
cd
cd DTS2AC3Converter
svn co http://aften.svn.sourceforge.net/svnroot/aften Aften
cd Aften
mkdir default
cd default
cmake ~/DTS2AC3Converter/Aften/
make
sudo make install


#Install rsync
cd
cd DTS2AC3Converter
curl -O http://rsync.samba.org/ftp/rsync/rsync-3.0.8.tar.gz && tar xvzf rsync-3.0.8.tar.gz
rm rsync-3.0.8.tar.gz
cd rsync-3.0.8
./configure
make
sudo make install



#This installs MKVDTS2AC3 the shell that makes the DTS 2 AC3 conversion
cd
cd DTS2AC3Converter
git clone git://github.com/JakeWharton/mkvdts2ac3
cd mkvdts2ac3
sudo chmod 755 mkvdts2ac3.sh
cp ~/DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3.sh ~/DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3
sudo cp ~/DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3 /usr/local/bin/

