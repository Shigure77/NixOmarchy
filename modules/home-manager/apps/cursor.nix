# Cursor IDE: same extensions as VSCodium (from nixomarchy.vscodeExtensions in vscode-extensions.nix).
{ config, lib, pkgs, ... }:
let
  exts = config.nixomarchy.vscodeExtensions or [ ];
  linkExtension = ext: ''
    if [ -d "${ext}/share/vscode/extensions" ]; then
      for d in "${ext}/share/vscode/extensions"/*; do
        [ -d "$d" ] && ln -sfn "$d" "$CURSOR_EXT_DIR/$(basename "$d")" 2>/dev/null || true
      done
    fi
    if [ -d "${ext}/lib/vscode/extensions" ]; then
      for d in "${ext}/lib/vscode/extensions"/*; do
        [ -d "$d" ] && ln -sfn "$d" "$CURSOR_EXT_DIR/$(basename "$d")" 2>/dev/null || true
      done
    fi
  '';
in
{
  home.packages = [ pkgs.code-cursor ];

  home.activation.installCursorExtensions = lib.mkIf (exts != [ ]) (lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    CURSOR_EXT_DIR="$HOME/.cursor/extensions"
    mkdir -p "$CURSOR_EXT_DIR"
    ${lib.concatStringsSep "\n" (map linkExtension exts)}
  '');
}
