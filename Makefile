
MAKEFLAGS += --check-symlink-times
BIN = /usr/local/bin


update: install $(SSL_CERT_FILE)
	git pull --rebase || (git stash && git pull --rebase && git stash pop)
	git submodule update --init
	git submodule foreach git checkout master
	cd $(PWD)/janus/powerline && git checkout develop
	git submodule foreach git pull
	# Oh My Zsh
	cd $(OH_MY_ZSH) && git pull
	cd $(OH_MY_ZSH)/custom/plugins/zsh-history-substring-search && git pull
	cd $(OH_MY_ZSH)/custom/plugins/zsh-syntax-highlighting && git pull
	# Janus
	cd $(HOME)/.vim && SSL_CERT_FILE=$(SSL_CERT_FILE) rake
	# Homebrew
	brew update
	brew upgrade
	brew cleanup


install: homebrew janus oh-my-zsh nave symlinks


# Dotfiles

DOTFILES = \
	gitconfig \
	githelpers \
	gitignore \
	irbrc \
	jshintrc \
	powconfig \
	rspec \
	screenrc \
	tmux.conf \
	vimrc.after \
	vimrc.before \
	zshenv \
	zshrc \
	bundle \
	config \
	local \
	tmux
SYMLINKS = $(addprefix $(HOME)/., $(DOTFILES))
$(SYMLINKS):
	@for dotfile in $(DOTFILES); \
	do \
		if test -d $$dotfile; \
		then \
			ln -Fhfsv $(PWD)/$$dotfile/ $(HOME)/.$$dotfile; \
		elif test -f $$dotfile; \
		then \
			ln -hfsv $(PWD)/$$dotfile $(HOME)/.$$dotfile; \
		fi; \
	done

symlinks: $(SYMLINKS)


# Homebrew

BREW = $(BIN)/brew
$(BREW):
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
$(BIN)/ag: $(BREW)
	$(BREW) install the_silver_searcher

homebrew: $(BREW)


# Janus

$(HOME)/.vim:
	curl -Lo- https://bit.ly/janus-bootstrap | bash
$(HOME)/.janus: $(PWD)/janus
	@ln -Fhfsv $(PWD)/janus/ $(HOME)/.janus

janus: \
	$(HOME)/.vim \
	$(HOME)/.janus


# Oh My Zsh

OH_MY_ZSH = $(HOME)/.oh-my-zsh
OH_MY_ZSH_PLUGINS = \
	$(OH_MY_ZSH)/custom/plugins/zsh-history-substring-search \
	$(OH_MY_ZSH)/custom/plugins/zsh-syntax-highlighting \
	$(OH_MY_ZSH)/custom/stephencelis.zsh-theme \
	$(OH_MY_ZSH)/custom/plugins/stephencelis
$(OH_MY_ZSH)/custom/plugins/zsh-history-substring-search: $(OH_MY_ZSH)
	git clone -- git://github.com/zsh-users/zsh-history-substring-search.git \
		$(OH_MY_ZSH)/custom/plugins/zsh-history-substring-search
$(OH_MY_ZSH)/custom/plugins/zsh-syntax-highlighting: $(OH_MY_ZSH)
	git clone -- git://github.com/zsh-users/zsh-syntax-highlighting.git \
		$(OH_MY_ZSH)/custom/plugins/zsh-syntax-highlighting
$(OH_MY_ZSH)/custom/stephencelis.zsh-theme: $(OH_MY_ZSH)
	@ln -hfsv $(PWD)/oh-my-zsh/custom/stephencelis.zsh-theme \
		$(OH_MY_ZSH)/custom/stephencelis.zsh-theme
$(OH_MY_ZSH)/custom/plugins/stephencelis: $(OH_MY_ZSH)
	@ln -Fhfsv $(PWD)/oh-my-zsh/custom/plugins/stephencelis/ \
		$(OH_MY_ZSH)/custom/plugins/stephencelis
$(OH_MY_ZSH):
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

oh-my-zsh: $(OH_MY_ZSH_PLUGINS)


# nave

NAVE = $(HOME)/.nave
$(NAVE):
	git clone -- git://github.com/isaacs/nave.git $(NAVE)
/usr/local/bin/nave: $(NAVE)
nave: /usr/local/bin/nave


# misc


SSL_CERT_FILE = /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
$(SSL_CERT_FILE): homebrew
	@brew install curl-ca-bundle


.PHONY: update
