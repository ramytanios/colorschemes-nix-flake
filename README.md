# nix-flakes-colorscheme
Populars colorschemes:uz
1. [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
2. [Kauz](https://github.com/buntec/kauz)
3. [Nightfox](https://github.com/EdenEast/nightfox.nvim)
4. [Tokyo night](https://github.com/folke/tokyonight.nvim)

distributed as a nix flake exposing a [home-manager](https://github.com/nix-community/home-manager) module.

Currently supports only neovim, kitty, fish shell and tmux.

* Import `homeModules.colorscheme` as a home-manager module.
* Activate colorscheme by enabling the corresponding setting 
```nix 
colorscheme.kauz.fish = true
# colorscheme.tokyonight.kitty = true
# colorscheme.tokyonight.neovim = true
# colorscheme.tokyonight.tmux = true
```
