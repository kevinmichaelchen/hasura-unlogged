.PHONY: all check_pkgx

RED = \033[0;31m
YELLOW = \033[1;33m
BLUE = \033[0;34m
GREEN = \033[0;32m
NC = \033[0m

all: check_pkgx
	pkgx task start

check_pkgx:
	@echo "$(YELLOW)Checking if pkgx is installed...$(NC)"
	@if ! command -v pkgxx > /dev/null; then \
		echo "$(RED)Error: pkgx is not installed. Please install it and try again.$(NC)"; \
		echo "$(RED)Consult the docs here: https://docs.pkgx.sh/$(NC)"; \
		echo "$(BLUE)The easiest way to install is with:$(NC)"; \
		echo "$(BLUE)curl -fsS https://pkgx.sh | sh$(NC)"; \
		exit 1; \
	fi
	@echo "pkgx is installed."
