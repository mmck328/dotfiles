#!/bin/bash

set -eu

# Install xcode
if ! xcode-select --print-path &> /dev/null; then
	echo "Installing Xcode Command Line Tools"
	xcode-select --install
fi