# NFS: base support is always enabled; mounts are only configured when
# nixomarchy.nfs.mountSecrets is set (e.g. from a gitignored file).
# Copy nfs-secrets.nix.example to nfs-secrets.nix and fill in your values.
{ config, lib, pkgs, ... }:

let
  cfg = config.nixomarchy.nfs;
in
{
  options.nixomarchy.nfs = {
    mountSecrets = lib.mkOption {
      type = lib.types.nullOr (lib.types.submodule {
        options = {
          serverPath = lib.mkOption {
            type = lib.types.str;
            description = "NFS export to mount, e.g. \"192.168.0.51:/mnt/mainpool/username\"";
          };
          mountPoint = lib.mkOption {
            type = lib.types.str;
            default = "/mnt/mainpool";
            description = "Local mount point";
          };
          mountOptions = lib.mkOption {
            type = lib.types.str;
            default = "noatime";
            description = "Mount options";
          };
          timeoutIdleSec = lib.mkOption {
            type = lib.types.str;
            default = "600";
            description = "Automount idle timeout";
          };
        };
      });
      default = null;
      description = "Secrets for NFS mount (import from a gitignored .nix file). Unset = no NFS mounts.";
    };
  };

  config = lib.mkMerge [
    # Base NFS support (no server/path)
    {
      boot.supportedFilesystems = [ "nfs" ];
      services.rpcbind.enable = true;
      environment.systemPackages = with pkgs; [ nfs-utils ];
    }
    # Mounts only when secrets are provided
    (lib.mkIf (cfg.mountSecrets != null) {
      systemd.mounts = [{
        type = "nfs";
        mountConfig.Options = cfg.mountSecrets.mountOptions;
        what = cfg.mountSecrets.serverPath;
        where = cfg.mountSecrets.mountPoint;
      }];
      systemd.automounts = [{
        wantedBy = [ "multi-user.target" ];
        automountConfig.TimeoutIdleSec = cfg.mountSecrets.timeoutIdleSec;
        where = cfg.mountSecrets.mountPoint;
      }];
    })
  ];
}
