echo -n "Install OpenCV 3.1 -> Press 1 for Python 2.7 or Press 2 for Python 3.5";
read response;

echo "======== Update & Upgrade the package lists ========";
sudo apt-get update;
sudo apt-get upgrade;
echo "======== Install compiler such as g++, gcc, make and etc. ========";
sudo apt-get install build-essential;	
sudo apt-get install cmake;
sudo apt-get install pkg-config;
echo "======== Install libraries for read images from disk. ========";
sudo apt-get install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev;
echo "======== Install libraries for read videos from disk. ========";
sudo apt-get install libavcodec-dev libavformat-dev; 
sudo apt-get install libswscale-dev libv4l-dev;
echo "======== Install GTK for use GUI in OpenCV. ========";
sudo apt-get install libgtk2.0-dev;
echo "======== Install libraries for optimize various functionalities in OpenCV. ========";
sudo apt-get install libatlas-base-dev gfortran;


if [ $response == 1 ]; then
	echo "======== Install Python 2 development. ========";
	sudo apt-get install python2.7-dev;
	echo "======== Install numpy. ========";
	sudo apt-get install python-pip;
	sudo pip2 install pip --upgrade;
	sudo pip2 install numpy;
else
	echo "======== Install Python 3 development. ========";
	sudo apt-get install python3.5-dev;
	echo "======== Install numpy. ========";
	sudo apt-get install python3-pip;
	sudo pip3 install pip --upgrade;
	sudo pip3 install numpy;
fi	

echo "======== Install Git for clone OpenCV. ========"
sudo apt-get install git;
echo "======== Download OpenCV to home directory. ========";		
cd;
git clone https://github.com/opencv/opencv;
cd opencv;
git checkout 3.1.0;
cd;
git clone https://github.com/opencv/opencv_contrib;
cd opencv_contrib;
git checkout 3.1.0;
cd ~/opencv/;
sudo mkdir build;
cd build;

if [ $response == 1 ]; then
	echo "======== Cmake ========";
	sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
    	-D INSTALL_PYTHON_EXAMPLES=ON \
    	-D INSTALL_C_EXAMPLES=OFF \
    	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    	-D PYTHON_EXECUTABLE=/usr/bin/python \
    	-D BUILD_EXAMPLES=ON ..;
else
	echo "======== Cmake ========";
	sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
    	-D INSTALL_PYTHON_EXAMPLES=ON \
    	-D INSTALL_C_EXAMPLES=OFF \
    	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    	-D PYTHON_EXECUTABLE=/usr/bin/python3 \
    	-D BUILD_EXAMPLES=ON ..;
fi		
echo "======== make -j4 ========";
sudo make -j4;
echo "======== make ========";
sudo make clean;
sudo make;
echo "======== Make install. ========";
sudo make install;
echo "======== Finsih Install. ========";
