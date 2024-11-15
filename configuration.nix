{config, pkgs, lib, self, ...} :
{
    # Import modules
    imports = [
        ./home.nix
    ];

    # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

        # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs;[ 
        neovim
        nixfmt-rfc-style # new official nix formatter, not yet stable
        ];

        # Homebrew packages to install
        homebrew = {
            enable = true;
            # CLI apps
            brews = [
                "mas" # Mac App Store CLI
                "fileicon" # Set file/folder icons
                "gh" # GitHub CLI
                "starship" # Cross-shell prompt
                "uv" # Python manager
            ];
            # GUI apps
            casks = [

            ];
            # Apple app store apps
            masApps = {

            };
            onActivation.autoUpdate = true;
            #onActivation.cleanup = "zap"; # delete any installed brews not defined in this file
            onActivation.upgrade = true;
        };

        # Install fonts
        fonts.packages = [
            (pkgs.nerdfonts.override {fonts = [ "JetBrainsMono"];})
        ];



      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing. 
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on. 
      nixpkgs.hostPlatform = "aarch64-darwin";
}