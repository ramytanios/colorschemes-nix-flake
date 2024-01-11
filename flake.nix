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

  outputs = { tokyonight, nightfox, kauz, ... }:
    let libcore = import ./lib/default.nix;
    in {
      homeModules = {
        default = {
          tokyonight = import ./colorschemes/tokyonight.nix tokyonight libcore {};
          nightfox = import ./colorschemes/nightfox.nix nightfox libcore {};
          kauz = import ./colorschemes/kauz.nix kauz libcore {};
        };
      };

      overlays = { kauz.default = kauz.overlays.default; };
    };
}

