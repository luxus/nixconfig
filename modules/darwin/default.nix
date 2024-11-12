# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{ flake
, pkgs
, lib
, ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  environment.shells = with pkgs; [
    zsh
    nushell
    bash
  ];
  fonts.packages = with pkgs; [
    # delugia-code
    # iosevka
    # intel-one-mono
    (nerdfonts.override {
      fonts = [
        "Monaspace"
        "VictorMono"
        "Hack"
        "JetBrainsMono"
      ];
    })
  ];
  # Use TouchID for `sudo` authentication
  security.pam.enableSudoTouchIdAuth = true;

  # These users can add Nix caches.
  nix.settings.trusted-users = [
    "root"
    "luxus"
  ];
  nixpkgs.config.allowUnfree = true;

  # Configure macOS system
  # More emilys => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
  system = {
    defaults = {
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        NSWindowShouldDragOnGesture = true;
      };
      trackpad = {
        Clicking = false;
        TrackpadThreeFingerDrag = false;
      };
      dock = {
        # autohide = true;
        show-recents = false;
        tilesize = 48;
        # customize Hot Corners
        wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 13; # top-right - Lock Screen
        wvous-bl-corner = 3; # bottom-left - Application Windows
        wvous-br-corner = 4; # bottom-right - Desktop
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
      # keyboard = {
      #   # enableKeyMapping = true;
      #    # remapCapsLockToEscape  = true;
      # };
    };
  };
}
