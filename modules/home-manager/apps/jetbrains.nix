# JetBrains IntelliJ / RustRover (from omanix). Enable via nixomarchy.apps.jetbrains.
{ config, pkgs, lib, ... }:
let
  cfg = config.nixomarchy.apps.jetbrains or { intellij.enable = false; rustrover.enable = false; };
  mkMajorMinor = pkg:
  let
    parts = lib.splitString "." pkg.version;
  in
    "${builtins.elemAt parts 0}.${builtins.elemAt parts 1}";
  baseVmOptions = [ "-Dawt.toolkit.name=WLToolkit" ];
  mkVmOptionsContent = extra: lib.concatStringsSep "\n" (baseVmOptions ++ extra);
in
{
  options.nixomarchy.apps.jetbrains = {
    intellij = {
      enable = lib.mkEnableOption "IntelliJ IDEA";
      extraVmOptions = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
    };
    rustrover = {
      enable = lib.mkEnableOption "RustRover";
      extraVmOptions = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
    };
  };

  config = lib.mkIf (cfg.intellij.enable || cfg.rustrover.enable) {
    home.packages = lib.flatten [
      (lib.optional (cfg.intellij.enable) pkgs.jetbrains.idea)
      (lib.optional (cfg.rustrover.enable) pkgs.jetbrains.rust-rover)
    ];
    xdg.configFile = lib.mkMerge [
      (lib.mkIf (cfg.intellij.enable) {
        "JetBrains/IntelliJIdea${mkMajorMinor pkgs.jetbrains.idea}/idea64.vmoptions" = {
          text = mkVmOptionsContent (cfg.intellij.extraVmOptions or [ ]);
          force = true;
        };
      })
      (lib.mkIf (cfg.rustrover.enable) {
        "JetBrains/RustRover${mkMajorMinor pkgs.jetbrains.rust-rover}/rustrover64.vmoptions" = {
          text = mkVmOptionsContent (cfg.rustrover.extraVmOptions or [ ]);
          force = true;
        };
      })
    ];
  };
}
