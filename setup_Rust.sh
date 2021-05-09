
install_Rust() {
	# Install Rust compiler
	cd $HOME/local/src
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	
	# Install Rust analyzer
	git clone https://github.com/rust-analyzer/rust-analyzer.git
	cd rust-analyzer
	cargo xtask install --server
	
	# Emacs settings.
	# https://robert.kra.hn/posts/2021-02-07_rust-with-emacs/
	git clone https://github.com/rksm/emacs-rust-config
	#emacs -q --load ./emacs-rust-config/standalone.el
}

main() {
	install_Rust
}

main
