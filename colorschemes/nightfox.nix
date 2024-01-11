{ nightfox, libcore }:
{ pkgs, config, ... }:
with pkgs.lib;

let

  theme = "Nightfox";
  cfg = config.colorscheme.nightfox;

  inherit (cfg) style;

  nf = nightfox;
  styles =
    [ "nightfox" "dayfox" "dawnfox" "duskfox" "nordfox" "terafox" "carbonfox" ];

  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;

in {
  options.colorscheme.nightfox = with libcore; {

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
        include ${nf}/extra/${style}/kitty.conf;
      '';
    })
    (mkIf isFish {
      programs.fish.interactiveShellInit =
        builtins.readFile "${nf}/extra/${style}/${style}.fish";
    })
    (mkIf isTmux {
      programs.tmux.extraConfig =
        builtins.readFile "${nf}/extra/${style}/${style}.tmux";
    })
    (mkIf isNeovim {
      programs.neovim.plugins = [ pkgs.vimPlugins.nightfox-nvim ];
      programs.neovim.extraLuaConfig = ''
        ${cfg.extraLua}
        vim.cmd.colorscheme("nightfox-${style}")
      '';
    })
  ];
}
