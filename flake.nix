{
  description = "Magnus's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager"; # manage dotfiles etc
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mmbp
      darwinConfigurations."mmbp" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            # Set Git commit hash for darwin-version.
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."mmbp".pkgs;
    };
}
