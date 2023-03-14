RUN=nvim --headless --noplugin -u test/spec.vim

.PHONY: all
all: prepare lint test

.PHONY: prepare
prepare:
	git submodule update --depth 1 --init

.PHONY: nvim
nvim:
	@nvim --noplugin -u test/spec.vim

.PHONY: lint
lint:
	@echo "Linting..."
	stylua .
	@echo

.PHONY: test
test:
	@echo "Run tests..."
	@$(RUN) -c "PlenaryBustedDirectory test/spec/ { minimal_init = 'test/spec.vim' }"
	@echo
