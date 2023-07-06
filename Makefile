
default: setup brew go

brew:
	brew update
	brew upgrade

go:
	./install_go.sh 1.20.5

setup:
	./setup.sh

