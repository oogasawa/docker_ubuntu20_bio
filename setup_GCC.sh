

install_GCC() {
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt install -y  build-essential
	sudo apt install -y gcc-9 g++-9
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9

	sudo apt install -y  gfortran  
	sudo apt install -y  cmake  
	sudo apt install -y  dh-autoreconf  
	sudo apt install -y  libarchive-dev  
    sudo apt install -y  libc6-i386         
    sudo apt install -y  libpng-dev
    sudo apt install -y  netpbm             
    sudo apt install -y  libnetpbm10   
    sudo apt install -y  libnetpbm10-dev   
    sudo apt install -y  flex  
	sudo apt install -y  bison
}


main() {
	install_GCC
}


main
