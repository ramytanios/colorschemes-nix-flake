inputs:
{ lib, pkgs, config, ... }:
with lib;

let

  theme = "Kauz";
  cfg = config.colorscheme.kauz;

  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {
  imports = [ inputs.kauz.homeModules.default ];

  options.colorscheme.kauz = {

    fish.enable = mkFishEnable theme;
    kitty.enable = mkKittyEnable theme;
    tmux.enable = mkTmuxEnable theme;
    neovim.enable = mkNeovimEnable theme;

  };

  config = {
    kauz = {
      fish.enable = isFish;
      tmux.enable = isTmux;
      kitty.enable = isKitty;
      neovim.enable = isNeovim;
    };
  };
}
