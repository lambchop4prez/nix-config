.PHONY: update
update:
	sudo nix run nix-darwin -- switch --flake .

.PHONY: clean
clean:
	nix-collect-garbage -d