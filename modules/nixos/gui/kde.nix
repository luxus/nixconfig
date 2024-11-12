{ pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  networking.firewall.allowedTCPPorts = [ 3389 ]; # RDP port

  environment.systemPackages = with pkgs; [
    firefox
  ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

}
