



install_R() {

	# Install dependencies
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get install -y git wget build-essential unzip graphviz
	sudo apt-get install -y libgraphviz-dev pkg-config swig libx11-dev libgsl0-dev
	sudo apt-get install -y libopenblas-dev liblapacke-dev
	sudo apt-get install -y gfortran libreadline-dev libxt-dev libbz2-dev liblzma-dev libpcre2-dev libpcre3-dev
	sudo apt-get install -y libcurl4-nss-dev libiconv-hook-dev

	mkdir -p ~/local/src
	cd ~/local/src

	# Install PCRE (Perl-compatible regular expression library)
	wget https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.gz
	tar zxvf pcre2-10.36.tar.gz
	cd pcre2-10.36
	./configure
	make -j 4
	sudo make install

	# Install R
	R_VERSION=4.0.5
	R_MAJOR=4
	
	if [ -e R-${R_VERSION}.tar.gz ]; then
		echo "R-${R_VERSION}.tar.gz already exists."
	else
		wget https://cran.ism.ac.jp/src/base/R-${R_MAJOR}/R-${R_VERSION}.tar.gz
	fi
	tar xzvf R-${R_VERSION}.tar.gz
	cd R-${R_VERSION}
	
	./configure --prefix=$HOME/local --x-includes=/usr/include/X11 --x-libraries=/usr/lib/X11 --enable-R-shlib
	make -j 4
	make install
}

# https://biowize.wordpress.com/2013/05/23/batch-installation-of-r-packages/
install_R_packages() {

	# Install R packages
	Rscript -e 'install.packages("ggplot2", repos="https://cran.ism.ac.jp")'
	Rscript -e 'install.packages("gridextra", repos="https://cran.ism.ac.jp")'
	Rscript -e 'install.packages("rlang", repos="https://cran.ism.ac.jp")'
	Rscript -e 'install.packages("lazyeval", repos="https://cran.ism.ac.jp")'

	pip install rpy2
}



# ---

function main {
	install_GCC
	install_R
	install_R_packages
}


main
