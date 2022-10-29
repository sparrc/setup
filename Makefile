
default: setup brew go

brew:
	brew update
	brew upgrade

go:
	./install_go.sh 1.19.1

setup:
	./setup.sh

