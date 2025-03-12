CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -std=c11 -g
CXXFLAGS = -Wall -Wextra -std=c++17 -g

PROBLEM ?= 1749

PROBLEM_DIR = leetcode/problem-$(PROBLEM)
SOURCE_C = $(PROBLEM_DIR)/main.c
SOURCE_CPP = $(PROBLEM_DIR)/main.cpp
OUTPUT = $(PROBLEM_DIR)/solution

all:
	@if [ -f $(SOURCE_CPP) ]; then \
		echo "Building C++ solution for Problem $(PROBLEM)"; \
		$(CXX) $(CXXFLAGS) $(SOURCE_CPP) -o $(OUTPUT); \
	elif [ -f $(SOURCE_C) ]; then \
		echo "Building C solution for Problem $(PROBLEM)"; \
		$(CC) $(CFLAGS) $(SOURCE_C) -o $(OUTPUT); \
	else \
		echo "Error: Neither $(SOURCE_C) nor $(SOURCE_CPP) exists"; \
		exit 1; \
	fi
	@echo "Running solution for Problem $(PROBLEM)"
	@./$(OUTPUT)

clean:
	@echo "Cleaning solution for Problem $(PROBLEM)"
	@rm -f $(OUTPUT)

new:
	@mkdir -p $(PROBLEM_DIR)
	@if [ ! -f $(SOURCE_C) ] && [ ! -f $(SOURCE_CPP) ]; then \
		echo "Creating new problem directory for Problem $(PROBLEM)"; \
		read -p "Create [c/cpp] solution? " lang; \
		if [ "$$lang" = "cpp" ]; then \
			echo '#include <iostream>\n#include <vector>\n#include <string>\n\nclass Solution {\npublic:\n    // Solution function\n};\n\n// Test cases\nint main() {\n    std::cout << "Solution for Problem $(PROBLEM)\\n";\n    Solution solution;\n    return 0;\n}' > $(SOURCE_CPP); \
		else \
			echo '#include <stdio.h>\n#include <stdlib.h>\n\n// Solution function\n\n// Test cases\nint main() {\n    printf("Solution for Problem $(PROBLEM)\\n");\n    return 0;\n}' > $(SOURCE_C); \
		fi \
	fi

new-cpp:
	@mkdir -p $(PROBLEM_DIR)
	@if [ ! -f $(SOURCE_CPP) ]; then \
		echo "Creating new C++ problem directory for Problem $(PROBLEM)"; \
		echo '#include <iostream>\n#include <vector>\n#include <string>\n\nclass Solution {\npublic:\n    // Solution function\n};\n\n// Test cases\nint main() {\n    std::cout << "Solution for Problem $(PROBLEM)\\n";\n    Solution solution;\n    return 0;\n}' > $(SOURCE_CPP); \
	fi

new-c:
	@mkdir -p $(PROBLEM_DIR)
	@if [ ! -f $(SOURCE_C) ]; then \
		echo "Creating new C problem directory for Problem $(PROBLEM)"; \
		echo '#include <stdio.h>\n#include <stdlib.h>\n\n// Solution function\n\n// Test cases\nint main() {\n    printf("Solution for Problem $(PROBLEM)\\n");\n    return 0;\n}' > $(SOURCE_C); \
	fi

.PHONY: all clean new new-cpp new-c
