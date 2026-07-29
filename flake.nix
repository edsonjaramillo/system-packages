{
  description = "Nix package bundles";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ...}: let
    sharedModules = [
      ./modules/cli.nix
      ./modules/editor.nix
      ./modules/shell.nix
      ./modules/apps/shared-apps.nix
    ];

    mkBundle = system: modules: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
      pkgs.buildEnv {
        name = "edson-packages";
        paths = builtins.concatMap (module: import module {inherit pkgs;}) modules;
      };
  in {
    packages = {
      aarch64-darwin.default = mkBundle "aarch64-darwin" (sharedModules
        ++ [
          ./modules/apps/darwin-apps.nix
        ]);

      x86_64-linux.default = mkBundle "x86_64-linux" sharedModules;
    };
  };
}
