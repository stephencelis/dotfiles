symlinks = \
		   config \
		   gitconfig \
		   gitignore \
		   lldbinit \
		   local \
		   ruby-version \
		   tmux.conf \
		   vimrc \

formulae = \
		   chisel \
		   cmake \
		   elixir \
		   elm \
		   fish \
		   ghc \
		   git \
		   go \
		   htop \
		   hub \
		   io \
		   kotlin \
		   lua \
		   mercurial \
		   ninja \
		   pandoc \
		   postgresql \
		   rbenv \
		   redis \
		   ruby-build \
		   rust \
		   tig \
		   trash \
		   tree \

default: | update clean

install: | brew ln ruby vim

update: | install
	brew update
	brew upgrade --all
	npm update --global
	gem update
	vim +PlugUpgrade +PlugInstall +PlugUpdate +quitall

clean: | install
	brew cleanup
	gem clean
	vim +PlugClean +quitall

# brew

homebrew_root = /usr/local
cellar := $(homebrew_root)/Cellar
taps := $(homebrew_root)/Library/Taps
caskroom = /opt/homebrew-cask/Caskroom

applications = /Applications
anybar := $(caskroom)/anybar
macvim := $(applications)/MacVim.app

prefixed_formulae := $(addprefix $(cellar)/,$(notdir $(formulae)))
brew: | $(brew_cask) $(prefixed_formulae) $(anybar) $(macvim)

homebrew := $(homebrew_root)/bin/brew
$(homebrew):
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_cask := $(taps)/caskroom/homebrew-cask
$(brew_cask): | $(homebrew)
	brew tap Caskroom/cask

$(prefixed_formulae): | $(homebrew)
	brew install $(notdir $@)

java := $(caskroom)/java
$(java): | $(brew_cask)
	brew cask install java

$(cellar)/elasticsearch: | $(java)

$(anybar): | $(brew_cask)
	brew cask install anybar

$(cellar)/macvim: | $(homebrew)
	brew install macvim \
		--override-system-vim \
		--with-lua \

$(macvim): | $(cellar)/macvim
	brew linkapps macvim

$(HOME)/.lldbinit: | $(cellar)/chisel

# ln

prefixed_symlinks := $(addprefix $(HOME)/.,$(symlinks))
ln: | $(prefixed_symlinks)

$(prefixed_symlinks):
	@ln -Fsv $(PWD)/$(patsubst .%,%,$(notdir $@)) $@

# ruby

ruby_version := $(shell cat $(PWD)/ruby-version)

ruby := $(HOME)/.rbenv/versions/$(ruby_version)

bundler := $(ruby)/bin/bundle
cocoapods := $(ruby)/bin/pod

ruby: | $(ruby) $(bundler) $(cocoapods)

$(ruby): | $(HOME)/.ruby-version $(cellar)/rbenv $(cellar)/ruby-build
	rbenv install $(ruby_version)

gem := $(ruby)/bin/gem

$(bundler): | $(ruby)
	$(gem) install bundler

$(cocoapods): | $(ruby)
	$(gem) install cocoapods

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
