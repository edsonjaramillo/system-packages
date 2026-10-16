{
  description = "Nix package bundles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs) lib;

    supportedSystems = [
      "aarch64-darwin"
      "x86_64-linux"
    ];

    # Each group is exposed as its own bundle (e.g. `.#core`), and `default`
    # combines all of them.
    groups = ["core" "shell" "dev"];

    mkPackages = system: let
      pkgs = import nixpkgs {
        inherit system;
        # Allow only these unfree packages, by name.
        config.allowUnfreePredicate = pkg:
          lib.elem (lib.getName pkg) [
            "zsh-abbr" # cc-by-nc-sa-40 + hl3
          ];
      };

      groupPaths = lib.genAttrs groups (group: import ./packages/${group}.nix {inherit pkgs lib;});

      bundle = name: paths: pkgs.buildEnv {inherit name paths;};
    in
      lib.mapAttrs (group: bundle "edson-${group}") groupPaths
      // {
        default = bundle "edson-packages" (lib.concatLists (lib.attrValues groupPaths));
      };
  in {
    packages = lib.genAttrs supportedSystems mkPackages;
  };
}
