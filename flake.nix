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

  outputs = { nixpkgs, tokyonight, nightfox, kauz, ... }:
    let libcore = import ./lib/default.nix { inherit (nixpkgs) lib; };
    in {
      homeModules.default = {
        tokyonight = import ./colorschemes/tokyonight.nix {
          inherit tokyonight;
          inherit libcore;
        };
        nightfox = import ./colorschemes/nightfox.nix {
          inherit nightfox;
          inherit libcore;
        };
        kauz = import ./colorschemes/kauz.nix {
          inherit kauz;
          inherit libcore;
        };
      };

      overlays = { kauz.default = kauz.overlays.default; };
    };
}

