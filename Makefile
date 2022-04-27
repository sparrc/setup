
default: setup brew go

brew:
	brew update
	brew upgrade

go:
	./install_go.sh 1.17.2

setup:
	./setup.sh

