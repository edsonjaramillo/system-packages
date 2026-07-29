{pkgs}:
with pkgs; [
  # Shells
  bash
  zsh

  zsh-vi-mode
  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-fzf-tab
  zsh-autopair
  zsh-autosuggestions-abbreviations-strategy
  zsh-abbr

  # font
  nerd-fonts.geist-mono

  starship # prompt
  fastfetch # system info
  atuin # shell history manager
]
