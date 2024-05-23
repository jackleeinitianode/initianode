if [ "$(id -u)" != "0" ]; then
    echo "root is required."
    echo "Please use sudo -i switch to root account and rerun the script"
    exit 1
fi


function install_environment() {
    # CHECKPOINT  install go
	sudo apt-get update
	sudo apt-get install clang cmake build-essential
	
	# 2. install go (If it is the same node as the validator node, you can PASS)
	wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	
	# 3. install rustup (When the selection for 1, 2, or 3 appears, just press Enter.)
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	
	# 4. git clone
	git clone -b v0.2.0 https://github.com/0glabs/0g-storage-node.git

	# 5. build
	cd $HOME/0g-storage-node
	git submodule update --init
	sudo apt install cargo
	cargo build --release
}


function install_initia() {
    install_environment

}


function menu() {
    while true; do
        echo "########Twitter: @jleeinitianode########"
        echo "1. Install initia Node"
        echo "2. Exit"
        echo "#############################################################"
        read -p "Select function: " choice
        case $choice in
        1)
            install_initia
            ;;
        2)
            break
            ;;
        *)
            echo "choice function again"
            ;;
        esac
        read -p "Press any key to contiune..."
    done
}

menu
