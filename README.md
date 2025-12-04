Files should be synced using symlinks. Create symlinks that point from the locations where apps expect their config files to the files/folders in this directory. For example:

```bash
ln -s ~/gstoaldo/dotfiles/nvim ~/.config/nvim
ln -s ~/gstoaldo/dotfiles/.zshrc ~/.zshrc
```
