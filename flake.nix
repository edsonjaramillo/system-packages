{
  description = "Nix package bundles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    bond-src = {
      url = "github:edsonjaramillo/bond";
      flake = false;
    };

    secrets-src = {
      url = "github:edsonjaramillo/secrets";
      flake = false;
    };
  };

  outputs = inputs @ {nixpkgs, ...}: let
    supportedSystems = [
      "aarch64-darwin"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    sharedModules = [
      ./modules/cli.nix
      ./modules/editor.nix
      ./modules/shell.nix
    ];

    mkPackages = system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      goTools = import ./packages/go-tools.nix {
        inherit pkgs;
        sources = {
          bond = inputs.bond-src;
          secrets = inputs.secrets-src;
        };
      };
      bundle = pkgs.buildEnv {
        name = "edson-packages";
        paths =
          (builtins.concatMap (module: import module {inherit pkgs;}) sharedModules)
          ++ builtins.attrValues goTools;
      };
    in
      goTools // {default = bundle;};
  in {
    packages = forAllSystems mkPackages;
  };
}
