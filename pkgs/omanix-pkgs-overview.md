# Omanix `pkgs` overview

[Omanix](https://github.com/T00fy/omanix) ships two custom packages in `pkgs/` that NixOmarchy does **not** include. Here’s what they are and whether copying them helps.

---

## 1. `omanix-screensaver`

**What it is:** A GTK4 Layer Shell screensaver (Python + `terminaltexteffects`). Shows a fullscreen overlay after the hypridle “screensaver” timeout; used so the screen doesn’t stay on a static image before lock.

**Contents:**
- `default.nix` – Nix package (Python app, GTK4, gtk4-layer-shell, vte-gtk4)
- `screensaver.py` – main script (~6.6 KB)

**Status in NixOmarchy:** Implemented in `pkgs/` (default.nix + screensaver.py). The flake overlay uses `callPackage ./pkgs { }`; screensaver.nix installs it and the shutdown cleanup; hypridle runs it at 1200 s. (The package was previously under pkgs/omanix-screensaver/; it now lives in pkgs/.)

---

## 2. `omanix-scripts`

**What it is:** A set of bash scripts used by Omanix for launchers, menu, screenshots, screen recording, power, etc. They are wrapped with `makeWrapper` and get env vars (browser, walker path, theme list, etc.) from the Omanix Home Manager module.

**Scripts and what they do (high level):**

| Script | Purpose |
|--------|--------|
| **omanix-launch-browser** | Launch default browser (uses `OMANIX_BROWSER_FALLBACK` / xdg). |
| **omanix-launch-or-focus** | Launch an app or focus its window if already running (e.g. Spotify, Obsidian). |
| **omanix-launch-tui** | Open a TUI app in Ghostty (e.g. btop, lazydocker). |
| **omanix-launch-or-focus-tui** | Same but focus existing Ghostty window for that TUI. |
| **omanix-cmd-terminal-cwd** | Print CWD of the focused terminal (for “open terminal here”). |
| **omanix-launch-walker** | Start Walker (app launcher) with Omanix dimensions. |
| **omanix-smart-delete** | Hyprland “smart” window close (e.g. kill group or window). |
| **omanix-menu** | **Super+Alt+Space** control menu: Walker-based hierarchy (style, capture, share, system, docs). Uses `OMANIX_SCREENSAVER_LOGO`, `OMANIX_MENU_WIDTH`, etc. |
| **omanix-menu-style** | Submenu: theme/style (uses themes JSON, swaybg, etc.). |
| **omanix-menu-keybindings** | Show Hyprland keybindings in Walker. |
| **omanix-show-style-help** | Show style/theme help (glow + docs). |
| **omanix-show-setup-help** | Show setup docs. |
| **omanix-cmd-logout** | Log out (Hyprland + session). |
| **omanix-restart-walker** | Restart Walker service. |
| **omanix-launch-audio** | Open pavucontrol. |
| **omanix-launch-wifi** | Launch WiFi TUI (e.g. wlctl). |
| **omanix-launch-bluetooth** | Launch Bluetooth (e.g. blueman). |
| **omanix-toggle-waybar** | Toggle Waybar visibility. |
| **omanix-cmd-screenshot** | Screenshot flow: region/window/fullscreen (grim, slurp, wayfreeze, notify). |
| **omanix-lock-screen** | Lock + optional 1Password/Bitwarden integration. |
| **omanix-cmd-shutdown** | Shutdown (Hyprland-aware). |
| **omanix-cmd-reboot** | Reboot. |
| **omanix-cmd-audio-switch** | Switch audio output (pulseaudio, swayosd). |
| **omanix-hyprland-window-close-all** | Close all windows in group/workspace. |
| **omanix-hyprland-window-pop** | “Pop” window (e.g. from group). |
| **omanix-hyprland-workspace-toggle-gaps** | Toggle gaps (uses `OMANIX_GAPS_*`, `OMANIX_BORDER_SIZE`). |
| **omanix-theme-bg-next** | Cycle wallpapers (`OMANIX_WALLPAPERS`). |
| **omanix-toggle-idle** | Pause/resume hypridle. |
| **omanix-cmd-screenrecord** | Screen recording (gpu-screen-recorder, waybar indicator, etc.). |
| **omanix-workspace** | Workspace/monitor helpers (`OMANIX_MONITOR_MAP`). |
| **omanix-cmd-share** | Share flow (e.g. LocalSend, fzf, clipboard). |

**Would copying help?** It depends:

- **If you want the full Omanix menu (Super+Alt+Space)** and the same launcher/screenshot/record/power flows, then copying **omanix-scripts** (and adapting them) is the way to get that. The scripts expect many env vars and some Omanix-specific paths; you’d either:
  - Add omanix as a flake input and use its scripts + module, or  
  - Copy `pkgs/omanix-scripts` into this repo, rename to e.g. `nixomarchy-scripts`, and replace `OMANIX_*` with your own env (e.g. `NIXOMARCHY_*`) and config (browser, walker, theme list, docs paths, etc.).

- **If you only want a few behaviors** (e.g. “launch or focus”, “screenshot”, “lock”), you can reimplement those in your own scripts or keybindings and skip the full package.

**Caveats when copying:**

- Scripts depend on **Omanix module data**: `themesJson`, `docStylePreview`, `wallpaperList`, `monitorMap`, `gapsOuter`/`gapsInner`, `menuWidth`/`menuMaxHeight`, `screensaverLogo`, etc. You’d need to provide equivalent data from your Nix config (e.g. from your theme/lib or options).
- Some scripts call **Bitwarden CLI**, **LocalSend**, **wayfreeze**, etc.; you’d enable or stub those as you like.
- The **menu** (omanix-menu) is the main reason to have these scripts; the rest are supporting actions for that menu and for keybindings.

---

## Summary

| Package | Copy? | Reason |
|--------|--------|--------|
| **omanix-screensaver** | **Done** | In `pkgs/` (default.nix + screensaver.py); overlay + screensaver.nix + hypridle listener. |
| **omanix-scripts** | Optional | Only needed if you want the full Super+Alt+Space menu and Omanix-style launcher/screenshot/record/power scripts; requires supplying your own theme/wallpaper/menu config. |

If you don’t need the screensaver or the hierarchical menu, you can leave both out and keep using your current bindings (walker, hyprlock, swayosd, etc.) and optionally add small custom scripts for the actions you care about.
