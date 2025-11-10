.PHONY: switch
switch:
	sudo nix run nix-darwin -- switch --flake .

.PHONY: update
update:
	nix flake update

.PHONY: clean
clean:
	nix-collect-garbage -d
