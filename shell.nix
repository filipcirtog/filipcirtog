{ pkgs ? import <nixpkgs> {} }:

let
in pkgs.mkShell {
  buildInputs = [
    pkgs.yq
    pkgs.jq
    pkgs.gettext
    pkgs.bashInteractive
    pkgs.go
    pkgs.kubectl
    pkgs.kubernetes-controller-tools
    pkgs.kustomize
    pkgs.git    
    pkgs.envsubst
    pkgs.wget
    pkgs.cosign
    pkgs.golangci-lint
    pkgs.govulncheck
    pkgs.gotools
    pkgs.go-licenses
  ];

  shellHook = ''
    export PATH=$PATH:${pkgs.go}/bin
    export PATH=$PATH:${pkgs.cosign}/bin
    export PATH=$PATH:${pkgs.go-licenses}/bin
    export PATH=$PATH:${pkgs.yq}/bin
    export PATH=$PATH:${pkgs.wget}/bin
    export PATH=$PATH:${pkgs.envsubst}/bin
    export PATH=$PATH:${pkgs.git}/bin
    export PATH=$PATH:${pkgs.jq}/bin
    export PATH=$PATH:${pkgs.gettext}/bin
    export PATH=$PATH:${pkgs.bashInteractive}/bin
    export PATH=$PATH:${pkgs.kubernetes-controller-tools}/bin
    export PATH=$PATH:${pkgs.kubectl}/bin
    export PATH=$PATH:${pkgs.kustomize}/bin
    export PATH=$PATH:${pkgs.govulncheck}/bin
    export PATH=$PATH:${pkgs.gotools}/bin
  '';
}
