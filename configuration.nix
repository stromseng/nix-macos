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
    nixfmt-rfc-style # new official nix formatter, not yet stable
    nil # nix language server
    uv # python manager
    gh # github cli
    zsh-fzf-tab # zsh fzf tab completion
    pnpm_10 # javascript package manager
    yarn-berry # javascript package manager
    duti # tool to set default applications
    google-cloud-sdk
  ];

  # Homebrew packages to install
  homebrew = {
    enable = true;
    taps = [
      "sst/tap"
    ];
    # CLI apps
    brews = [
      "wget" # download files
      "go" # go programming language
      "fzf" # fuzzy finder
      "cmake" # build system
      "libomp" # openmp
      "diesel" # rust orm cli tool
      "just" # command/task runner
      "fnm" # fast node version manager
      "golangci-lint" # golang linter
      "tfenv" # terraform version manager
      "opencode"

    ];
    # GUI apps
    casks = [
      "alt-tab" # Windows-like alt-tab
      "middle" # three finger tap for middle click
      "cursor" # AI IDE
      "swish" # tiling trackpad control
      "jordanbaird-ice" # menu bar icon manager
      "raycast" # spotlight replacement
      "spotify" # music streaming
      "betterdisplay" # monitor / display config manager
      "ghostty" # terminal emulator
      "visual-studio-code"
      "zen" # browser
      "mac-mouse-fix" # mouse utility software
      "karabiner-elements" # keyboard remapping
      "bruno" # api testing
      "google-chrome" # browser
      "docker-desktop" # container manager
    ];
    # Apple app store apps
    masApps = {
    };
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # delete any installed brews not defined in this file
    onActivation.upgrade = true;
  };

  # Install fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter
  ];

  # nix.package = pkgs.nix;
  # disable to use with determinate nix
  nix.enable = false;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Enable touchid for sudo commands
  security.pam.services.sudo_local.touchIdAuth = true;

  system.primaryUser = "magnus";

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
  nixpkgs.hostPlatform = "x86_64-darwin";
}
