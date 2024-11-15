{
  description = "Magnus's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew"; # manage homebrew insallation

    home-manager.url = "github:nix-community/home-manager"; # manage dotfiles etc
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mmbp
    darwinConfigurations."mmbp" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
      nix-homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "magnus";

            # Automatically migrate existing Homebrew installations 
            autoMigrate = true;
          };
        }
        ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mmbp".pkgs;
  };
}
