# My nix-darwin config for macos

- To get started, install from determinate systems using

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

- Run `darwin-rebuild switch --flake ~/nix` to rebuild system
- Run `nix flake update` to update flake lock file