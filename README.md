# My nix-darwin config for macos

## Installation

1. To get started, install from determinate systems using

    ```shell
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
        sh -s -- install
    ```

2.
    > [!WARNING]
    > Install homebrew before using darwin-rebuild. It will fail otherwise due to missing homebrew installation.

3. Run `nix run nix-darwin -- switch --flake .#mmbp` to rebuild system first time

## Updating

- Run `nix flake update` to update flake lock file



### Currently not declarative
- Raycast application hotkeys, cmd + 1,2,3 etc for browser, ide, terminal
- AltTab settings
- Karabiner elemetns control-option tab swap