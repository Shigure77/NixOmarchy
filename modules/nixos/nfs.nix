{ pkgs, ... }:

{
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;
  environment.systemPackages = with pkgs; [ nfs-utils ];

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noatime";
    };
    what = "192.168.0.51:/mnt/mainpool/keion";
    where = "/mnt/mainpool";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/mainpool";
  }];

  # fileSystems."/mnt/mainpool" = {
  #   device = "192.168.0.51:/mnt/mainpool";
  #   fsType = "nfs";
  #};

}