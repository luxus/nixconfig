{ pkgs, ... }:
{
  environment.systemPath =
    if pkgs.system == "aarch64-darwin" then
      [
        "/opt/homebrew/bin"
        "/opt/homebrew/sbin"
      ]
    else
      [ ];
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };
    brews = [ "gnu-sed" ];
    # Add taps.
    taps = [
      "buo/cask-upgrade"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/cask"
      "homebrew/command-not-found"
      "homebrew/core"
      "homebrew/services"
      "nikitabobko/tap"
      # "libsql/sqld"
      # "tursodatabase/tap"
    ];

    casks = [
      "aerospace"
      "whisky"
      "steam"
      "keycastr"
      "aldente"
      "superslicer"
      "discord"
      "qlmarkdown"
      "microsoft-teams"
      "cloudflare-warp"
      "scroll-reverser"
      "burp-suite"
      "raycast"
      "logseq"
      "balenaetcher"
      "1password@beta"
      "plexamp"
      "utm"
      "gitkraken"
      "orbstack"
      "cursor"
      "plex"
      "microsoft-edge@dev"
      "lunar"
      "visual-studio-code@insiders"
      "sf-symbols"
      "wireshark"
      "iina"
      "tidal"
      "raycast"
      "telegram"
      "insomnia"
      "zed"
    ];
  };
}
