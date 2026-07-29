{pkgs}:
with pkgs; [
  # Core
  tmux # terminal multiplexer
  docker # containerization

  # Management
  stow # dotfile management
  doppler # secret management

  # Version Control
  lazygit # git tui
  git # version control
  gh # github cli
  delta # git diff replacement

  # Search
  fd # find replacement
  ripgrep # grep replacement
  fzf # fuzzy finder
  eza # ls replacement
  gnused # sed replacement

  # File Management
  yazi # tree replacement

  # Misc Tools
  bat # cat replacement
  completely # bash completion generator
  ffmpeg # multimedia processing
  go-task # makefile replacement
  gum # interactive scripts
  jq # json processor
  lazydocker # docker tui
  zoxide # cd replacement
]
