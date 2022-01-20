# dotfiles
A repo containing my dotfiles such as .vimrc, .bashrc, etc. It also contains a list of packages that I may want to install on any new computer setup.

## Notable features
### Vim
- Pressing `F5` will automatically execute the current file
- Typing `:F5 afjds b` will execute the current file with arguments
- `;` remaps to `:`

### Bash
- various `show*` commands that display various system properties
- `git` aliases like `gic, gis, gad, gip, gap` for basic operations
- `git log` aliases like `glog` and `glogl` for prettier formatting
- `gpat` to create a formatted git patch 
- `gistlist` to list all github gists quickly
- `bashrc` and `bashal` to hot reload the `.bashrc` or `.bash_aliases` files respectively
- `exp` windows WSL file explorer shortcut  
- very big `.bash_history` file

### Git
- automatic `gh` auth

## Dotfile Structure
For configuration files, there are subdirectories for organization (git, vim, bash, etc). To add a new category of file, create the subdirectory and then update $names in `install.sh` with the file names to install. All files are copied directly into the current `$USER`'s home directory.

## Packages
All packages are listed in the `packages.sh` script for organization. To attempt to install all, use the following:

```
sudo apt update && sudo apt upgrade
sudo apt install -y $( ./packages )
``` 
