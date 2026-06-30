#!/bin/sh

# NOTE: Certain defaults domains require full disk access, e.g., com.apple.universalaccess, com.apple.Safari.

# # Dock
#
# Position Dock on bottom of display
defaults write com.apple.dock orientation -string bottom
# Auto-hide Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 65
# Disable Dock icon magnification
defaults write com.apple.dock magnification -bool false

# # Finder
#
# New Finder window defaults to home folder
defaults write com.apple.finder NewWindowTarget -string PfHm

# # Keyboard
#
# Use function keys as function keys
defaults write -g com.apple.keyboard.fnState -bool true
# Enable full keyboard access for all controls
defaults write -g AppleKeyboardUIMode -int 3
# Set key repeat (lower is faster)
defaults write -g KeyRepeat -int 1
# Set initial key repeat delay (lower is shorter)
defaults write -g InitialKeyRepeat -int 15
# Don't automatically correct spelling
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# Don't automatically capitalize
defaults write -g NSAutomaticCapitalizationEnabled -bool false
# Don't automatically substitute dashes
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
# Don't automatically substitute periods
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
# Don't automatically substitute quotes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# # TrackPad
#
# Set tap behavior to "click"
defaults write -g com.apple.mouse.tapBehavior -int 1
# Enable built-in trackpad click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Enable external trackpad click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable scroll gesture with modifier keys to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# Disable swipe navigation
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

# # Keyboard Shortcuts
#
read -r -d '' DISABLED_KEYBOARD_SHORTCUT_XML <<-XML
<dict>
  <key>enabled_context_menu</key>
  <false/>
  <key>enabled_services_menu</key>
  <false/>
  <key>presentation_modes</key>
  <dict>
    <key>ContextMenu</key>
    <false/>
    <key>ServicesMenu</key>
    <false/>
  </dict>
</dict>
XML
#
# Disable CMD-SHIFT-L
defaults write pbs NSServicesStatus -dict-add "com.apple.Safari - Search With %WebSearchProvider@ - searchWithWebSearchProvider" "$DISABLED_KEYBOARD_SHORTCUT_XML"
# Disable CMD-SHIFT-A
defaults write pbs NSServicesStatus -dict-add "com.apple.Terminal - Search man Page Index in Terminal - searchManPages" "$DISABLED_KEYBOARD_SHORTCUT_XML"

# # Safari
#
# Always show tab bar
defaults write com.apple.Safari AlwaysShowTabBar -bool true
# Don't autofill credit cards
defaults write com.apple.Safari AutoFillCreditCardData -bool false
# Don't autofill passwords
defaults write com.apple.Safari AutoFillPasswords -bool false
# Don't auto-open downloads
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# # Screensaver
#
# Ask for password when screen is locked
defaults write com.apple.screensaver askForPassword -int 1
# Ask for password immediately
defaults write com.apple.screensaver askForPasswordDelay -float 0

# # TextEdit
#
# Disable rich text in new TextEdit documents
defaults write com.apple.TextEdit RichText -bool false
# Disable text replacement in new TextEdit documents
defaults write com.apple.TextEdit TextReplacement -bool false

# # Zoom
#
# Set Zoom "Toggle Audio" shortcut to CTRL-OPT-CMD-A
defaults write us.zoom.xos.HotKey "[HK@combo]-HotkeyOnOffAudio" -dict "hot key code" 0 "hot key modifier" 1835008
# Set Zoom "Toggle Video" shortcut to CTRL-OPT-CMD-V
defaults write us.zoom.xos.HotKey "[HK@combo]-HotkeyOnOffVideo" -dict "hot key code" 9 "hot key modifier" 1835008
