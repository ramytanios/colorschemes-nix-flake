{
  description = "Nix flake for the popular colorschemes";
  inputs = {
    tokyonight = {
      type = "github";
      owner = "folke";
      repo = "tokyonight.nvim";
      flake = false;
    };
    nightfox = {
      type = "github";
      owner = "EdenEast";
      repo = "nightfox.nvim";
      flake = false;
    };
    kauz = { url = "github:buntec/kauz"; };
  };

  libcore = import ./lib/default.nix;

  outputs = { libcore, tokyonight, nightfox, kauz, ... }: {
    homeModules = {
      colorscheme = {
        tokyonight = import ./colorschemes/tokyonight.nix tokyonight libcore;
        nightfox = import ./colorschemes/nightfox.nix nightfox libcore;
        kauz = import ./colorschemes/kauz.nix kauz libcore;
      };
    };
  };
}

