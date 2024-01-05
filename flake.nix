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

  outputs = inputs@{ self, ... }: {
    homeModules = { colorscheme = import ./colorschemes inputs; };
  };
}

