# Shells, plugins, prompt, and shell utilities.
{pkgs, ...}:
with pkgs; [
  # Shells
  bash
  zsh

  # Zsh plugins
  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-fzf-tab
  zsh-autopair
  zsh-autosuggestions-abbreviations-strategy
  zsh-abbr

  starship # prompt
  atuin # shell history manager
]
