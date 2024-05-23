function install_environment() {
  # 1. System updates, installation of required environments
	sudo apt-get update
	sudo apt-get install clang cmake build-essential
}


function install_initia() {
    install_environment

}


function menu() {
    while true; do
        echo "######## Twitter: @jleeinitianode ########"
        echo "1. Install initia Node"
        echo "2. Exit"
        echo "##########################################"
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
