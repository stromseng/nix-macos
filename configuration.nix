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
    fnm # fast node version manager
  ];

  # Homebrew packages to install
  homebrew = {
    enable = true;
    # CLI apps
    brews = [
      "mas" # Mac App Store CLI
      "fileicon" # Set file/folder icons
      "sqlmap" # SQL injection tool
    ];
    # GUI apps
    casks = [
      "alt-tab" # Windows-like alt-tab
      "discord" # Chat app
      "middle" # three finger tap for middle click
      "slack" # Chat app
      "warp" # Terminal
      "cursor" # AI IDE
      "whisky" # Wine wrapper for Mac, windows apps on Mac
      "lookaway" # Reminder to look away from screen
      "visual-studio-code" # vscode IDE
      "arc" # browser
      "swish" # tiling trackpad control
      "jordanbaird-ice" # menu bar icon manager
      "lookaway" # break time reminder
      "chatgpt" # openai chatgpt app
      "raycast" # spotlight replacement
      "spotify" # music streaming
      "messenger" # facebook messenger
      "notion" # note app
      "stremio" # media center / streaming
      "focusrite-control" # focusrite audio interface control software
      "lm-studio" # local ml models
      "betterdisplay" # monitor / display config manager
      "stats" # system stats in menu bar
      "burp-suite" # web security testing
      "zap" # web security testing
      "ghostty" # terminal emulator
      "PrusaSlicer" # 3d printer slicer
      "db-browser-for-sqlite" # sqlite db browser
      "docker" # container manager
      "google-chrome" # browser

    ];
    # Apple app store apps
    masApps = {
      "Xcode" = 497799835; # Xcode IDE
      "Bitwarden" = 1352778147; # password manager
    };
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # delete any installed brews not defined in this file
    onActivation.upgrade = true;
  };

  # Install fonts
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
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
    dock.minimize-to-application = true; # minimize to app icon
    dock.show-recents = false; # disable showing recent apps

    finder.CreateDesktop = false; # disable desktop icons
    #finder._FXShowPosixPathInTitle = true; # Show full POSIX file path
    finder.ShowPathbar = true; # show path bar on bottom
    finder.ShowStatusBar = true; # show status bar at bottom
    finder.AppleShowAllExtensions = true; # Show all file extensions in Finder
    finder.FXPreferredViewStyle = "clmv"; # Finder column view
    finder.ShowRemovableMediaOnDesktop = false; # disable showing removable media on desktop
    NSGlobalDomain.AppleShowAllFiles = true; # Show hidden files in Finder

    screencapture.location = "~/Pictures/screenshots"; # Save screenshots to the Pictures folder

    trackpad.Clicking = true; # enable tap to click
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true; # remap CAPS to escape

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
