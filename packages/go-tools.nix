{
  pkgs,
  sources,
}: {
  bond = pkgs.buildGoModule {
    pname = "bond";
    version = "unstable";
    src = sources.bond;
    vendorHash = "sha256-nGGHAYhHjPZAmCSF9ZfNutlKfXIihn+iwCrEnbhq/zc=";
  };

  secrets = pkgs.buildGoModule {
    pname = "secrets";
    version = "unstable";
    src = sources.secrets;
    vendorHash = "sha256-Gch6BtoOyGVOr/XcpR2Sg5uIAXcMp9WpZ3rpuQFOd+s=";
  };
}
