## Setup
- Xcode
  - `xcode-select --install`
- brew
  - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)`
- Nix
  - `sh <(curl -L https://nixos.org/nix/install)`
- Darwin
  - `nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer`
  - `./result/bin/darwin-installer`

## My Config
- `git clone https://github.com/ArchieAtkinson/config.git`
- `nix build .#darwinConfigurations.Archies-MacBook-Pro.system --extra-experimental-features "nix-command flakes"`
- `printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf`
- `/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t`
`./result/sw/bin/darwin-rebuild switch --flake .`  
- `darwin-rebuild switch --flake .`


## Manual Steps
- Setup SSH
  - Switch config repo origin
  - `git remote set-url origin git@github.com:ArchieAtkinson/config.git`
- Login into:
  - Firefox
    - Bitwarden
    - Gmail
    - Youtube
  - Dropbox
  

## Todo/Issue
- nixpkg Rectangle doesn't work
- How to automate SSH key managment

## Useful Commands
- Delete generations
  - `sudo nix-collect-garbage --delete-old`
- Switch Version
  - `darwin-rebuild switch --flake .`
