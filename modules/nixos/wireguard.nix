{ pkgs, ... }: {
  networking.wg-quick.interfaces = {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = ["192.168.3.2/29"];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 1734;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/private.key";

      peers = [{
        publicKey = "Yagxaoahd3lTcSW1vdTc+9PLcdbHTrUWrh6ccZrjJB4=";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "64.67.197.119:1734";
        persistentKeepalive = 25;
      }];
    };
  };
}
