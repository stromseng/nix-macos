{
  config,
  pkgs,
  lib,
  self,
  ...
}:

{
  users.users.magnus = {
    name = "magnus";
    home = "/Users/magnus";
  };

  home-manager.backupFileExtension = "hmbak";

  home-manager.users.magnus = {
    programs = {
      git = {
        enable = true;
        userName = "Magnus Strømseng";
        userEmail = "magnus.stromseng@gmail.com";

        extraConfig = {
          pull.rebase = false;

          init.defaultBranch = "main";

          core.editor = "code-insiders --wait";
        };
      };

      zsh = {
        enable = true;
        enableCompletion = false; # using zsh-autocomplete instead
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        syntaxHighlighting.highlighters = [
          "main"
          "brackets"
        ];
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

          pn = "pnpm";
        };
        # Commands that should be added to top of {file}`.zshrc`.
        initExtraFirst = ''

        '';
        #	Extra commands that should be added to {file}`.zshrc` before compinit.
        initExtraBeforeCompInit = ''

        '';
        #	Extra commands that should be added to {file}`.zshrc`.
        initExtra = ''
          PATH=~/.console-ninja/.bin:$PATH # vscode extension console ninja
          export PATH="/Users/magnus/.local/bin:$PATH" # cant remember why

          export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH" # mactex

          eval "$(fnm env --use-on-cd --shell zsh)" # fast node version manager

          . "$HOME/.cargo/env" # rust

          export PATH=$PATH:$HOME/go/bin # go install binaries

          # Set up fzf key bindings and fuzzy completion
          source <(fzf --zsh)

          source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh


          # bind up arrow to fzf history
          bindkey '\e[A' fzf-history-widget



        '';
      };
      fzf = {
        enableZshIntegration = true;
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

      starship = {
        enable = true;
        enableZshIntegration = true;
      };
    };

    home.stateVersion = "24.11";
  };

}
