{ pkgs, ... }:

{
  # optional, but ensures rpc-statsd is running for on demand mounting
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true; # needed for NFS

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