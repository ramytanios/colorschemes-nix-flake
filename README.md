# nix-flakes-colorscheme
Supported colorschemes:
1. [Kauz](https://github.com/buntec/kauz)
2. [Nightfox](https://github.com/EdenEast/nightfox.nvim)
3. [Tokyo night](https://github.com/folke/tokyonight.nvim)
4. [Kanagawa](https://github.com/rebelot/kanagawa.nvim)(**TODO**)

distributed as a nix flake exposing a [home-manager](https://github.com/nix-community/home-manager) module.

Currently supports only neovim, kitty, fish shell and tmux.

* Import `homeModules.colorscheme` as a home-manager module.
* Activate colorscheme by enabling the corresponding setting 
```nix 
colorscheme.kauz.fish = true
# colorscheme.kauz.kitty = true
# colorscheme.tokyonight.neovim = true
# colorscheme.tokyonight.variant = "storm"
# colorscheme.nightfox.tmux = true
```
