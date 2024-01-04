inputs:
{ lib, pkgs, config, ... }:
with lib;

let
  cfg = config.colorscheme.nightfox;
  isFish = cfg.fish.enable;
  isKitty = cfg.kitty.enable;
  isTmux = cfg.tmux.enable;
  isNeovim = cfg.neovim.enable;
  inherit (cfg) style;
  theme = inputs.nightfox;
  styles =
    [ "nightfox" "dayfox" "dawnfox" "duskfox" "nordfox" "terafox" "carbonfox" ];

in {
  options.colorscheme.tokyonight = {

    style = mkOption {
      default = "nightfox";
      type = types.enum (styles);
      description = "Night fox theme";
    };

    fish.enable =
      mkEnableOption "Whether to enable Nightfox colorscheme for Fish";
    kitty.enable =
      mkEnableOption "Whether to enable Nightfox colorscheme for Kitty";
    tmux.enable =
      mkEnableOption "Whether to enable Nightfox colorscheme for Tmux";
    neovim.enable =
      mkEnableOption "Whether to enable the Nightfox colorscheme for Neovim";
    neovim.extraLua = mkOption {
      type = types.lines;
      default = "";
      example = ''
          require("tokyonight").setup({
          -- disable italic for functions
          styles = {
            functions = {}
          }
        })
      '';
      description = "Extra lua configuration for the Tokyonight colorscheme.";
    };

  };

  config = mkIf isKitty {
    programs.kitty.extraConfig = ''
      include ${theme}/extra/${style}/kitty.conf;
    '';
  } // mkIf isFish {
    programs.fish.interactiveShellInit =
      builtins.readFile "${theme}/extra/${style}/${style}.fish";
  } // mkIf isTmux {
    programs.tmux.extraConfig =
      builtins.readFile "${theme}/extra/${style}/${style}.tmux";
  } // mkIf isNeovim {
    programs.neovim.plugins = [ pkgs.vimPlugins.nightfox-nvim ];
    programs.neovim.extraLuaConfig = ''
      ${cfg.extraLua}
      vim.cmd.colorscheme("nightfox-${style}")
    '';
  };
}
