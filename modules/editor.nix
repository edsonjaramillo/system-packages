{pkgs}:
with pkgs; [
  #Editor
  neovim
  tree-sitter

  # Nix
  nil
  alejandra

  # AI
  # (commented out because updates are not frequent enough)
  # opencode
  # claude-code
  # codex
  copilot-language-server

  # Lua
  lua
  lua-language-server # LSP for Lua
  stylua

  # Bash
  bash-language-server
  shfmt
  shellcheck

  # Javascript/Typescript
  deno
  bun
  pnpm
  fnm
  emmet-language-server
  tailwindcss-language-server
  prettier
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
  cargo

  # Ruby
  ruby_4_0
]
