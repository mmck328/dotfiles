.PHONY: all xcode link defaults brew
all: xcode link defaults brew

# Setup xcode command line tools
xcode:
	bin/xcode.sh

# Link dotfiles
link:
	bin/link.sh

# Set macOS system preferences
defaults:
	bin/defaults.sh

# Install macOS applications
brew:
	bin/brew.sh