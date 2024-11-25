{
  config,
  pkgs,
  lib,
  self,
  ...
}:
{
  # Import modules
  imports = [
    ./home
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    neovim
    nixfmt-rfc-style # new official nix formatter, not yet stable
    nil # nix language server
    uv # python manager
    gh # github cli
  ];

  # Homebrew packages to install
  homebrew = {
    enable = true;
    # CLI apps
    brews = [
      "mas" # Mac App Store CLI
      "fileicon" # Set file/folder icons
    ];
    # GUI apps
    casks = [
      "alt-tab" # Windows-like alt-tab
      "discord" # Chat app
      "middleclick" # three finger tap for middle click
      "slack" # Chat app
      "stats" # System stats in menu bar
      "warp" # Terminal
      "cursor" # AI IDE
      "whisky" # Wine wrapper for Mac, windows apps on Mac
    ];
    # Apple app store apps
    masApps = {
      "Xcode" = 497799835; # Xcode
    };
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # delete any installed brews not defined in this file
    onActivation.upgrade = true;
  };

  # Install fonts
  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Enable touchid for sudo commands
  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock.autohide = true; # Automatically hide and show the Dock
    dock.mru-spaces = false; # Don't rearrange spaces based on most recently used

    finder.AppleShowAllExtensions = true; # Show all file extensions in Finder
    finder.FXPreferredViewStyle = "clmv"; # Finder column view
    NSGlobalDomain.AppleShowAllFiles = true; # Show hidden files in Finder

    screencapture.location = "~/Pictures/screenshots"; # Save screenshots to the Pictures folder
  };

  # Used for backwards compatibility, please read the changelog before changing. 
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on. 
  nixpkgs.hostPlatform = "aarch64-darwin";
}
