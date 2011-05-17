#%%%%%%%%%%%%%%%%%%%%%%


#Create the main folder of the script

mkdir /DTS2AC3Converter


#Install CMake

#cd /DTS2AC3Converter/
#curl -O http://www.cmake.org/files/v2.8/cmake-2.8.4.tar.gz
#./configure
#make
#sudo make install




#Install MacPorts -  so you can install mkvtoolnix




#Install mkvtoolnix



#Install libdca

cd /DTS2AC3Converter
svn co svn://svn.videolan.org/libdca/trunk libdca
cd libdca
sudo ./bootstrap
sudo ./configure
sudo make
sudo make install



#Install Aften

cd /DTS2AC3Converter
svn co http://aften.svn.sourceforge.net/svnroot/aften Aften
cd Aften
mkdir default
cd default
cmake /DTS2AC3Converter/Aften/
make
sudo make install




#Install rsync

#cd /DTS2AC3Converter
#curl -O http://rsync.samba.org/ftp/rsync/"



