

# https://stackoverflow.com/questions/34408298/how-to-run-nvm-command-from-bash-script
install_nodejs() {
	mkdir -p ~/local/src
	cd ~/local/src
	
	sudo apt remove -y nodejs nodejs-doc libnode64
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	. $HOME/.nvm/nvm.sh
	. $HOME/.nvm/bash_completion
	nvm install v14.16.1
	nvm use v14.16.1

	npm install -g typescript @types/node ts-node
	npm install -g typedoc jsdoc 
	npm install -g pkg yarn
	npm install -g tslint
}


install_tools() {
	mkdir -p $HOME/local/src
	cd $HOME/local/src
	git clone https://github.com/oogasawa/docsify-util-ts
	cd docsify-util-ts
	npm run build
	pkg .
	cp docsify_util-linux $HOME/local/bin

	cd $HOME/local/src
	git clone https://github.com/oogasawa/ts_util
	cd ts_util
	npm run build
	pkg .
	cp ts_util-linux $HOME/local/bin

}



# ---

function main {
	install_nodejs
	install_tools
}


main
