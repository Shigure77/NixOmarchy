{ pkgs, ... }: {
  networking.firewall.allowedUDPPorts = [ 3285 ];
  networking.firewall.checkReversePath = false;
  networking.wg-quick.interfaces = {
    wg0 = {
      #configFile = "/etc/wireguard/WireGuard-NixGateway.conf";
      # IP address of this machine in the *tunnel network*
      address = ["192.168.3.2/29"];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 3285;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/privatekey";

      peers = [{
        publicKey = "9i87Nrn3AXIYygIodP8LwzbwntZFGxZGdboH2vfWLFg=";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "64.67.197.119:3285";
        persistentKeepalive = 25;
      }];
    };
  };
}
