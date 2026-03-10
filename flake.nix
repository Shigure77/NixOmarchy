{
  description = "NixOmarchy - Personal NixOS config based on omarchy-nix (Hyprland)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    omarchy-nix = {
      url = "github:henrysipp/omarchy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nvf, home-manager, nixos-hardware, nix-flatpak, omarchy-nix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    #to include suru-icons in the home-manager config, uncomment the following line and add the line to the home-manager/home.nix file
    #packages.${system}.default = (import ./modules/suru-icons.nix { inherit pkgs; });

    nixosConfigurations.baal = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./nixos/baal/configuration.nix
        ./modules/nixos/gaming/steam.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-x1-12th-gen
        nix-flatpak.nixosModules.nix-flatpak
        nvf.nixosModules.default
        omarchy-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.youruser = {
            imports = [
              ./home-manager/home.nix
              omarchy-nix.homeManagerModules.default
              ./modules/home-manager/vscode.nix  # VSCodium + extra extensions (after omarchy)
            ];
          };
          # omarchy-nix configuration (theme, user info, etc.)
          omarchy = {
            full_name = "Your Name";
            email_address = "you@example.com";
            theme = "gruvbox";
          };
        }
      ];
    };
  };
}
