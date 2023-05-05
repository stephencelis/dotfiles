symlinks = \
					 bat \
					 config \
					 delta \
					 exa \
					 gitconfig \
					 gitignore \
					 irbrc \
					 local \
					 ruby-version \
					 vimrc \

formulae = \
					 bat \
					 cmake \
					 exa \
					 fish \
					 fzf \
					 git \
					 git-delta \
					 git-lfs \
					 hub \
					 jq \
					 libyaml \
					 neovim \
					 ngrok \
					 ninja \
					 postgresql@15 \
					 rbenv \
					 ripgrep \
					 ruby-build \
					 rust \
					 trash \
					 tree \
					 wifi-password \
					 # stripe/stripe-cli/stripe \

cask_formulae = \
								ngrok \

default: | update clean

install: | brew ln ruby vim

update: | install
	brew update && brew upgrade || true
	gem update || true
	vim +PlugUpgrade +PlugInstall +PlugUpdate +quitall || true

clean: | install
	brew cleanup
	gem clean
	vim +PlugClean +quitall

# brew

homebrew_root = /opt/homebrew
cellar := $(homebrew_root)/Cellar
taps := $(homebrew_root)/Homebrew/Taps

prefixed_formulae := $(addprefix $(cellar)/,$(notdir $(formulae)))
brew: | $(brew_cask) $(prefixed_formulae)

homebrew := $(homebrew_root)/bin/brew
$(homebrew):
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

$(prefixed_formulae): | $(homebrew)
	brew install $(notdir $@)

java := $(caskroom)/java
$(java): | $(brew_cask)
	brew cask install java

# ln

prefixed_symlinks := $(addprefix $(HOME)/.,$(symlinks))
ln: | $(prefixed_symlinks)

$(prefixed_symlinks):
	@ln -Fsv $(PWD)/$(patsubst .%,%,$(notdir $@)) $@

# ruby

ruby_version := $(shell cat $(PWD)/ruby-version)

ruby := $(HOME)/.rbenv/versions/$(ruby_version)

bundler := $(ruby)/bin/bundle

ruby: | $(ruby) $(bundler)

$(ruby): | $(HOME)/.ruby-version $(cellar)/rbenv $(cellar)/ruby-build
	rbenv install $(ruby_version)

gem := $(ruby)/bin/gem

$(bundler): | $(ruby)
	$(gem) install bundler

# vim

vim: | vim_tmp vim_plug

vim_tmp := $(HOME)/.vim/tmp
vim_tmp: | $(vim_tmp)

$(vim_tmp):
	mkdir -p $(vim_tmp)

vim_plug := $(HOME)/.vim/autoload/plug.vim
vim_plug: | $(vim_plug)

$(vim_plug):
	curl -fLo $(vim_plug) --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# make

.PHONY: update clean
