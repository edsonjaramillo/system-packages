{pkgs}:
with pkgs; [
  # Shells
  bash
  zsh

  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-fzf-tab
  zsh-autopair
  zsh-autosuggestions-abbreviations-strategy
  zsh-abbr

  starship # prompt
  fastfetch # system info
  atuin # shell history manager
]
