{ pkgs, ... }:
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home = {
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = with pkgs; [
      # Unix tools
      ripgrep # Better `grep`
      sd
      tree
      nmap
      # new tools
      du-dust
      gdu
      jujutsu
      rclone
      rsync
      w3m
      ast-grep
      mediainfo
      odt2txt
      # spotify-player
      pueue
      zenith
      croc
      rsync
      wget
      ouch
      nettools
      doggo
      fastfetch
      duf
      gitu
      devenv
      twitch-tui
      nushellPlugins.skim
      nushellPlugins.gstat
      nushellPlugins.net

      # Nix dev
      cachix
      nil # Nix language server
      nix-info
      nixpkgs-fmt
      nixfmt-rfc-style
      nixpkgs-review
      nix-tree

      # Dev
      tmate
      mas

      # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
      # work.
      less
    ];
  };

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    bottom = {
      enable = true;
    };
    skim = {
      enable = true;
    };

    # Better `cat`
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        # batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };
    # Type `<ctrl> + r` to fuzzy search your shell history
    atuin = {
      # credit: https://github.com/montchr/dotfield/commit/6237fa7cde4b6fc1ba5b28234e5ce0c295c7bff9#diff-e85828e2a1e40863d27b847846b1f592b906fd9fa495f89b52057125bcc992f7
      enable = true;
      settings = {
        auto_sync = true;
        dialect = "us";
        sync_frequency = "10m";
        sync_address = "https://api.atuin.sh";
        search_mode = "fuzzy"; # 'prefix' | 'fulltext' | 'fuzzy'

        ##: options: 'global' (default) | 'host' | 'session' | 'directory'
        filter_mode = "global";
        filter_mode_shell_up_key_binding = "directory";
      };
    };

    eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --hidden --follow";
      fileWidgetCommand = "fd --type f --hidden --follow";
      defaultOptions = [ "--extended" ];
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [
        gh-actions-cache
        gh-cal
        gh-copilot
        gh-dash
        gh-eco
        gh-markdown-preview
      ];
    };
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
    thefuck.enable = true;
    fd.enable = true;
    bun.enable = true;
    zellij = {
      enable = false;
      enableBashIntegration = false;
      enableZshIntegration = false;
    };
    yazi = {
      enable = true;
    };
  };
}
