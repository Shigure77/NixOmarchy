{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = { self, nixpkgs, nvf, home-manager, nixos-hardware, nix-flatpak, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # suru-icons are in modules/home-manager/theme/icons.nix
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
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.keion = {
            imports = [ ./modules/home-manager/default.nix ];
          };
        }
      ];
    };
  };
}
