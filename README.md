# NixOmarchy

Personal NixOS configuration (flake + Home Manager). Host `baal` with hardware, Flatpak, nvf (Neovim), WireGuard, NFS, desktop/console/gaming apps, VSCodium, and Suru Plus icons.

## What this repo provides

- **System:** NixOS flake for host `baal` (Lenovo ThinkPad X1 12th gen), systemd-boot, NetworkManager, printing, optional WireGuard/NFS.
- **Home:** Home Manager for user `keion` — Firefox, Fish, Zsh, Bash, VSCodium, nvf, and extra packages.
- **Modules:** WireGuard, NFS, Flatpak (Zen Browser, OnlyOffice), fonts, console/desktop/gaming apps, Steam.

## Requirements

- NixOS with [flakes](https://nixos.wiki/wiki/Flakes) enabled
- [Home Manager](https://github.com/nix-community/home-manager)

## Quick start

1. Clone this repo and use it as your system flake (or add as a flake input).
2. In `flake.nix`, set `home-manager.users.keion` to your Unix username if different, and add the same user in `nixos/baal/configuration.nix` under `users.users.<username>`.
3. Run `nixos-rebuild switch --flake .#baal` (or your hostname).

## Secrets (WireGuard, NFS)

Sensitive values live in **gitignored** Nix files:

- **WireGuard:** Copy `secrets/wireguard-secrets.nix.example` to `secrets/wireguard-secrets.nix`, fill in keys/endpoints, then in `nixos/baal/configuration.nix` uncomment the import. Create `/etc/wireguard/private.key` separately.
- **NFS:** Copy `secrets/nfs-secrets.nix.example` to `secrets/nfs-secrets.nix`, set `serverPath` (and options), then uncomment the NFS import in `configuration.nix`.

## Configuration

- **System:** `nixos/baal/configuration.nix`, `modules/nixos/*.nix`
- **User:** `modules/home-manager/` (default.nix + core/, terminal/, apps/, desktop/, theme/, ui/)

## License

MIT.
