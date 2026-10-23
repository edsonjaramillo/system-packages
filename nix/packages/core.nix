# General command-line tools wanted on every machine.
{
  pkgs,
  lib,
}:
with pkgs;
  [
    # Core
    tmux # terminal multiplexer
    docker # containerization
    go-task # makefile replacement

    # Management
    doppler # secret management

    # Version Control
    git # version control
    gh # github cli
    lazygit # git tui
    delta # git diff replacement

    # Search
    fd # find replacement
    ripgrep # grep replacement
    fzf # fuzzy finder
    eza # ls replacement
    zoxide # cd replacement

    # File Management
    yazi # tree replacement
    bat # cat replacement

    # Misc Tools
    ffmpeg # multimedia processing
    gum # interactive scripts
    jq # json processor
    lazydocker # docker tui
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    gnused # GNU sed (macOS ships BSD sed)
  ]
