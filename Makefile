symlinks = \
		   config \
		   gitconfig \
		   gitignore \
		   lldbinit \
		   local \
		   ruby-version \
		   vim \
		   vimrc \

formulas = \
		   chisel \
		   elasticsearch \
		   elixir \
		   fish \
		   fry \
		   ghc \
		   go \
		   hub \
		   lua \
		   mercurial \
		   mysql \
		   node \
		   postgres \
		   redis \
		   ruby-install \
		   rust \
		   the_silver_searcher \
		   tree \

update: install
	brew update
	brew upgrade
	brew cleanup

install: brew ln ruby

# brew

homebrew_root = /usr/local
cellar = $(homebrew_root)/Cellar
taps = $(homebrew_root)/Library/Taps
ruby_version := $(shell cat $(PWD)/ruby-version)

prefixed_formulas = $(addprefix $(cellar)/,$(formulas))
brew: $(prefixed_formulas) $(macvim)

homebrew = $(homebrew_root)/bin/brew
$(homebrew):
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$(prefixed_formulas): $(homebrew)
	brew install $(notdir $@)
	@touch $@

macvim = $(cellar)/macvim
$(macvim): $(homebrew)
	brew install macvim \
		--override-system-vim \
		--with-lua \
	@touch $(macvim)

homebrew_fry = $(taps)/igas/homebrew-fry
$(homebrew_fry):
	brew tap igas/fry
	@touch $(homebrew_fry)

$(cellar)/fry: $(homebrew_fry)

# ln

prefixed_symlinks = $(addprefix $(HOME)/.,$(symlinks))
ln: $(prefixed_symlinks)

$(prefixed_symlinks):
	@ln -Fsv $(PWD)/$(patsubst .%,%,$(notdir $@)) $@

# ruby

ruby = $(HOME)/.rubies/ruby-$(ruby_version)
ruby: $(ruby)

$(ruby): $(HOME)/.ruby-version $(cellar)/ruby-install
	ruby-install ruby $(ruby_version)

# make

.PHONY: update
