

install_biotools() {
	# sudo apt-get install -y samtools mafft muscle raxml tabix
	sudo apt-get install -y plink1.9
}



install_BioinformaticsWithPython2ndEd() {
	git clone https://github.com/PacktPublishing/Bioinformatics-with-Python-Cookbook-Second-Edition.git
}



# ---

# Install basic analysis tools.
# https://raw.githubusercontent.com/PacktPublishing/Bioinformatics-with-Python-Cookbook-Second-Edition/master/docker/Dockerfile

function main {
	install_biotools
	install_BioinformaticsWithPython2ndEd
}


main
