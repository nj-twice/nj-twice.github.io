{
  description = "Website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
    packages.x86_64-linux.default = pkgs.callPackage ./nix/site.nix { inherit self; };
    devShells.x86_64-linux.default = pkgs.mkShell {
      inputsFrom = [
        self.packages.x86_64-linux.default
      ];
      packages = with pkgs; [
        vscode-css-languageserver
      ];
    };
  };
}
