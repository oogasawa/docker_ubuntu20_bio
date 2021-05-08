

install_GraalVM() {
	cd $HOME/local/src
	wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.1.0/graalvm-ce-java11-linux-amd64-21.1.0.tar.gz
	tar zxvf graalvm-ce-java11-linux-amd64-21.1.0.tar.gz
	mv graalvm-ce-java11-21.1.0 ..
	export PATH=$HOME/local/graalvm-ce-java11-21.1.0/bin:$PATH
	cd $HOME
}

# ---

main() {
	install_GraalVM
}

main
