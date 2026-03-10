# NixOmarchy host configuration (omarchy-nix provides Hyprland, greetd, pipewire, etc.)

{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # WireGuard wg0: copy wireguard-secrets.nix.example → wireguard-secrets.nix, fill in, then uncomment:
  # nixomarchy.wireguard.wg0Secrets = import ./wireguard-secrets.nix;

  # NFS mount: copy nfs-secrets.nix.example → nfs-secrets.nix, fill in server path, then uncomment:
  # nixomarchy.nfs.mountSecrets = import ./nfs-secrets.nix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "baal";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.printing.enable = true;

  users.users.youruser = {
    isNormalUser = true;
    description = "Your Name";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  system.stateVersion = "24.11";
}
