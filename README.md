# dotfiles
A repo containing my dotfiles such as .vimrc, .bashrc, etc. It also contains a list of packages that I may want to install on any new computer setup.

## Dotfile Structure
For configuration files, there are subdirectories for organization (git, vim, bash, etc). To add a new category of file, create the subdirectory and then update $names in `install.sh` with the file names to install. All files are copied directly into the current $USER 's home directory.

## Packages
All packages are listed in the `packages.sh` script for organization. To attempt to install all, use the following:

```
sudo apt update && sudo apt upgrade
sudo apt install -y $( ./packages )
``` 

## Todo list
1. prettify `install.sh` output
2. give an option to skip 1 file when prompted
3. (maybe) add ability to pass overrides in, e.g. "copy everyting"

