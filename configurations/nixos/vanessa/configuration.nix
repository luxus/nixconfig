# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{ pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vanessa"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];

  nixpkgs.hostPlatform = "x86_64-linux";
  users.users."luxus" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$sZU9yfCR0qIEOegs$KprZkpYZD3/8VH50MHZSbaKITLW4tOVBJzri9P9TyCZ3lvqRACgXsghjRqb8KE5a1GHD4I6dFZdxCTKKUZP5e.";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4" # content of authorized_keys file
    ];
    shell = pkgs.nushell;
  };
  nix.settings.trusted-users = [
    "root"
    "luxus"
  ];
}
