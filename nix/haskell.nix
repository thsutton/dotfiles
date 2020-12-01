{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;

  input-ghc = haskellPackages.ghcWithPackages (p: with p; [ text vector aeson ]);
  # NOTE: in `all-packages.nix`:
  # cabal-install = haskell.lib.justStaticExecutables haskellPackages.cabal-install;
  # hlint = haskell.lib.justStaticExecutables haskellPackages.hlint;
  input-ghc-heap-view = haskellPackages.ghc-heap-view;
  input-cabal-install = haskellPackages.cabal-install;
  input-hlint = haskellPackages.hlint;
  input-hindent = pkgs.haskell.lib.justStaticExecutables haskellPackages.hindent;
  input-ghcid = pkgs.haskell.lib.justStaticExecutables haskellPackages.ghcid;
in
  pkgs.stdenv.mkDerivation rec {
    name = "dev-haskell";
  
    buildInputs = [
      #git
      pkgs.gettext
      pkgs.jq
      pkgs.shellcheck
      pkgs.figlet
      input-ghc-heap-view
      input-ghc
      input-cabal-install
      input-hlint
      input-hindent
      input-ghcid
    ];
  }