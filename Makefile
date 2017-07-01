symlinks = \
					 config \
					 gitconfig \
					 gitignore \
					 lldbinit \
					 local \
					 ruby-version \
					 tmux \
					 tmux.conf \
					 vimrc \
					 vscode \
					 yarnrc \

formulae = \
					 chisel \
					 cmake \
					 cscope \
					 docker \
					 docker-compose \
					 elixir \
					 elm \
					 elm-format \
					 erlang \
					 fish \
					 fzf \
					 ghc \
					 git \
					 go \
					 haskell-stack \
					 hub \
					 idris \
					 io \
					 kotlin \
					 lua \
					 luajit \
					 mercurial \
					 neovim \
					 ninja \
					 node \
					 pandoc \
					 postgresql \
					 python3 \
					 rbenv \
					 reattach-to-user-namespace \
					 redis \
					 ripgrep \
					 ruby-build \
					 rust \
					 tig \
					 trash \
					 tree \
					 wifi-password \
					 yarn \

node_modules = \
							bower \
							create-react-app \
							create-react-native-app \
							prettier \
							pulp \
							purescript \
							typescript \

default: | update clean

install: | brew ln node ruby vim

update: | install
	brew update
	brew upgrade
	yarn global upgrade
	gem update
	vim +PlugUpgrade +PlugInstall +PlugUpdate +quitall

clean: | install
	brew cleanup
	gem clean
	vim +PlugClean +quitall

# brew

homebrew_root = /usr/local
cellar := $(homebrew_root)/Cellar
taps := $(homebrew_root)/Homebrew/Taps

macvim := /usr/local/opt/macvim/MacVim.app

prefixed_formulae := $(addprefix $(cellar)/,$(notdir $(formulae)))
brew: | $(brew_cask) $(prefixed_formulae) $(macvim)

homebrew := $(homebrew_root)/bin/brew
$(homebrew):
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$(prefixed_formulae): | $(homebrew)
	brew install $(notdir $@)

java := $(caskroom)/java
$(java): | $(brew_cask)
	brew cask install java

$(cellar)/elasticsearch: | $(java)

$(cellar)/macvim: | $(homebrew)
	brew install macvim \
		--with-luajit \
		--with-override-system-vim \
		--with-python3 \

$(HOME)/.lldbinit: | $(cellar)/chisel

# ln

prefixed_symlinks := $(addprefix $(HOME)/.,$(symlinks))
ln: | $(prefixed_symlinks)

$(prefixed_symlinks):
	@ln -Fsv $(PWD)/$(patsubst .%,%,$(notdir $@)) $@

# node

node := $(cellar)/node
yarn := $(cellar)/yarn
node_modules_root = $(HOME)/.config/yarn/global/node_modules

prefixed_node_modules = $(addprefix $(node_modules_root)/,$(node_modules))
node: | $(node) $(yarn) $(prefixed_node_modules)

$(prefixed_node_modules):
	yarn global add $(notdir $@)

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
