{config, pkgs, lib, self, ...} :

{
    users.users.magnus = {
        name = "magnus";
        home = "/Users/magnus";
    };

    home-manager.backupFileExtension = "hmbak";

    home-manager.users.magnus = {
        programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [ "main" "brackets" ];
      autocd = true;
      defaultKeymap = "emacs";

      shellAliases = {
        gs = "git status";
        ga = "git add";
        gaa = "git add --all";
        gc = "git commit";
        gph = "git push";
        gpl = "git pull";
        gco = "git checkout";
        gd = "git diff";

        cat = "bat";
        ls = "eza";
      };
      initExtraBeforeCompInit = ''
      '';
      initExtra = ''
      PATH=~/.console-ninja/.bin:$PATH
      export PATH="/Users/magnus/.local/bin:$PATH"
      '';
    };
    # A modern ls replacement
    eza = {
      enable = true;
    };
    # A modern cat replacement
    bat = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
  };

      home.stateVersion = "24.11";
    };
    

}