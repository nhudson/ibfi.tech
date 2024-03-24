# Makefile
PYTHON = python3
WEB_DIR = .
GEN_SCRIPT = scripts/gen_images.sh

.PHONY: all generate serve

all: generate serve

generate:
	@chmod +x $(GEN_SCRIPT)
	@./$(GEN_SCRIPT)
	@echo "Generated images.json successfully."

serve:
	@cd $(WEB_DIR) && $(PYTHON) -m http.server
	@echo "Serving $(WEB_DIR) on http://localhost:8000"
