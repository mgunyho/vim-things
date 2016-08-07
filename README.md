# vim-things
A git repo containing my vim configuration.

With vim version >= 7.4, you can have the `.vimrc` in `$HOME/.vim/vimrc` on UNIX or in `$HOME/vimfiles/vimrc` on Windows. This allows for easy management of the vim directory via git without having to have your whole `$HOME` in the repo. Note that `.vim/[g]vimrc` doesn't get sourced if you have a regular `.vimrc` in `$HOME` already, so either move `.vimrc` to `.vim/` or `source .vim/vimrc`.

I do not provide an installation script (often seen in other people's vimrcs on GitHub), as the structure is simple enough that you should be able to look through it and pick out things that you find are useful.
