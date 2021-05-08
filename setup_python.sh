


install_anaconda() {

	# Install Anaconda
	# https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/debian/Dockerfile
	
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion
	sudo apt-get clean
	
	wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -O ~/anaconda.sh 
	/bin/bash ~/anaconda.sh -b #-p /opt/conda #-b means batch mode, which skips licence agreement prompts.
	# rm ~/anaconda.sh
	# ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
	# echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc 
	# echo "conda activate base" >> ~/.bashrc 
	# find /opt/conda/ -follow -type f -name '*.a' -delete 
	# find /opt/conda/ -follow -type f -name '*.js.map' -delete 
	# /opt/conda/bin/conda clean -afy
}


# https://github.com/oogasawa/docker_bio/blob/main/Dockerfile
install_python_packages() {
	conda update -y -n base -c defaults conda --force && conda update -y --all
	conda config --add channels bioconda
	conda config --add channels conda-forge
	# conda install -y -c bioconda gffutils pyvcf dendropy genepop trimal eigensoft pysam
	# conda remove -y numpy
	conda install -y -c numpy pandas
	pip install  pygenomics # pygraphviz
}



# ---

function main {
	install_anaconda
	install_python_packages
}


main
