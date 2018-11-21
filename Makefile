
default: brew salt salt-brightcove ruby python go

brew:
	brew update
	brew upgrade

salt:
	salt-call --config-dir=./config state.sls sls.mac-workstation

salt-brightcove:
	salt-call --config-dir=./config state.sls sls.brightcove

go:
	./install_go.sh 1.11.2

ruby:
	rbenv install --skip-existing 2.5.3
	rbenv global 2.5.3
	gem install bundler
	gem install rubocop

# might need to set CFLAGS for this to work, see
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
python:
	pyenv install --skip-existing 2.7.15
	pyenv install --skip-existing 3.7.1
	pyenv global 2.7.15
	pip install -q --upgrade pip
	pip install -q --upgrade ipython
	pip install -q --upgrade yapf
	pyenv global 3.7.1
	pip install -q --upgrade pip
	pip install -q --upgrade ipython
	pip install -q --upgrade black
	pip install -q --upgrade yapf
