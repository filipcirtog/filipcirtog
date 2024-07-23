{ pkgs ? import <nixpkgs> {} }:

let
overlay = self: super: {
    golangci-lint = super.golangci-lint.overrideAttrs (oldAttrs: {
      version = "1.54.2";
      src = super.fetchFromGitHub {
        owner = "golangci";
        repo = "golangci-lint";
        rev = "v1.54.0";
        sha256 = "eebf3786f4a33ec2c04724c90bada412f0343704e1c19b475d6aa25ee8c1ac16";
      };
    });
  };

  pkgsWithOverlay = import <nixpkgs> {
    overlays = [ overlay ];
  };
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
