#!/bin/bash

# Setup script for MacBook Pro M3
# This script automates the installation of development tools and applications

# Set up logging
mkdir -p logs
exec 1> >(tee "logs/setup.log")
exec 2>&1

echo "🚀 Starting MacBook Pro setup script..."

# Function to check command success
check_success() {
    if [ $? -eq 0 ]; then
        echo "✅ $1 successful"
    else
        echo "❌ $1 failed"
        exit 1
    fi
}

# Install Xcode Command Line Tools
echo "📦 Installing Xcode Command Line Tools..."
xcode-select --install || true
sudo xcodebuild -license accept

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    check_success "Homebrew installation"
    
    # Add Homebrew to PATH for Apple Silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Create Brewfile if it doesn't exist
if [ ! -f "Brewfile" ]; then
    echo "📝 Creating Brewfile..."
    cat > Brewfile << EOL
# Taps
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"

# Development Tools
cask "visual-studio-code"
cask "docker"
cask "android-studio"
cask "github"
cask "anaconda"
cask "google-chrome"

# AI/ML Tools
brew "ollama"

# Productivity Apps
cask "google-drive"
cask "whatsapp"
cask "zoom"
cask "copyclip"
cask "teamviewer"
cask "anki"

# Utilities
cask "vlc"
cask "localsend"
cask "android-file-transfer"

# Development Dependencies
brew "git"
brew "python"
brew "node"
brew "mas" # Mac App Store CLI
EOL
fi

# Install from Brewfile
echo "📦 Installing applications from Brewfile..."
brew bundle
check_success "Brew bundle installation"

# Create Python virtual environment and install requirements
echo "🐍 Setting up Python environment..."
if [ ! -f "requirements.txt" ]; then
    cat > requirements.txt << EOL
numpy
pandas
scikit-learn
tensorflow
torch
transformers
jupyter
matplotlib
seaborn
opencv-python
pillow
requests
EOL
fi

# Initialize conda and create environment
echo "🔧 Setting up Conda environment..."
conda init zsh
conda create -n ml python=3.11 -y
conda activate ml
pip install -r requirements.txt
check_success "Python packages installation"

# Configure Git
echo "⚙️ Configuring Git..."
git config --global init.defaultBranch main

# Set up VS Code extensions
echo "🔧 Installing VS Code extensions..."
code --install-extension ms-python.python
code --install-extension GitHub.copilot
code --install-extension ms-toolsai.jupyter
code --install-extension ms-azuretools.vscode-docker

# Create directory for development
echo "📁 Creating development directory..."
mkdir -p ~/Development

# Set up shell configurations
echo "⚙️ Configuring shell..."
cat >> ~/.zshrc << EOL

# Development Paths
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="\$PATH:\$HOME/Library/Android/sdk/platform-tools"
export PATH="\$PATH:\$HOME/Library/Android/sdk/tools"

# Python Environment
export PATH="\$PATH:\$HOME/opt/anaconda3/bin"

# Aliases
alias python=python3
alias pip=pip3
EOL

# Final setup message
echo "
🎉 Setup completed! Please:
1. Restart your terminal
2. Complete manual setup steps as mentioned in README.md
3. Check logs/setup.log for any issues

Happy coding! 🚀
" 