# NixOmarchy

Personal NixOS configuration built on **[omarchy-nix](https://github.com/henrysipp/omarchy-nix)**. Uses Hyprland, greetd, and omarchy-nix for theming and desktop defaults; this repo adds host-specific apps and services.

## What this repo provides

- **Base:** [omarchy-nix](https://github.com/henrysipp/omarchy-nix) (Hyprland, Ghostty, Waybar, themes, etc.)
- **Extras:** WireGuard, NFS, Flatpak (Zen Browser, OnlyOffice), desktop/console/gaming apps, nvf (Neovim), Suru Plus icons, and optional fonts.

Theme, terminal, and editor defaults are controlled by omarchy-nix (e.g. `omarchy.theme = "tokyo-night"` in the flake).

## Requirements

- NixOS with flakes
- [Home Manager](https://github.com/nix-community/home-manager)

## Quick start

1. Clone this repo and use it as your system flake, or add it as a flake input and use `nixosConfigurations.baal` as reference.
2. In `flake.nix`, set your username (e.g. `home-manager.users.youruser` → your Unix user), and set `omarchy.full_name`, `omarchy.email_address`, and `omarchy.theme`.
3. In `nixos/baal/configuration.nix`, set `users.users.youruser` to your Unix username (or add your user) and match it in the flake’s `home-manager.users.<youruser>`.
4. Run `nixos-rebuild switch --flake .#baal` (or your hostname).

## Secrets (WireGuard, NFS, etc.)

Sensitive values live in **gitignored** Nix files so they never get committed:

- **WireGuard:** Copy `nixos/baal/wireguard-secrets.nix.example` to `wireguard-secrets.nix`, fill in your keys/endpoints, then in `nixos/baal/configuration.nix` uncomment the line that imports it. The private key stays at `/etc/wireguard/private.key` (create it separately).
- **NFS:** Copy `nixos/baal/nfs-secrets.nix.example` to `nfs-secrets.nix`, set `serverPath` (and optionally `mountPoint`/options), then uncomment the NFS import line in `configuration.nix`.

## Configuration

- **omarchy-nix options:** [config.nix](https://github.com/henrysipp/omarchy-nix/blob/main/config.nix) — theme, monitors, scale, quick app bindings, `exclude_packages`, etc.
- **This repo:** Edit `nixos/baal/configuration.nix`, `modules/nixos/*.nix`, and `home-manager/home.nix` for host-specific and extra packages.

## License

MIT (same as omarchy-nix).
