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
- Change Scaling 
  - Setting -> Display -> "More Space"
- Change background
- Control Centre -> Blueooth -> "Show in Menu Bar'
  

## Todo/Issue
- nixpkg Rectangle doesn't work
  - Why do I need to use `open -a Rectangle` 
  - and why does it still work when I "uninstall it'
- How to automate SSH key managment
- Get apps to show up in spotlight
- Automate resolution change

## Useful Commands
- Delete generations (nix)
  - `sudo nix-collect-garbage --delete-old`
- Delete generations (darwin)
  - `sudo ./result/sw/bin/nix-collect-garbage -d`
- Switch Version
  - `darwin-rebuild switch --flake .`
- Open in background (MacOS)
  - `open -gj -a obsidian`
