{ lib, ... }:
with lib; rec {
  # Creates an option with a nullable type that defaults to null.
  mkNullOrOption = type: desc:
    lib.mkOption {
      type = lib.types.nullOr type;
      default = null;
      description = desc;
    };

  mkIfNonNull' = x: y: (mkIf (x != null) y);

  mkIfNonNull = x: (mkIfNonNull' x x);

  ifNonNull' = x: y: if (x == null) then null else y;

  mkCompositeOption = desc: options:
    mkNullOrOption (types.submodule { inherit options; }) desc;

  mkNullOrLua = desc:
    lib.mkOption {
      type = lib.types.nullOr nixvimTypes.strLua;
      default = null;
      description = desc;
      apply = mkRaw;
    };
}
