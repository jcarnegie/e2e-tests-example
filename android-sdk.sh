#!/bin/sh

# Update Homebrew and install dependencies
brew update
brew tap homebrew/cask-versions

# Install Java Development Kit (JDK)
brew install --cask temurin19

# Install Android Command Line Tools
brew install --cask android-commandlinetools

# Set up environment variables
# echo 'export ANDROID_HOME="$HOME/Library/Android/sdk"' >> ~/.zshrc
# echo 'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' >> ~/.zshrc
# echo 'export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"' >> ~/.zshrc
# echo 'export PATH="$ANDROID_HOME/emulator:$PATH"' >> ~/.zshrc
# echo 'export PATH="$ANDROID_HOME/platform-tools:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Create necessary directories
mkdir -p "$ANDROID_HOME/cmdline-tools/latest"

# Move command line tools to the correct directory
mv /usr/local/Caskroom/android-commandlinetools/latest/cmdline-tools/* "$ANDROID_HOME/cmdline-tools/latest/"

# Accept licenses
yes | sdkmanager --licenses

# Install SDK components
sdkmanager "platform-tools" "emulator" "platforms;android-35" "system-images;android-35;google_apis;arm64-v8a"

# Create a new Android Virtual Device (AVD)
avdmanager create avd -n "Pixel_7" -d "pixel_7" -k "system-images;android-35;google_apis;arm64-v8a"

# List available AVDs to confirm creation
# emulator -list-avds

# # Start the emulator
# emulator -avd Pixel_7 &

# sleep 20

# # Kill the emulator
# adb -s emulator-5554 emu kill
