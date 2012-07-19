
all: update

install: update-local setup-oh-my-zsh setup-janus setup-rbenv link
update: update-local update-oh-my-zsh update-janus update-rbenv link


# Local

update-local:
	git pull --rebase || (git stash && git pull --rebase && git stash pop)
	git submodule update --init
	git submodule foreach git pull

ln_options = hfsv
link:
	ln -$(ln_options) $(PWD)/gitconfig $(HOME)/.gitconfig
	ln -$(ln_options) $(PWD)/githelpers $(HOME)/.githelpers
	ln -$(ln_options) $(PWD)/gitignore $(HOME)/.gitignore
	ln -$(ln_options) $(PWD)/irbrc $(HOME)/.irbrc
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
		&& git pull origin master
	cd $(HOME)/.oh-my-zsh/custom/plugins/zsh-history-substring-search \
		&& git pull origin master
	cd $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
		&& git pull origin master
uninstall-oh-my-zsh:
	rm -fR $(HOME)/.oh-my-zsh


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
		&& git pull origin master
	cd $(HOME)/.rbenv/plugins/ruby-build \
		&& git pull origin master
	cd $(HOME)/.rbenv/plugins/bundler \
		&& git pull origin master
uninstall-rbenv:
	rm -fR $(HOME)/.rbenv


# Homebrew

homebrew_formulae = \
	ack \
	browser \
	brew-gem \
	clojure \
	ctags \
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
	memcached \
	mongodb \
	mysql \
	node \
	reattach-to-user-namespace \
	redis \
	repl \
	sphinx \
	tmux \
	tree \
	varnish \
	yajl \
	zsh
install-homebrew-formulae:
	brew install $(homebrew_formulae)
install-homebrew-gems: install-homebrew-formulae
	brew gem testrbl


# Uninstall

clean: uninstall unlink
uninstall: uninstall-oh-my-zsh uninstall-janus uninstall-rbenv

unlink:
	unlink $(HOME)/.gitconfig
	unlink $(HOME)/.gitignore
	unlink $(HOME)/.irbrc
	unlink $(HOME)/.screenrc
	unlink $(HOME)/.tmux.conf
	unlink $(HOME)/.vimrc.after
	unlink $(HOME)/.vimrc.before
	unlink $(HOME)/.zshenv
	unlink $(HOME)/.zshrc
	unlink $(HOME)/.janus
	unlink $(HOME)/.local
