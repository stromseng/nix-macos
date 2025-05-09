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
    zsh-fzf-tab # zsh fzf tab completion
    pnpm_10 # javascript package manager
    yarn-berry # javascript package manager
    duti # tool to set default applications
  ];

  # Homebrew packages to install
  homebrew = {
    enable = true;
    taps = [
      "oven-sh/bun" # bun, javascript toolkit
      "qmk/qmk" # keyboard firmware
    ];
    # CLI apps
    brews = [
      "mas" # Mac App Store CLI
      "fileicon" # Set file/folder icons
      "sqlmap" # SQL injection tool
      "gobuster" # website directory and file brute force tool
      "wget" # download files
      "hashcat" # password cracker
      "rustup" # rust language manager. Run `rustup-init` after install
      #"tcl-tk" # Tcl/Tk provides the Tcl scripting language and Tk GUI toolkit, needed for GUI applications.
      "oven-sh/bun/bun" # bun, javascript toolkit
      "qmk/qmk/qmk" # keyboard firmware
      "hydra" # bruteforce password cracking
      "sqlite" # sqlite db cli tool
      "sqlx-cli" # rust sqlx cli tool
      "graphviz" # keras plot model
      "typstyle" # Typst lanuguage formatter
      "pkgconf" # Package compiler and linker metadata toolkit, needed for certain python packages
      "ffmpeg" # video/audio processing
      "pandoc" # universal markdown converter
      "go" # go programming language
      "deno" # javascript runtime
      "cocoapods" # Expo ios dependency, Dependency manager for Cocoa projects
      "watchman" # expo dependency, tool for watching changes in the filesystem
      "fzf" # fuzzy finder
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
      "visual-studio-code@insiders" # vscode insiders
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
      "orbstack" # container manager, docker desktop replacement
      "google-chrome" # browser
      "bruno" # api testing
      "steam" # game store
      "microsoft-teams" # microsoft teams
      "minecraft" # game
      "modrinth" # minecraft mod manager
      "libreoffice" # office suite
      "netron" # neural network model viewer
      "mac-mouse-fix" # mouse utility software
      "mactex" # latex typesetting system
      "deskreen" # use tablet as second screen
      "deskpad" # creates virtual monitor for usage with deskscreen
      "obsidian" # note taking app
      "tailscale" # VPN
      "ghostty" # terminal emulator
    ];
    # Apple app store apps
    masApps = {
      "Xcode" = 497799835; # Xcode IDE
      "Bitwarden" = 1352778147; # password manager
      "GeoGebra Classic 6" = 1182481622; # math calculator and graphing app
    };
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # delete any installed brews not defined in this file
    onActivation.upgrade = true;
  };

  # Install fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter
    source-sans-pro
    newcomputermodern
  ];

  # nix.package = pkgs.nix;
  nix.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Enable touchid for sudo commands
  security.pam.services.sudo_local.touchIdAuth = true;

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

  system.activationScripts.postUserActivation = {
    # Set cursor as default application for certain file types
    text = ''
      CURSOR_ID="com.todesktop.230313mzl4w4u92"
      DUTI_BIN="${pkgs.duti}/bin/duti"

      # General text & code
      $DUTI_BIN -s $CURSOR_ID public.plain-text all
      $DUTI_BIN -s $CURSOR_ID public.source-code all
      $DUTI_BIN -s $CURSOR_ID .txt all

      # Scripting
      $DUTI_BIN -s $CURSOR_ID .sh all
      $DUTI_BIN -s $CURSOR_ID .zsh all
      $DUTI_BIN -s $CURSOR_ID .py all

      # Web
      $DUTI_BIN -s $CURSOR_ID .js all
      $DUTI_BIN -s $CURSOR_ID .mjs all
      $DUTI_BIN -s $CURSOR_ID .cjs all
      $DUTI_BIN -s $CURSOR_ID .ts all
      $DUTI_BIN -s $CURSOR_ID .tsx all
      $DUTI_BIN -s $CURSOR_ID .json all
      $DUTI_BIN -s $CURSOR_ID .yaml all
      $DUTI_BIN -s $CURSOR_ID .yml all
      $DUTI_BIN -s $CURSOR_ID .css all

      # Markup
      $DUTI_BIN -s $CURSOR_ID .md all

      # Nix
      $DUTI_BIN -s $CURSOR_ID .nix all

      # Rust
      $DUTI_BIN -s $CURSOR_ID .rs all

      # Go
      $DUTI_BIN -s $CURSOR_ID .go all

      # Config/Build
      $DUTI_BIN -s $CURSOR_ID .gitignore all
      $DUTI_BIN -s $CURSOR_ID .gitattributes all
      $DUTI_BIN -s $CURSOR_ID .gitmodules all
      $DUTI_BIN -s $CURSOR_ID Dockerfile all
      $DUTI_BIN -s $CURSOR_ID Makefile all
      $DUTI_BIN -s $CURSOR_ID makefile all
    '';
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
