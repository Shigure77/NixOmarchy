{ config, pkgs, lib, ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 3285 ];
    allowedTCPPorts = [ 51820 3285 ];
    #checkReversePath = false;
  };
  #adapt wireguard to rpfilter from wireguard nixos article
  networking.firewall = {
   # if packets are still dropped, they will show up in dmesg
   logReversePathDrops = true;
   # wireguard trips rpfilter up
   extraCommands = ''
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 3285 -j RETURN
     ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 3285 -j RETURN
   '';
   extraStopCommands = ''
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 3285 -j RETURN || true
     ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 3285 -j RETURN || true
   '';
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      #configFile = "/etc/wireguard/WireGuard-NixGateway.conf";
      # IP address of this machine in the *tunnel network*
      address = ["192.168.3.2/29"];
      #dns = ["192.168.3.1/29"];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 3285;

      # Path to the private key file.
      privateKeyFile = "/etc/wireguard/privatekey.wg";

      peers = [{
        publicKey = "9i87Nrn3AXIYygIodP8LwzbwntZFGxZGdboH2vfWLFg=";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "64.67.197.119:3285";
        persistentKeepalive = 25;
      }];
    };
  };
}
