version := `node -p "require('./package.json').version"`

# List recipes
default:
  @just --list

# Get the version of the extension
get_version:
	@echo Plugin version: {{version}}

# Build the extension
build:
    npm install
    npm run build

# Install the VSCode extension
install: build
    code --install-extension "vscode-template-literals-{{version}}.vsix"

# Clean up built files
clean:
    rm -f *.vsix

# Uninstall the extension
uninstall:
    code --uninstall-extension julienetie.vscode-template-literals

# Reinstall the extension
reinstall: uninstall install
    @echo "\nReinstalled 👩🏻‍🌾"
