# Expo E2E Testing with Maestron

## Notes

This uses EAS to build the app locally. You'll have to create an account at expo.dev to run the build.

1. Go to [https://expo.dev/signup](https://expo.dev/signup)
2. Sign up
3. From the command line, run:

```bash
npm install -g eas-cli
# login with the credentials you used to sign up
eas login
```

## Setup

```bash
# install dependencies
yarn install

# setup android sdk (assumes homebrew is installed running on a mac with zsh as your shell)
./android-sdk.sh

# install maestro
curl -fsSL "https://get.maestro.mobile.dev" | bash
```

## Build Android APK

```bash
yarn build:android
```

This places the APK in the `tmp` directory.

## Run E2E Tests

```bash
yarn maestro:android
```

See package.json scripts section and the maestro directory for more details.
