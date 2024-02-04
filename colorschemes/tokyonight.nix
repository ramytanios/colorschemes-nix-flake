{ tokyonight, libcore }:
{ pkgs, config, ... }:
with pkgs.lib;

let
  theme = "Tokyonight";
  cfg = config.colorscheme.tokyonight;

  inherit (cfg) style;

  styles = [ "day" "moon" "night" "storm" ];

  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {
  options.colorscheme.tokyonight = with libcore; {

    style = mkVariantOption theme styles;
    fish.enable = mkFishEnable theme;
    kitty.enable = mkKittyEnable theme;
    tmux.enable = mkTmuxEnable theme;
    neovim.enable = mkNeovimEnable theme;
    neovim.extraLua = mkNeovimLuaConfig theme;

  };

  config = mkMerge [
    (mkIf isKitty {
      programs.kitty.extraConfig = ''
        include ${tokyonight}/extras/kitty/tokyonight_${style}.conf
      '';
    })
    (mkIf isFish {
      programs.fish.interactiveShellInit =
        builtins.readFile "${tokyonight}/extras/fish/tokyonight_${style}.fish";
    })
    (mkIf isTmux {
      programs.tmux.extraConfig =
        builtins.readFile "${tokyonight}/extras/tmux/tokyonight_${style}.tmux";
    })
    (mkIf isNeovim {
      programs.neovim.plugins = [ pkgs.vimPlugins.tokyonight-nvim ];
      programs.neovim.extraLuaConfig = ''
        ${cfg.extraLua}
        vim.cmd.colorscheme("tokyonight-${style}")
      '';
    })
  ];
}
