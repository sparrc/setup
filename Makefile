
default: brew salt go

brew:
	brew update
	brew upgrade

salt:
	salt-call --config-dir=./config state.sls sls.mac-workstation

go:
	./install_go.sh 1.15

