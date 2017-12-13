tput setaf 1
echo "Installing and Updating Homebrew"
tput setaf 0
brew update
tput setaf 1
echo "Installing Dependencies"
tput setaf 0
brew install wget
brew upgrade wget
brew install git
brew upgrade git
brew install ffmpeg
brew update && brew upgrade ffmpeg
brew install openssl
brew upgrade openssl
brew install opus
brew install opus-tools
brew install opusfile
brew upgrade opusfile
brew install libffi
brew install libsodium
brew install tmux
brew install python
brew install youtube-dl
brew upgrade youtube-dl
brew install redis
brew services start redis
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/
tput setaf 1
echo "Now, go to https://www.microsoft.com/net/core#macos and install the .NET Core SDK"
read -p "Press any key to continue once you have finished... " -n1 -s
tput setaf 0
ln -s /usr/local/share/dotnet/dotnet /usr/local/bin
xcode-select --install
