# MacBook Pro Setup Automation

This repository contains automated scripts and instructions for setting up a new MacBook Pro (M3) for Machine Learning and AI development.

*Composed with Cursor - Use with Discretion. AI hallucinations and potential errors are possible*

## Prerequisites

- macOS Sonoma or later
- Administrator access
- Internet connection
- Apple ID (for App Store installations)

## Quick Start

1. Clone this repository:
```bash
git clone git@github.com:skandydoc/mac-setup.git
cd mac-setup
```

2. Make the setup script executable:
```bash
chmod +x setup.sh
```

3. Run the setup script:
```bash
./setup.sh
```

## What Gets Installed

### Development Tools
- Xcode & Command Line Tools
- Visual Studio Code
- Docker Desktop
- Android Studio
- GitHub Desktop
- Anaconda Navigator

### AI/ML Tools
- Ollama
- Python ML/AI Libraries (via requirements.txt)

### Productivity Apps
- Google Chrome
- Google Drive
- WhatsApp
- Zoom
- CopyClip
- TeamViewer
- Anki

### Utilities
- VLC Media Player
- LocalSend
- Android File Transfer

## Manual Steps Required

Some applications require manual intervention during installation:
1. Xcode - Requires Apple ID login
2. Android Studio - Initial setup and SDK installation
3. Docker Desktop - Requires system extensions approval
4. Google Drive - Login required
5. TeamViewer - Account setup required

## Post-Installation

After installation, the script will:
1. Configure necessary environment variables
2. Set up Python development environment
3. Configure git global settings
4. Set up shell configurations

## Customization

You can modify the following files to customize your setup:
- `Brewfile`: Add/remove brew packages
- `requirements.txt`: Modify Python packages
- `config/`: Adjust configuration files

## Troubleshooting

If you encounter any issues:
1. Check the logs in `logs/setup.log`
2. Ensure you have sufficient disk space
3. Verify your internet connection
4. Make sure you have administrator privileges

## License

This project is licensed under CC BY-SA 4.0 (Creative Commons Attribution-ShareAlike 4.0 International). 