{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }: {
		packages.x86_64-linux = let
			pkgsHost = nixpkgs.legacyPackages.x86_64-linux;
			pkgsCross = {
				aarch64-linux = import nixpkgs {
					system = "x86_64-linux";
					crossSystem.config = nixpkgs.legacyPackages.aarch64-linux.stdenv.targetPlatform.config;
				};
			};
		in rec {
			default = bwrap-x86_64-linux;

			bwrap-x86_64-linux = pkgsHost.pkgsStatic.bubblewrap;
			bwrap-aarch64-linux = pkgsCross.aarch64-linux.pkgsStatic.bubblewrap;
		};
	};

		# flake-utils.lib.eachDefaultSystem (system: {
		# 	packages = rec {
		# 		default = bubblewrap;
		# 		bubblewrap = nixpkgs.legacyPackages.${system}.pkgsStatic.bubblewrap;
		# 	};
		# 	apps = rec {
		# 		default = bwrap;
		# 		bwrap = {
		# 			type = "app";
		# 			program = nixpkgs.lib.getExe self.packages.${system}.bubblewrap;
		# 		};
		# 	};
		# });
}
