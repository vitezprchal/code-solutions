CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -g

PROBLEM ?= 1749

PROBLEM_DIR = leetcode/problem-$(PROBLEM)
SOURCE = $(PROBLEM_DIR)/main.c
OUTPUT = $(PROBLEM_DIR)/solution

all:
	@if [ ! -f $(SOURCE) ]; then \
		echo "Error: $(SOURCE) does not exist"; \
		exit 1; \
	fi
	@mkdir -p $(PROBLEM_DIR)
	$(CC) $(CFLAGS) $(SOURCE) -o $(OUTPUT)
	@echo "Built solution for Problem $(PROBLEM)"
	@echo "Running solution for Problem $(PROBLEM)"
	@./$(OUTPUT)

clean:
	@echo "Cleaning solution for Problem $(PROBLEM)"
	@rm -f $(OUTPUT)

new:
	@mkdir -p $(PROBLEM_DIR)
	@if [ ! -f $(SOURCE) ]; then \
		echo "Creating new problem directory for Problem $(PROBLEM)"; \
		echo '#include <stdio.h>\n#include <stdlib.h>\n\n// Solution function\n\n// Test cases\nint main() {\n    printf("Solution for Problem $(PROBLEM)\\n");\n    return 0;\n}' > $(SOURCE); \
	fi

.PHONY: all clean new
