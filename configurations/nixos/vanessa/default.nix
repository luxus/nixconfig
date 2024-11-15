# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
    ./disko.nix
  ];

  # Enable home-manager for "luxus" user
  home-manager.users."luxus" = {
    imports = [ (self + /configurations/home/luxus.nix) ];
  };
}
