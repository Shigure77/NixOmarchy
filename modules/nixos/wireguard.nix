# WireGuard: firewall is always set; wg0 is only configured when
# nixomarchy.wireguard.wg0Secrets is set (e.g. from a gitignored file).
# Copy wireguard-secrets.nix.example to wireguard-secrets.nix and fill in your values.
{ config, pkgs, lib, ... }:

let
  cfg = config.nixomarchy.wireguard;
in
{
  options.nixomarchy.wireguard = {
    wg0Secrets = lib.mkOption {
      type = lib.types.nullOr (lib.types.submodule {
        options = {
          address = lib.mkOption { type = lib.types.listOf lib.types.str; description = "Tunnel address(es), e.g. [ \"192.168.3.2/32\" ]"; };
          dns = lib.mkOption { type = lib.types.listOf lib.types.str; default = [ ]; description = "DNS servers for the tunnel"; };
          listenPort = lib.mkOption { type = lib.types.port; default = 51820; description = "UDP listen port"; };
          peers = lib.mkOption {
            type = lib.types.listOf (lib.types.submodule {
              options = {
                publicKey = lib.mkOption { type = lib.types.str; description = "Peer public key"; };
                allowedIPs = lib.mkOption { type = lib.types.listOf lib.types.str; description = "e.g. [ \"0.0.0.0/0\" ]"; };
                endpoint = lib.mkOption { type = lib.types.nullOr lib.types.str; default = null; description = "Peer endpoint host:port"; };
                persistentKeepalive = lib.mkOption { type = lib.types.nullOr lib.types.int; default = null; };
              };
            });
            description = "List of peers";
          };
        };
      });
      default = null;
      description = "Secrets for wg0 (import from a gitignored .nix file). Unset = wg0 not configured.";
    };
  };

  config = lib.mkMerge [
    # Firewall: allow common WireGuard ports (no secrets)
    {
      networking.firewall = {
        allowedUDPPorts = [ 51820 3285 ];
        allowedTCPPorts = [ 51820 3285 ];
      };
    }
    # wg0 interface only when secrets are provided
    (lib.mkIf (cfg.wg0Secrets != null) {
      networking.wg-quick.interfaces.wg0 = {
        address = cfg.wg0Secrets.address;
        dns = cfg.wg0Secrets.dns;
        listenPort = cfg.wg0Secrets.listenPort;
        privateKeyFile = "/etc/wireguard/private.key";
        peers = map (p: {
          publicKey = p.publicKey;
          allowedIPs = p.allowedIPs;
          endpoint = p.endpoint;
          persistentKeepalive = p.persistentKeepalive;
        }) cfg.wg0Secrets.peers;
      };
    })
  ];
}
