{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:Misterio77/nix-colors";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    # Omanix-style: login, app launcher, WiFi TUI
    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wlctl = {
      url = "github:aashish-thapa/wlctl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    hyprdynamicmonitors = {
      url = "github:fiffeek/hyprdynamicmonitors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvf, home-manager, nix-colors, nixos-hardware, nix-flatpak, elephant, walker, silentSDDM, wlctl, zen-browser, hyprdynamicmonitors, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    # Single source of truth: nix-colors scheme (used by Home Manager + SilentSDDM)
    nixColorsScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
    # Lib (omanix-style): color utils + theme data. Theme colors derived from nix-colors.
    nixomarchyLib = import ./lib/default.nix { lib = nixpkgs.lib; };
    nixomarchyActiveTheme = nixomarchyLib.themes.fromNixColors nixColorsScheme;
    # Overlay: wlctl + omanix-screensaver (from pkgs/)
    wlctlOverlay = final: prev: {
      wlctl = inputs.wlctl.packages.${prev.stdenv.hostPlatform.system}.default;
      omanix-screensaver = prev.callPackage ./pkgs { };
    };
    # Ensure Home Manager sees the overlayed pkgs (NixOS uses nixpkgs.overlays; HM gets this via extraSpecialArgs).
    overlayedPkgs = pkgs.extend wlctlOverlay;
  in
  {
    # suru-icons are in modules/home-manager/theme/icons.nix
    #packages.${system}.default = (import ./modules/suru-icons.nix { inherit pkgs; });

    nixosConfigurations.baal = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; nixColorsScheme = nixColorsScheme; };
      system = "x86_64-linux";
      modules = [
        ./nixos/baal/configuration.nix
        ./modules/nixos/gaming/steam.nix
        ./modules/nixos/silent-sddm.nix
        ./modules/nixos/wlctl-overlay.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-x1-12th-gen
        nix-flatpak.nixosModules.nix-flatpak
        nvf.nixosModules.default
        silentSDDM.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [ wlctlOverlay ];
          home-manager.extraSpecialArgs = {
            inherit inputs nixColorsScheme nixomarchyLib nixomarchyActiveTheme overlayedPkgs;
            nixColorsLib = nix-colors.lib;
          };
          home-manager.users.keion = {
            imports = [
              nix-colors.homeManagerModule
              walker.homeManagerModules.default
              zen-browser.homeModules.default
              hyprdynamicmonitors.homeManagerModules.default
              ./modules/home-manager/default.nix
            ];
          };
        }
      ];
    };
  };
}
