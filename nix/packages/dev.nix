# Editor plus everything per language: compilers, runtimes, package managers,
# language servers, formatters, linters, and debuggers.
{pkgs, ...}:
with pkgs; [
  # Editor
  neovim
  tree-sitter

  # Nix
  nil
  alejandra

  # Lua
  lua
  lua-language-server
  stylua

  # Bash
  bash-language-server
  shfmt
  shellcheck
  completely # bash completion generator

  # Javascript/Typescript
  bun
  pnpm
  fnm
  emmet-language-server
  tailwindcss-language-server
  oxlint
  oxfmt
  # contains eslint json css html and markdown language servers
  vscode-langservers-extracted

  # Markdown
  marksman

  # TOML
  taplo

  # YAML
  yaml-language-server
  yamlfmt

  # Go
  go
  gopls
  golangci-lint
  golangci-lint-langserver
  gofumpt
  delve

  # Python
  (python314.withPackages (ps:
    with ps; [
      pyyaml
    ]))
  uv
  basedpyright
  ruff

  # Rust
  rustc
  cargo
  rust-analyzer
  rustfmt
  clippy

  # Ruby
  ruby_4_0
]
