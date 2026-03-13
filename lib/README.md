# NixOmarchy lib (omanix-style)

This folder mirrors [omanix’s lib](https://github.com/T00fy/omanix/tree/main/lib) so we can use the same theme shape and color helpers without depending on the omanix flake.

**nix-colors is the source of truth.** The lib’s theme *colors* are derived from the active nix-colors scheme via `themes.fromNixColors(scheme)`; only meta, assets, and bat are static.

## What’s in here

- **`default.nix`** – Exposes `colors` (from color-utils.nix) and `themes` (from themes.nix).
- **`color-utils.nix`** – Helpers: `stripHash`, `hexToRgb`, `hexToRgbDecimal`, `hexToRgbaCss` for hex ↔ RGB and CSS.
- **`themes.nix`** – Builds the theme from nix-colors:
  - `themes.fromNixColors(scheme)` – returns a full theme (meta, assets, bat, colors) with `colors` derived from `scheme.palette` (base00–base0F).
  - Static: meta (name, slug, icon_theme), assets.wallpapers, bat (name, url, sha256). Colors come from the scheme.

The flake passes `nixomarchyLib` and `nixomarchyActiveTheme = nixomarchyLib.themes.fromNixColors nixColorsScheme`.

## Audit: Omanix theme usage vs NixOmarchy

| Omanix module        | Omanix uses theme for                    | NixOmarchy                                      |
|----------------------|------------------------------------------|-------------------------------------------------|
| **bat**              | `theme.bat` (name, url, sha256)          | **Lib**: `nixomarchyActiveTheme.bat.name`       |
| **ghostty**          | `theme.colors` (background, fg, palette) | **nix-colors**: `colorScheme.palette`           |
| **waybar**           | `theme.colors` (bg, fg, accent)          | **nix-colors**: `colorScheme.palette`           |
| **mako**             | `theme.colors` (fg, accent, bg)          | **nix-colors**: `colorScheme.palette`           |
| **hyprlock**         | `theme.colors` + `theme.assets.wallpaper`| **nix-colors** for colors; no wallpaper from theme |
| **btop**             | `theme.colors` (full palette)            | **nix-colors**: `colorScheme.palette`           |
| **satty**            | `theme.colors` (accent, color1–6)       | **nix-colors**: `colorScheme.palette`           |
| **swayosd**          | `theme.colors` (bg, fg, accent, color1/8)| **nix-colors**: `colorScheme.palette`           |
| **firefox**          | `theme.colors` (bg, fg, accent)         | **nix-colors**: `colorScheme.palette`           |
| **hyprland/visuals** | `theme.colors` (accent, color8)          | **nix-colors**: `colorScheme.palette`           |
| **walker**           | `theme.colors` (bg, fg, accent) in CSS   | **Lib**: `nixomarchyActiveTheme.colors` in style |
| **hyprpaper**        | `theme.assets.wallpaper`                 | **Lib**: `nixomarchyActiveTheme.assets.wallpapers` when non-empty |

So: **bat**, **walker**, and **hyprpaper** use the lib (theme name, theme colors for walker style, wallpapers). All others are fully satisfied by nix-colors and are left as-is.

To add another theme variant (e.g. different meta/bat or wallpapers), extend `themes.nix`; colors will still be derived from nix-colors.
