## Setup
Xcode
	xcode-select --install
brew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Nix
	sh <(curl -L https://nixos.org/nix/install)
Darwin
	nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
	No Channels, yes to basic etc
	./result/bin/darwin-installer

## My Config
git clone https://github.com/ArchieAtkinson/config.git
nix build .#darwinConfigurations.Archies-MacBook-Pro.system --extra-experimental-features "nix-command flakes"
printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf 
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t
./result/sw/bin/darwin-rebuild switch --flake .
————  
darwin-rebuild switch --flake .

## Mac
1. Install Nix 
    1. “SSL certificate problem: certificate has expired”
    2. https://stackoverflow.com/questions/69521959/ssl-certificate-problem-certificate-has-expire-in-macos
        1. sudo mv /etc/ssl/cert.pem /etc/ssl/cert.pem.old
        2. cacert.pem
        3. sudo mv Downloads/cacert.pem /etc/ssl/cert.pem
    3. sh <(curl -L https://nixos.org/nix/install)
2. https://xyno.space/post/nix-darwin-introduction
    1. Failed at ./result/sw/bin/darwin-rebuild switch --flake .
    2. Error: error: Directory /run does not exist, aborting activation
        1. /etc/synthetic.conf is:  run	private/var/run
        2. Unsure of reason
    3. Install nix-darwin manually
        1. https://github.com/LnL7/nix-darwin
    4. Rebuild and ./result/sw/bin/darwin-rebuild switch --flake .
3. Install homebrew
    1. Useful for GUI programs not covered by nix
    2. Can’t be installed by nix
4. darwin-rebuild switch --flake .
5. To delete generations: sudo nix-collect-garbage --delete-old
