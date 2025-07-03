CURRENT_DIR=$( dirname -- "$( readlink -f -- "$0"; )" );

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Download CSM Breeze (git shortcut and utils)
git clone git@github.com:scmbreeze/scm_breeze.git ~/.scm_breeze && ~/.scm_breeze/install.sh

# Install command line tools
brew install \
    the_silver_searcher \
    ripgrep \
    eza fd bat \
    jq fzf \
    starship \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    zsh-completions \
    pygitup \
    libyaml \
    docker colima

brew install --cask \
    google-chrome \
    visual-studio-code \
    slack \
    ghostty \
    meetingbar \
    monitorcontrol \
    keycastr \
    shottr \
    xnapper \
    hiddenbar \
    dash@6 \
    rectangle

cp $CURRENT_DIR/zshrc.sh ~/.zshrc
cp $CURRENT_DIR/gitconfig ~/.gitconfig
cp $CURRENT_DIR/gemrc ~/.gemrc
cp $CURRENT_DIR/ssh_config ~/.ssh/config

curl https://mise.run | sh
eval "$($HOME/.local/bin/mise activate zsh)"
mise use -g python ruby node



# Change MacOs defautls
# Use `defaults read` to display main defaults settings.
# See `man defaults` for the command

# Change how fast the keyboard repeat keys
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write com.apple.Accessibility KeyRepeatDelay "0.5"
defaults write com.apple.Accessibility KeyRepeatInterval "0.083333333"

# Trackpad "tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Remove margins on Windows
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

# Disable Desktop/Space rearrangement
defaults write com.apple.dock "mru-spaces" -bool false && killall Dock

# Activate settings without logout
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u


VSCODE_SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"
if [ ! -f "$VSCODE_SETTINGS_FILE" ]; then
    # If the file does not exist, create it with empty JSON content
    echo "{}" > "$VSCODE_SETTINGS_FILE"
fi
jq '.["editor.renderWhitespace"] = "trailing"' "$VSCODE_SETTINGS_FILE" > "$VSCODE_SETTINGS_FILE.tmp" && mv "$VSCODE_SETTINGS_FILE.tmp" "$VSCODE_SETTINGS_FILE"
jq '.["files.trimTrailingWhitespace"] = true' "$VSCODE_SETTINGS_FILE" > "$VSCODE_SETTINGS_FILE.tmp" && mv "$VSCODE_SETTINGS_FILE.tmp" "$VSCODE_SETTINGS_FILE"
jq '.["git.blame.editorDecoration.enabled"] = true' "$VSCODE_SETTINGS_FILE" > "$VSCODE_SETTINGS_FILE.tmp" && mv "$VSCODE_SETTINGS_FILE.tmp" "$VSCODE_SETTINGS_FILE"
jq '.["workbench.tree.indent"] = 18' "$VSCODE_SETTINGS_FILE" > "$VSCODE_SETTINGS_FILE.tmp" && mv "$VSCODE_SETTINGS_FILE.tmp" "$VSCODE_SETTINGS_FILE"

echo "##########################"
echo "## To download manually ##"
echo "##########################"
echo "https://apps.apple.com/jp/app/presentify-screen-annotation/id1507246666?l=en-US&mt=12"
echo "https://apps.apple.com/jp/app/skitch-snap-mark-up-share/id425955336?l=en-US&mt=12"
echo "https://apps.apple.com/jp/app/picture-in-picture/id6475380719?l=en-US&mt=12"


echo ""
echo ""
echo "##########################"
echo "##  To change manually  ##"
echo "##########################"
echo "Enable web inspector in Safari"
