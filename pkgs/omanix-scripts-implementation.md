# Omanix scripts: what each does and how to implement

This doc describes every script in [Omanix’s](https://github.com/T00fy/omanix) `pkgs/omanix-scripts` and how you can implement the same behavior in NixOmarchy (either by copying/adapting the script or with a small Nix/Keybinding equivalent).

---

## 1. omanix-launch-browser

**What it does:** Opens the default browser (or a fallback). Uses `xdg-open` with a desktop id fallback from `OMANIX_BROWSER_FALLBACK` (e.g. `firefox.desktop` or `zen-browser.desktop`).

**Deps:** `bash`, `xdg-utils`  
**Env:** `OMANIX_BROWSER_FALLBACK`

**How to implement:**
- **Option A (keybinding):** Bind e.g. `$mod SHIFT, B` to `exec, zen-browser --new-window` (or `exec, xdg-open https://` if you want the system default).
- **Option B (script):** Add a wrapper script that runs `xdg-open ""` or `zen-browser --new-window` and set `NIXOMARCHY_BROWSER` in your env if you want a configurable default.

---

## 2. omanix-launch-or-focus

**What it does:** Launches an app by name/class or focuses its window if it’s already running. Used for “launch Spotify / Obsidian / etc. or focus it.” Uses Hyprland and `jq` to find windows by class and either activate or exec the app.

**Deps:** `bash`, `hyprland`, `jq`, `coreutils`

**How to implement:**
- **Option A (keybinding):** One binding per app, e.g. `exec, spotify` (Spotify usually raises when started again) or a small script that runs `hyprctl dispatch exec spotify` and uses `hyprctl clients` + `jq` to focus by class if a window exists.
- **Option B (script):** Copy `omanix-launch-or-focus.sh` from omanix, wrap it with `makeWrapper` and pass no env if you only need “exec app” behavior; for full focus logic, keep the script and depend on `hyprland` + `jq` in your config.

---

## 3. omanix-launch-tui

**What it does:** Opens a TUI application (e.g. btop, lazydocker) in a new Ghostty window. Runs `ghostty -e <command>` or similar.

**Deps:** `bash`, `ghostty`, `coreutils`

**How to implement:**
- **Option A (keybinding):** e.g. `$mod SHIFT, T, exec, ghostty -e btop` for Activity (btop). Add more bindings for other TUIs.
- **Option B (script):** A small wrapper that takes one argument (e.g. `btop`) and runs `ghostty -e "$1"`; wrap it and put it on PATH.

---

## 4. omanix-launch-or-focus-tui

**What it does:** Like launch-tui but tries to focus an existing Ghostty window that’s running the same TUI (e.g. btop) instead of opening a second one.

**Deps:** `bash`, `coreutils` (and relies on other omanix scripts on PATH for full logic)

**How to implement:** Copy the script if you need “single instance” TUI behavior; otherwise use a simple `exec, ghostty -e btop` binding and accept multiple windows.

---

## 5. omanix-cmd-terminal-cwd

**What it does:** Prints the current working directory of the focused terminal (e.g. for “open terminal here” from a file manager). Uses Hyprland to find the focused window and extracts cwd from its title or process.

**Deps:** `bash`, `hyprland`, `jq`, `procps`, `coreutils`

**How to implement:** Copy the script from omanix if you need “open terminal in CWD” elsewhere; otherwise skip. Some file managers and launchers can do this without a script.

---

## 6. omanix-launch-walker

**What it does:** Starts the Walker app launcher with optional width/height (from `OMANIX_WALKER_WIDTH`, `OMANIX_WALKER_HEIGHT`). May restart the Walker service first.

**Deps:** `bash`, `procps`, `systemd`, `coreutils`  
**Env:** `WALKER_BIN`, `OMANIX_WALKER_WIDTH`, `OMANIX_WALKER_HEIGHT`

**How to implement:** You already have `$mod, SPACE, exec, walker`. Walker’s size is configured in its config/theme; no script needed unless you want service restart or dynamic dimensions.

---

## 7. omanix-smart-delete

**What it does:** “Smart” window close in Hyprland: e.g. close the current window, or the whole group, depending on context (uses `hyprctl` and `jq`).

**Deps:** `bash`, `hyprland`, `jq`

**How to implement:** You already have `$mod, W, killactive`. For group kill or fancier behavior, copy the script or add a binding to `hyprctl dispatch killactive` with optional `submap`/custom logic.

---

## 8. omanix-menu

**What it does:** The **Super+Alt+Space** control menu. Launches Walker with a hierarchy of entries (Style, Capture, Share, System, Learn/Docs). Uses `OMANIX_MENU_WIDTH`, `OMANIX_MENU_MAX_HEIGHT`, `OMANIX_SCREENSAVER_LOGO`, and often other scripts on PATH.

**Deps:** `bash`, `coreutils`, `hyprpicker`, `libnotify`, `systemd`, `xdg-utils`  
**Env:** `WALKER_BIN`, `OMANIX_SCREENSAVER_LOGO`, `OMANIX_MENU_WIDTH`, `OMANIX_MENU_MAX_HEIGHT`

**How to implement:**
- **Full:** Copy `pkgs/omanix-scripts` into the repo, rename to `nixomarchy-scripts`, and in the Nix wrapper pass `NIXOMARCHY_MENU_WIDTH`, `NIXOMARCHY_MENU_MAX_HEIGHT`, theme list, docs paths, etc. from your config. Point the menu entries at your own scripts (screenshot, lock, reboot, etc.).
- **Minimal:** Bind `$mod ALT, SPACE` to a simple Walker run with a custom config that shows a short list of actions (e.g. “Lock” → hyprlock, “Screenshot” → your screenshot script) without the full Omanix menu tree.

---

## 9. omanix-menu-style

**What it does:** Submenu for theme/style: switch theme or wallpaper. Uses themes JSON, swaybg, Ghostty, glow, and env vars like `OMANIX_THEMES_FILE`, `OMANIX_DOC_STYLE_PREVIEW`, `OMANIX_DOC_STYLE_OVERRIDE`.

**Deps:** `bash`, `jq`, `coreutils`, `gnused`, `envsubst`, `swaybg`, `ghostty`, `glow`  
**Env:** `WALKER_BIN`, `OMANIX_THEMES_FILE`, `OMANIX_DOC_STYLE_PREVIEW`, `OMANIX_DOC_STYLE_OVERRIDE`

**How to implement:** In NixOmarchy themes are build-time (nix-colors); you don’t have a runtime theme list. You can skip this, or add a minimal “next wallpaper” script that cycles through `nixomarchyActiveTheme.assets.wallpapers` (e.g. via hyprpaper or swaybg) and expose it from a simple menu.

---

## 10. omanix-menu-keybindings

**What it does:** Shows Hyprland keybindings in a Walker menu (parses Hyprland config or `hyprctl binds` and presents them in a readable list). Great for “Learn → Keybindings.”

**Deps:** `bash`, `gawk`, `libxkbcommon`, `hyprland`, `jq`, `gnused`, `coreutils`

**How to implement:**
- **Option A:** Run `hyprctl binds` and pipe to a dmenu/rofi/walker dialog, or use a keybinding that opens a Ghostty window with `hyprctl binds`.
- **Option B:** Copy the script; it’s self-contained aside from Walker and Hyprland.

---

## 11. omanix-show-style-help

**What it does:** Displays style/theme documentation (e.g. Markdown) in a viewer (glow) or Ghostty. Uses `OMANIX_DOC_STYLE`, `OMANIX_THEME_LIST`.

**Deps:** `bash`, `coreutils`, `gnused`, `ghostty`, `glow`  
**Env:** `OMANIX_DOC_STYLE`, `OMANIX_THEME_LIST`

**How to implement:** If you have a `docs/` or `THEMES.md` in the repo, add a binding or menu entry: `exec, glow ~/.config/nixomarchy/docs/themes.md` or `exec, ghostty -e less docs/themes.md`.

---

## 12. omanix-show-setup-help

**What it does:** Opens setup/install documentation (e.g. from `OMANIX_DOCS_DIR`).

**Deps:** `bash`, `ghostty`, `glow`, `coreutils`  
**Env:** `OMANIX_DOCS_DIR`

**How to implement:** Point a binding or menu entry at your README or `docs/README.md`, e.g. `exec, glow /path/to/NixOmarchy/README.md`.

---

## 13. omanix-cmd-logout

**What it does:** Logs out the Hyprland session (e.g. `hyprctl dispatch exit` or `loginctl terminate-user $USER`).

**Deps:** `bash`, `hyprland`, `jq`, `coreutils`

**How to implement:** You have `$mod, M, exit`. That is equivalent. No script needed.

---

## 14. omanix-restart-walker

**What it does:** Restarts the Walker systemd user service and notifies the user.

**Deps:** `bash`, `systemd`, `libnotify`, `coreutils`

**How to implement:** `systemctl --user restart walker` (if you run Walker as a service) + optional `notify-send "Walker restarted"`. Add a keybinding or menu entry.

---

## 15. omanix-launch-audio

**What it does:** Opens Pavucontrol (audio settings).

**Deps:** `bash`, `pavucontrol`

**How to implement:** Bind e.g. `$mod, A, exec, pavucontrol` (or use your Waybar pulseaudio module’s on-click if it already opens pavucontrol).

---

## 16. omanix-launch-wifi

**What it does:** Launches the WiFi TUI (in Omanix, often wlctl). May need other scripts on PATH.

**Deps:** `bash`  
**Implementation:** Usually runs `wlctl` or similar.

**How to implement:** Bind `$mod, F2` (or similar) to `exec, wlctl` (you already have wlctl in the overlay). No script needed.

---

## 17. omanix-launch-bluetooth

**What it does:** Opens the Bluetooth manager (e.g. blueman-manager).

**Deps:** `bash`

**How to implement:** `exec, blueman-manager`. Your Waybar bluetooth module may already have an on-click for this.

---

## 18. omanix-toggle-waybar

**What it does:** Toggles Waybar visibility (e.g. by sending a signal or toggling the systemd user service).

**Deps:** `bash`, `systemd`

**How to implement:** You have `$mod SHIFT, SPACE, exec, pkill -SIGUSR1 waybar`. That is the toggle. No script needed.

---

## 19. omanix-cmd-screenshot

**What it does:** Interactive screenshot flow: choose region/window/fullscreen (e.g. with grim, slurp, wayfreeze), copy to clipboard and/or save to file, then optionally open in Satty for annotation. Can show a Walker or dialog to pick mode.

**Deps:** `bash`, `coreutils`, `jq`, `gawk`, `procps`, `hyprland`, `grim`, `slurp`, `wl-clipboard`, `wayfreeze`, `libnotify`

**How to implement:**
- **Option A (keybindings):** One binding for region (e.g. `grim -g "$(slurp)" - | wl-copy`), one for fullscreen, one for window (hyprctl + grim). Optionally run Satty on the result.
- **Option B (script):** Copy `omanix-cmd-screenshot.sh` and adapt to use your paths and notification; ensure grim, slurp, wl-clipboard, and optionally wayfreeze and Satty are in the wrapper PATH.

---

## 20. omanix-lock-screen

**What it does:** Locks the session (hyprlock). In Omanix it can also trigger 1Password/Bitwarden unlock flow before or after lock.

**Deps:** `bash`, `hyprland`, `hyprlock`, `libnotify`, `bitwarden-cli`, `procps`

**How to implement:** You have `$mod, L, exec, hyprlock`. For Bitwarden integration, copy the script and add `bitwarden-cli` to your config, or add a small wrapper that runs `bw unlock` then `hyprlock`.

---

## 21. omanix-cmd-shutdown

**What it does:** Shuts down the system (Hyprland-aware: may close clients gracefully then `systemctl poweroff`).

**Deps:** `bash`, `hyprland`, `jq`, `coreutils`, `systemd`

**How to implement:** Bind to `exec, systemctl poweroff` (and optionally a confirm dialog). For graceful Hyprland close, copy the script.

---

## 22. omanix-cmd-reboot

**What it does:** Reboots the system.

**Deps:** `bash`, `hyprland`, `jq`, `coreutils`, `systemd`

**How to implement:** `exec, systemctl reboot`. Add a binding or menu entry.

---

## 23. omanix-cmd-audio-switch

**What it does:** Switches the default audio output/sink (e.g. headphones vs speakers) using PulseAudio/PipeWire and optionally shows OSD (e.g. swayosd).

**Deps:** `bash`, `jq`, `hyprland`, `pulseaudio`, `swayosd`

**How to implement:** Use `pactl`/`pw-cli` to list sinks and set default, or a small script that cycles sinks and runs `swayosd-client` for feedback. You can copy the script and ensure pulseaudio (or pipewire-pulse) and swayosd are in the wrapper.

---

## 24. omanix-hyprland-window-close-all

**What it does:** Closes all windows in the current workspace or group (Hyprland).

**Deps:** `bash`, `hyprland`, `jq`, `coreutils`

**How to implement:** Add a binding that runs a one-liner with `hyprctl clients` + `jq` to get addresses and `hyprctl dispatch closewindow` in a loop, or copy the script.

---

## 25. omanix-hyprland-window-pop

**What it does:** “Pops” a window out of its group (Hyprland group/stack).

**Deps:** `bash`, `hyprland`, `jq`

**How to implement:** Usually `hyprctl dispatch fullscreen 0` or a specific dispatch; check Hyprland docs. Copy the script if you want exact behavior.

---

## 26. omanix-hyprland-workspace-toggle-gaps

**What it does:** Toggles Hyprland gaps (inner/outer) and border size between two presets (e.g. 0/0 and 5/10). Uses `OMANIX_GAPS_OUTER`, `OMANIX_GAPS_INNER`, `OMANIX_BORDER_SIZE`.

**Deps:** `bash`, `hyprland`, `jq`  
**Env:** `OMANIX_GAPS_OUTER`, `OMANIX_GAPS_INNER`, `OMANIX_BORDER_SIZE`

**How to implement:** Use `hyprctl keyword general:gaps_in 0` and `general:gaps_out 0` to disable, and your default (e.g. 5/10) to enable. Add a binding that toggles between two states (e.g. a small script that reads current and switches).

---

## 27. omanix-theme-bg-next

**What it does:** Cycles to the next wallpaper from a newline-separated list in `OMANIX_WALLPAPERS` and applies it (e.g. with swaybg or hyprpaper).

**Deps:** `bash`, `coreutils`, `swaybg`, `libnotify`, `procps`  
**Env:** `OMANIX_WALLPAPERS`

**How to implement:** If you use hyprpaper, implement “next wallpaper” by keeping an index in a file and calling `hyprpaper` with the next path from `nixomarchyActiveTheme.assets.wallpapers` or a fixed list. Or bind to a script that cycles and updates hyprpaper.

---

## 28. omanix-toggle-idle

**What it does:** Pauses or resumes hypridle (stops/starts the hypridle service so the screen doesn’t dim/lock while you’re watching something).

**Deps:** `bash`, `procps`, `hypridle`, `libnotify`

**How to implement:** `systemctl --user stop hypridle` / `systemctl --user start hypridle` (and notify). Add a keybinding.

---

## 29. omanix-cmd-screenrecord

**What it does:** Starts (and stops) screen recording with gpu-screen-recorder, shows an indicator in Waybar, and optionally handles audio/webcam. Uses a marker file and Waybar signal to show “recording” state.

**Deps:** `bash`, `coreutils`, `jq`, `gawk`, `procps`, `hyprland`, `gpu-screen-recorder`, `ffmpeg`, `v4l-utils`, `libnotify`, `waybar`, `wl-clipboard`

**How to implement:** Copy the script if you want the full flow (start/stop, Waybar, clipboard). Otherwise add a simple binding to start `gpu-screen-recorder` with your preferred flags and a second binding or script to stop it.

---

## 30. omanix-workspace

**What it does:** Workspace/monitor helpers (e.g. move workspace to monitor, or follow a map). Uses `OMANIX_MONITOR_MAP`.

**Deps:** `bash`, `hyprland`, `jq`  
**Env:** `OMANIX_MONITOR_MAP`

**How to implement:** Only needed for advanced multi-monitor workflows. Copy the script and pass a monitor map from your config, or use Hyprland bindings (e.g. move focus to monitor, move window to workspace on monitor) directly.

---

## 31. omanix-cmd-share

**What it does:** Share flow: e.g. pick a file or clipboard content and send via LocalSend or copy to clipboard, with fzf for selection.

**Deps:** `bash`, `coreutils`, `wl-clipboard`, `libnotify`, `systemd`, `fzf`, `localsend`

**How to implement:** Install LocalSend if you use it; add a binding that runs `localsend` or a small script that uses fzf to pick a file and then runs your share command. Copy the script for the full flow.

---

## Summary table

| Script | What it does | Easiest NixOmarchy implementation |
|--------|----------------|-----------------------------------|
| launch-browser | Open default browser | Bind to `zen-browser` or `xdg-open` |
| launch-or-focus | Launch app or focus window | Bind per app or copy script |
| launch-tui | Open TUI in Ghostty | Bind `ghostty -e btop` etc. |
| launch-or-focus-tui | Same, single instance | Copy script or skip |
| cmd-terminal-cwd | Print focused terminal CWD | Copy script if needed |
| launch-walker | Start Walker | You have `exec, walker` |
| smart-delete | Smart close window | You have `killactive` |
| **menu** | **Super+Alt+Space control menu** | Copy scripts + provide config, or minimal Walker menu |
| menu-style | Theme/style submenu | Skip or minimal wallpaper cycle |
| menu-keybindings | Show keybindings in Walker | Copy script or `hyprctl binds` in Ghostty |
| show-style-help | Show theme docs | Bind to `glow`/path to docs |
| show-setup-help | Show setup docs | Bind to README path |
| cmd-logout | Log out | You have `exit` |
| restart-walker | Restart Walker service | Bind `systemctl --user restart walker` |
| launch-audio | Open Pavucontrol | Bind `pavucontrol` |
| launch-wifi | WiFi TUI | Bind `wlctl` |
| launch-bluetooth | Bluetooth manager | Bind `blueman-manager` |
| toggle-waybar | Toggle Waybar | You have `pkill -SIGUSR1 waybar` |
| cmd-screenshot | Screenshot + Satty | Bind grim/slurp/Satty or copy script |
| lock-screen | Lock + optional Bitwarden | You have `hyprlock` |
| cmd-shutdown | Shutdown | Bind `systemctl poweroff` |
| cmd-reboot | Reboot | Bind `systemctl reboot` |
| cmd-audio-switch | Switch audio output | Copy script or pactl/pw-cli one-liner |
| hyprland-window-close-all | Close all in workspace | Copy script or binding |
| hyprland-window-pop | Pop window from group | Copy script or fullscreen toggle |
| hyprland-workspace-toggle-gaps | Toggle gaps | Script or two keybindings |
| theme-bg-next | Next wallpaper | Script cycling wallpapers list |
| toggle-idle | Pause/resume hypridle | Bind stop/start hypridle |
| cmd-screenrecord | Screen record + Waybar | Copy script or simple gpu-screen-recorder binding |
| workspace | Monitor/workspace map | Copy script if needed |
| cmd-share | Share via LocalSend/fzf | Copy script or bind localsend |

If you copy the full `omanix-scripts` package, you must provide the same env vars (or renamed to `NIXOMARCHY_*`) from your Nix config (theme list, wallpapers, menu size, docs paths, gaps, etc.) and ensure all runtime deps (wayfreeze, bitwarden-cli, localsend, etc.) are available or stubbed.
