# System Packages

My system-wide package bundle, managed with a [Nix flake](https://nixos.wiki/wiki/Flakes).
Packages are grouped by purpose so the same core toolset can be shared across
macOS and Linux.

## Supported systems

- Apple silicon macOS (`aarch64-darwin`)
- 64-bit Linux (`x86_64-linux`)

## Bootstrap

Install [Nix](https://nixos.org/download/) with flakes enabled, then clone and
install the bundle:

```sh
git clone https://github.com/edsonjaramillo/system-packages.git ~/.config/system-packages
cd ~/.config/system-packages
nix profile add path:.#default --priority 4
```

The initial installation includes [Task](https://taskfile.dev/), which provides
shortcuts for subsequent maintenance.

## Usage

Run `task` to list the available commands.

| Command | Description |
| --- | --- |
| `task install` | Install the Nix, Homebrew, and Bun packages |
| `task install:nix` | Install the current bundle into the active Nix profile |
| `task install:brew` | Install and upgrade Brewfile dependencies on macOS |
| `task install:bun` | Install dependencies from the Bun lockfile |
| `task build:nix` | Build the Nix bundle without installing it |
| `task check` | Check the Nix and Homebrew package sources |
| `task fmt:nix` | Format all Nix files with Alejandra |
| `task update` | Update, validate, and install all package sources |
| `task profile:nix` | List packages in the active Nix profile |
| `task history:nix` | Show Nix profile generations |
| `task rollback:nix` | Roll back to the previous profile generation |

To update, validate, and install all package sources:

```sh
task update
```

## Package organization

- `modules/cli.nix`: command-line tools
- `modules/editor.nix`: editors, runtimes, formatters, and language servers
- `modules/shell.nix`: shells, plugins, prompt, and terminal utilities
- `modules/apps/shared-apps.nix`: desktop applications shared across platforms
- `modules/apps/darwin-apps.nix`: macOS-only applications

After changing a module, run `task check:nix` and `task install:nix` to apply it.
