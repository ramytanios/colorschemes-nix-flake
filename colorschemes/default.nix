{ pkgs, config, lib, ... }:

{
  imports = [ ./kanagawa.nix ./tokyonight.nix ./kauz.nix ./nightfox.nix ];
}
