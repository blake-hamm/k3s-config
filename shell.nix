# shell.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = { allowUnfree = true; }; overlays = []; };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    vault
    kubectl
    kubernetes-helm
    argocd
  ];
}
