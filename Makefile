
default: setup brew go

brew:
	brew update
	brew upgrade

go:
	./install_go.sh 1.26.0

setup:
	./setup.sh

