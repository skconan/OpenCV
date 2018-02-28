echo -n "Install OpenCV 3.1 -> Press 1 for Python 2.7 or Press 2 for Python 3.5";
read response;

echo "======== Update & Upgrade the package lists ========";
sudo apt-get update;
sudo apt-get upgrade;
echo "======== Install compiler such as g++, gcc, make and etc. ========";
sudo apt-get -y install build-essential;	
sudo apt-get -y install cmake;
sudo apt-get -y install pkg-config;
echo "======== Install libraries for read images from disk. ========";
sudo apt-get -y install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev;
echo "======== Install libraries for read videos from disk. ========";
sudo apt-get -y install libavcodec-dev libavformat-dev; 
sudo apt-get -y install libswscale-dev libv4l-dev;
sudo apt-get -y install libxvidcore-dev libx264-dev
echo "======== Install GTK for use GUI in OpenCV. ========";
sudo apt-get -y install libgtk2.0-dev;
sudo apt-get -y install libgtk-3-dev;
echo "======== Install libraries for optimize various functionalities in OpenCV. ========";
sudo apt-get -y install libatlas-base-dev gfortran;


if [ $response == 1 ]; then
	echo "======== Install Python 2 development. ========";
	sudo apt-get -y install python2.7-dev;
	echo "======== Install numpy. ========";
	sudo apt-get -y install python-pip;
	sudo pip2 install pip --upgrade;
	sudo pip2 install numpy;
else
	echo "======== Install Python 3 development. ========";
	sudo apt-get -y install python3.5-dev;
	echo "======== Install numpy. ========";
	sudo apt-get -y install python3-pip;
	sudo pip3 install pip --upgrade;
	sudo pip3 install numpy;
fi	

echo "======== Install Git for clone OpenCV. ========"
sudo apt-get -y install git;
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
    	-D PYTHON_EXECUTABLE=/usr/bin/python2.7 \
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
echo "======== Make install. ========";
sudo make install;
echo "======== Finsih Install. ========";
