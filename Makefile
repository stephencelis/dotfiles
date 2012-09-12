
all: update

install: \
	update-local \
	setup-oh-my-zsh \
	setup-janus \
	setup-rbenv \
	link
update: \
	update-local \
	update-oh-my-zsh \
	update-janus \
	update-rbenv \
	update-submodules \
	update-homebrew \
	link


# Local

update-local:
	git pull --rebase || (git stash && git pull --rebase && git stash pop)
	git submodule sync
	git submodule update --init

update-submodules:
	git submodule foreach git checkout master
	cd $(PWD)/janus/powerline && git checkout develop
	git submodule foreach git pull --rebase

update-homebrew:
	brew update
	brew upgrade
	brew cleanup

ln_options = hfsv
link: link-oh-my-zsh link-janus
	ln -$(ln_options) $(PWD)/gitconfig $(HOME)/.gitconfig
	ln -$(ln_options) $(PWD)/githelpers $(HOME)/.githelpers
	ln -$(ln_options) $(PWD)/gitignore $(HOME)/.gitignore
	ln -$(ln_options) $(PWD)/irbrc $(HOME)/.irbrc
	ln -$(ln_options) $(PWD)/jshintrc $(HOME)/.jshintrc
	ln -$(ln_options) $(PWD)/powconfig $(HOME)/.powconfig
	ln -$(ln_options) $(PWD)/rspec $(HOME)/.rspec
	ln -$(ln_options) $(PWD)/screenrc $(HOME)/.screenrc
	ln -$(ln_options) $(PWD)/tmux.conf $(HOME)/.tmux.conf
	ln -$(ln_options) $(PWD)/vimrc.after $(HOME)/.vimrc.after
	ln -$(ln_options) $(PWD)/vimrc.before $(HOME)/.vimrc.before
	ln -F$(ln_options) $(PWD)/local/ $(HOME)/.local


# OH MY ZSHELL!
#
# https://github.com/robbyrussel/oh-my-zsh

setup-oh-my-zsh: \
	install-oh-my-zsh \
	install-oh-my-zsh-plugins \
	link-oh-my-zsh
install-oh-my-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
install-oh-my-zsh-plugins:
	mkdir -p $(HOME)/.oh-my-zsh/custom/plugins
	git clone -- git://github.com/zsh-users/zsh-history-substring-search.git \
		$(HOME)/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone -- git://github.com/zsh-users/zsh-syntax-highlighting.git \
		$(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
link-oh-my-zsh:
	ln -$(ln_options) $(PWD)/zshenv $(HOME)/.zshenv
	ln -$(ln_options) $(PWD)/zshrc $(HOME)/.zshrc
	ln -$(ln_options) $(PWD)/oh-my-zsh/custom/stephencelis.zsh-theme \
		$(HOME)/.oh-my-zsh/custom/stephencelis.zsh-theme
	ln -F$(ln_options) $(PWD)/oh-my-zsh/custom/plugins/stephencelis/ \
		$(HOME)/.oh-my-zsh/custom/plugins/stephencelis
update-oh-my-zsh:
	cd $(HOME)/.oh-my-zsh \
		&& git pull --rebase origin master
	cd $(HOME)/.oh-my-zsh/custom/plugins/zsh-history-substring-search \
		&& git pull --rebase origin master
	cd $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
		&& git pull --rebase origin master
uninstall-oh-my-zsh:
	rm -fR $(HOME)/.oh-my-zsh
unlink-oh-my-zsh:
	unlink $(HOME)/.zshenv
	unlink $(HOME)/.zshrc


# Janus
#
# http://github.com/carlhuda/janus

setup-janus: \
	install-janus \
	link-janus
install-janus:
	curl -Lo- https://bit.ly/janus-bootstrap | bash
link-janus:
	ln -F$(ln_options) $(PWD)/janus/ $(HOME)/.janus
update-janus:
	cd $(HOME)/.vim \
		&& rake
uninstall-janus:
	rm -fR $(HOME)/.vim
unlink-janus:
	unlink $(HOME)/.janus


# rbenv
#
# https://github.com/sstephenson/rbenv

setup-rbenv: \
	install-rbenv \
	install-rbenv-plugins
install-rbenv:
	git clone -- git://github.com/sstephenson/rbenv.git $(HOME)/.rbenv
install-rbenv-plugins:
	mkdir -p $(HOME)/.rbenv/plugins
	git clone -- git://github.com/sstephenson/ruby-build.git \
		$(HOME)/.rbenv/plugins/ruby-build
	git clone -- git://github.com/carsomyr/rbenv-bundler.git \
		$(HOME)/.rbenv/plugins/bundler
update-rbenv:
	cd $(HOME)/.rbenv \
		&& git pull --rebase origin master
	cd $(HOME)/.rbenv/plugins/ruby-build \
		&& git pull --rebase origin master
	cd $(HOME)/.rbenv/plugins/bundler \
		&& git pull --rebase origin master
uninstall-rbenv:
	rm -fR $(HOME)/.rbenv


# Homebrew

homebrew_formulae = \
	ack \
	browser \
	brew-gem \
	clojure \
	ctags \
	daemonize \
	discount \
	erlang \
	figlet \
	fortune \
	ghc \
	gist \
	git \
	hub \
	imagemagick \
	io \
	lame \
	lua \
	lynx \
	macvim \
	memcached \
	mercurial \
	mongodb \
	mysql \
	node \
	python \
	readline \
	reattach-to-user-namespace \
	redis \
	repl \
	sphinx \
	tmux \
	tree \
	varnish \
	watch \
	yajl \
	zsh
install-homebrew-formulae:
	brew install $(homebrew_formulae)
link-homebrew-formulae:
	brew link readline

install-homebrew-gems: install-homebrew-formulae
	brew gem testrbl


# npm

npm_packages = \
	coffee-script \
	jshint \
	supervisor
install-npm-packages:
	npm install -g $(npm_packages)


# pip

pip_packages = \
	Pygments \
	glances
install-pip-packages:
	pip install $(pip_packages)


# Uninstall

clean: \
	uninstall \
	unlink
uninstall: \
	uninstall-oh-my-zsh \
	uninstall-janus \
	uninstall-rbenv

unlink: unlink-oh-my-zsh unlink-janus
	unlink $(HOME)/.gitconfig
	unlink $(HOME)/.gitignore
	unlink $(HOME)/.irbrc
	unlink $(HOME)/.screenrc
	unlink $(HOME)/.tmux.conf
	unlink $(HOME)/.vimrc.after
	unlink $(HOME)/.vimrc.before
	unlink $(HOME)/.local
