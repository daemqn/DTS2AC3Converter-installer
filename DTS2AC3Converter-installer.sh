#THIS SHELL IS CREATED TO AUTOMATE THE PROCESS OF DOWNLOADING ALL THE REQUIRED LIBRARIES & STUFF FOR A MAC #OSX SYSTEM, SO mkvdts2ac3.sh ( cc. JakeWharton ) WILL WORK.

#ALTHOUGH THESE STEPS ARE FUNNY FOR  PROs, ITS A BIT OF PAIN IN THE ASS ALL THESE STUFF TO UNDERSTAND SOME ROOKIE. THAT WAS THE REASON TO CREATE THIS.

#REQUIRMENTS - XCODE installed (Look at your OSX discs)

#ALL FILES WILL BE DOWNLOADED & COMPILED INTO " /DTS2AC3Convert " FOLDER ON YOUR MAC

# CREATED BY evripidis argyropoulos aka macedonas
# contact @evripidis 
# www.macedonas.gr


#Create the main folder of the script

mkdir /DTS2AC3Converter


#Install CMake

cd DTS2AC3Converter
curl -O http://www.cmake.org/files/v2.8/cmake-2.8.4.tar.gz && tar xvzf cmake-2.8.4.tar.gz
cd cmake-2.8.4
./configure
make
sudo make install

#Install required libraries for mkvtoolnix

#libebml,libmatroska,expat,lib0gg,libVorbis

cd DTS2AC3Converter
svn co https://matroska.svn.sourceforge.net/svnroot/matroska/trunk/libebml/
cd libebml/make/linux
sudo make install_headers install_staticlib


cd DTS2AC3Converter
svn co https://matroska.svn.sourceforge.net/svnroot/matroska/trunk/libmatroska/
cd libmatroska/make/linux
sudo make install_headers install_staticlib


cd DTS2AC3Converter
svn co http://expat.cvs.sourceforge.net/viewvc/expat/expat/
cd expat
./buildconf.sh
./configure
make
sudo make install


cd DTS2AC3Converter
curl -O http://downloads.xiph.org/releases/ogg/libogg-1.0.tar.gz && tar xvzf libogg-1.0.tar.gz
cd libogg-1.0.tar.gz
./autogen.sh
./configure
make
sudo make install

cd DTS2AC3Converter
curl -O http://downloads.xiph.org/releases/vorbis/vorbis-tools-1.4.0.tar.gz && tar xvzf vorbis-tools-1.4.0.tar.gz
cd vorbis-tools-1.4.0.tar.gz
./autogen.sh
./configure
make
sudo make install


cd DTS2AC3Converter
curl -O http://zlib.net/zlib-1.2.5.tar.gz && tar xvzf zlib-1.2.5.tar.gz
cd zlib-1.2.5.tar.gz
./configure
make
sudo make install



####
####Must install Several of Boost's libraries: "format", "RegEx", "filesystem", "system", "foreach" ( http://www.boost.org/ )
####




#Install mkvtoolnix
git clone git://github.com/mbunkus/mkvtoolnix.git
cd mkvtoolnix
./autogen.sh
./configure
sudo ./rake.d/bin/drake
sudo ./rake.d/bin/drake install


#Install libdca

cd DTS2AC3Converter
svn co svn://svn.videolan.org/libdca/trunk libdca
cd libdca
sudo ./bootstrap
sudo ./configure
sudo make
sudo make install



#Install Aften

cd DTS2AC3Converter
svn co http://aften.svn.sourceforge.net/svnroot/aften Aften
cd Aften
mkdir default
cd default
cmake /DTS2AC3Converter/Aften/
make
sudo make install


#Install rsync

cd DTS2AC3Converter
curl -O http://rsync.samba.org/ftp/rsync/rsync-3.0.8.tar.gz && tar xvzf rsync-3.0.8.tar.gz
cd rsync-3.0.8
./configure
make
sudo make install



#This installs MKVDTS2AC3 the shell that makes the DTS 2 AC3 conversion

cd DTS2AC3Converter
git clone git://github.com/JakeWharton/mkvdts2ac3
cd mkvdts2ac3
sudo chmod 755 mkvdts2ac3.sh
cp /DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3.sh /DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3
sudo cp /DTS2AC3Converter/mkvdts2ac3/mkvdts2ac3 /usr/local/bin/

