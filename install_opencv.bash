echo "Install OpenCV 3.1 with Python 2.7"
read -r -p "Are you sure? [Y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
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
	ech "======== Install Python 2 development. ========";
	sudo apt-get install python2.7-dev;
	echo "======== Install numpy. ========";
	sudo apt-get install python-pip;
	pip2 install numpy;
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
	mkdir build;
	cd build;
	echo "======== Cmake ========";
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
    	-D INSTALL_PYTHON_EXAMPLES=ON \
    	-D INSTALL_C_EXAMPLES=OFF \
    	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    	-D PYTHON_EXECUTABLE=/usr/bin/python \
    	-D BUILD_EXAMPLES=ON ..;
	echo "======== make -j4 ========";
	make -j4;
	echo "======== make ========":
	make clean;
	make;
	echo "======== Make install. ========";
	sudo make install;
	echo "======== Finsih Install. ========";
fi	