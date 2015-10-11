symlinks = \
		   config \
		   gitconfig \
		   gitignore \
		   lldbinit \
		   local \
		   ruby-version \
		   vimrc \

formulas = \
		   chisel \
		   elasticsearch \
		   elixir \
		   fish \
		   fry \
		   ghc \
		   git \
		   go \
		   hub \
		   lua \
		   mercurial \
		   mysql \
		   node \
		   pandoc \
		   postgresql \
		   redis \
		   ruby-install \
		   rust \
		   the_silver_searcher \
		   trash \
		   tree \

default: | update clean

install: | brew ln ruby vim_plug

update: | install
	brew update
	brew upgrade --all
	gem update
	vim +PlugUpgrade +PlugInstall +PlugUpdate +quitall

clean: | install
	brew cleanup
	gem clean
	vim +PlugClean +quitall

# brew

homebrew_root = /usr/local
cellar = $(homebrew_root)/Cellar
taps = $(homebrew_root)/Library/Taps
caskroom = /opt/homebrew-cask/Caskroom

anybar = $(caskroom)/anybar
macvim = $(cellar)/macvim

prefixed_formulas = $(addprefix $(cellar)/,$(notdir $(formulas)))
brew: | $(brew_cask) $(prefixed_formulas) $(anybar) $(macvim)

homebrew = $(homebrew_root)/bin/brew
$(homebrew):
	@ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_cask = $(cellar)/brew-cask
$(brew_cask): | $(homebrew)
	brew install Caskroom/cask/brew-cask

$(prefixed_formulas): | $(homebrew)
	brew install $(notdir $@)

java = $(caskroom)/java
$(java): | $(brew_cask)
	brew cask install java

$(cellar)/elasticsearch: | $(java)

$(anybar): | $(brew_cask)
	brew cask install anybar

$(macvim): | $(homebrew)
	brew install macvim \
		--override-system-vim \
		--with-lua \

homebrew_fry = $(taps)/igas/homebrew-fry
$(homebrew_fry):
	brew tap igas/fry

fry = $(cellar)/fry
$(fry): | $(homebrew_fry)

$(HOME)/.lldbinit: | $(cellar)/chisel

# ln

prefixed_symlinks = $(addprefix $(HOME)/.,$(symlinks))
ln: | $(prefixed_symlinks)

$(prefixed_symlinks):
	@ln -Fsv $(PWD)/$(patsubst .%,%,$(notdir $@)) $@

# ruby

ruby_version := $(shell cat $(PWD)/ruby-version)

ruby = $(HOME)/.rubies/ruby-$(ruby_version)

bundler = $(ruby)/bin/bundle
cocoapods = $(ruby)/bin/pod

ruby: | $(ruby) $(bundler) $(cocoapods)

$(ruby): | $(fry) $(HOME)/.ruby-version $(cellar)/ruby-install
	ruby-install ruby $(ruby_version)
	fish --command 'fry config auto on'

gem = $(ruby)/bin/gem

$(bundler): | $(ruby)
	$(gem) install bundler

$(cocoapods): | $(ruby)
	$(gem) install cocoapods

# vim

vim_plug = $(HOME)/.vim/autoload/plug.vim
vim_plug: | $(vim_plug)

$(vim_plug):
	curl -fLo $(vim_plug) --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# make

.PHONY: update clean
