.PHONY: update
update:
	nix run nix-darwin -- switch --flake .

.PHONY: clean
clean:
	nix-collect-garbage -d