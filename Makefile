# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Iinclude

# Version management
VERSION := $(shell cat VERSION | tr -d ' ')
GIT_COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")
GIT_TAG := $(shell git describe --tags --abbrev=0 2>/dev/null || echo "unknown")
BUILD_DATE := $(shell date +%Y-%m-%d)

# Get configuration values from config.h
APP_NAME := $(shell grep '^#define APP_NAME' include/config.h | cut -d'"' -f2)
APP_AUTHOR := $(shell grep '^#define APP_AUTHOR' include/config.h | cut -d'"' -f2)
APP_EMAIL := $(shell grep '^#define APP_EMAIL' include/config.h | cut -d'"' -f2)
APP_WEBSITE := $(shell grep '^#define APP_WEBSITE' include/config.h | cut -d'"' -f2)
APP_LICENSE := $(shell grep '^#define APP_LICENSE' include/config.h | cut -d'"' -f2)

# Add version information to CFLAGS
CFLAGS += -DAPP_VERSION=\"$(VERSION)\" \
          -DGIT_COMMIT=\"$(GIT_COMMIT)\" \
          -DGIT_TAG=\"$(GIT_TAG)\" \
          -DBUILD_DATE=\"$(BUILD_DATE)\"

# Directories
SRC_DIR = src
BUILD_DIR = build

# Source and object files
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Target executable
TARGET = $(BUILD_DIR)/$(APP_NAME)

# Default target
all: $(TARGET)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# Clean build files
clean:
	rm -rf $(BUILD_DIR)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Print application information
info:
	@echo "Name: $(APP_NAME)"
	@echo "Version: $(VERSION)"
	@echo "Git Commit: $(GIT_COMMIT)"
	@echo "Git Tag: $(GIT_TAG)"
	@echo "Build Date: $(BUILD_DATE)"
	@echo "Author: $(APP_AUTHOR)"
	@echo "Email: $(APP_EMAIL)"
	@echo "Website: $(APP_WEBSITE)"
	@echo "License: $(APP_LICENSE)"

release:
	@echo "Creating release $(VERSION)..."
	@git tag -a v$(VERSION) -m "Release version $(VERSION)"
	@echo "Tagged as v$(VERSION)"
	@echo "Don't forget to push the tag: git push origin v$(VERSION)"

.PHONY: all clean run info release