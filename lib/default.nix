{ lib, ... }:
with lib; {

  mkFishEnable = theme:
    mkEnableOption "Whether to enable ${theme} colorscheme for Fish";

  mkTmuxEnable = theme:
    mkEnableOption "Whether to enable ${theme} colorscheme for Tmux";

  mkKittyEnable = theme:
    mkEnableOption "Whether to enable ${theme} colorscheme for Kitty";

  mkNeovimEnable = theme:
    mkEnableOption "Whether to enable ${theme} colorscheme for Neovim";

  mkNeovimLuaConfig = theme:
    mkOption {
      types = types.lines;
      description = "Extra lua config for colorscheme ${theme}";
      default = "";
      example = ''
        require("${theme}").setup({})
      '';
    };

  mkVariantOption = theme: variants:
    mkOption {
      default = builtins.head variants;
      type = types.enum variants;
      description = "${theme} variant";
    };

}
