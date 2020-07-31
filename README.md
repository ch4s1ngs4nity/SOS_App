
# SOS_App
This project aims to provide a feedback system for SOS.

Getting Started:
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

Useful Resources:
- [Flutter API](https://api.flutter.dev/index.html)
- [Cloud Firestore - video series](https://www.youtube.com/watch?v=v_hR4K4auoQ)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Multidex Error](https://developer.android.com/studio/build/multidex)

Dependency Reference:
- [Get](https://pub.dev/packages/get)
- [Firebase Auth](https://pub.dev/packages/firebase_auth)
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)

## Install Git
Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

**MacOS**: https://git-scm.com/download/mac
1. Git is bundled with Xcode so we will install that now
2. Open the App Store
3. Search for `Xcode`
4. Click Install

**Windows**: https://git-scm.com/download/win
1. You may want to change the default text editor (Vim is hard)
2. All other default installer settings are fine

## Install Dart
Dart: https://dart.dev/tools/sdk/archive

**MacOS**: Download the x64 zip
1. Open Finder
2. Click Go > Home
3. Create a folder called `Development`
4. Move the dart zip into the `Development` folder
5. Double click on the dart zip file

**Windows**: Download the x64 installer
1. Dart is just an archive you need to extract
2. Create the directory `C:\src` and extract dart inside of this folder

## Install Flutter
Flutter: https://flutter.dev/docs/get-started/install

**MacOS**: https://flutter.dev/docs/get-started/install/macos
1. Download flutter, big blue button
2. Open Finder
3. Click Go > Home
4. Move the flutter zip into the `Development` folder from your `Downloads` folder
5. Double click on the flutter zip file

**Windows**: https://flutter.dev/docs/get-started/install/windows
1. Download flutter, big blue button
2. Flutter is just an archive you need to extract
3. Extract Flutter into `C:\src`

## Update your Path Variable
**MacOS**: The OS manages path variables through a terminal configuration file. From Catalina on Mac uses ZSH as its terminal. Prior to Catalina it uses BASH.

Determine your shell type:
1. Click Launchpad
2. Type `terminal`
3. Click on Terminal
4. Type `echo $SHELL`
5. Press Enter
6. `/bin/zsh` – Means you are using ZSH
7. `/bin/bash` – Means you are using BASH

If you know your shell type:
1. Based on your shell:
   * ZSH: Type `nano $HOME/.zshrc`
   * BASH: Type `nano $HOME/.bashrc`
2. Press Enter
3. Add the lines to the file
    `export PATH=”$PATH:$HOME/Development/flutter/bin”`
    `export PATH=”$PATH:$HOME/Development/dark-sdk/bin”`
4. Press control + O to save the file
5. Press control + X to exit
6. Close your terminal for changes to take effect

**Windows**:
14. Click Start
15. Type `env`
16. Click Edit the system environment variables
17. Click Environment Variables…
18. In the upper window click Path
19. Click Edit…
20. Click New
21. Add the following two paths to the end of the list
`C:\src\dart-sdk\bin`
`C:\src\flutter\bin`
22. Click OK
23. Click OK
24. Click OK
25. Close command prompt for changes to take effect

## Verify Path Variable
**MacOS**:
1. Click Launchpad
2. Type `terminal`
3. Click on Terminal
4. Type `which flutter dart`
5. Press Enter
6. If your path is correct you should see the following:
`/Users/USERNAME/Development/flutter/bin/flutter`
`/Users/USERNAME/Development/dark-sdk/bin/dart`

**Windows**:
1. Click start
2. Type `command`
3. Click Command Prompt
4. Type where dart flutter
5. Press Enter
6. If your path is correct you should see the following:
`C:\src\dart-sdk\bin\dart.exe`
`C:\src\flutter\bin\flutter`
`C:\src\flutter\bin\flutter.bat`

## Install Android Studio
Android Studio: https://developer.android.com/studio#downloads

**MacOS**: Download the 64-bit dmg
1. Double click the dmg file
2. Drag the Android Studio icon to the Applications icon
3. Click Launchpad
4. Open Android Studio
5. You may have to accept a dialog about the app being untrusted
6. It is going to download the android SDK (default options are fine)
7. When the studio opens to the main menu, click Configure > Plugins
8. Click Marketplace (It may take a bit for the plugin list to build)
9. Type `flutter`
10. Click Install
11. Click Install
12. Click Restart IDE
13. Click Restart

**Windows**: Download the 64-bit exe
1. All the default installer settings are fine
2. Open the Android Studio
3. It is going to download the android SDK (default options are fine)
4. When the studio opens to the main menu, click Configure > Plugins
5. Click Marketplace (It may take a bit for the plugin list to build)
6. Type `flutter`
7. Click Install
8. Click Install
9. Click Restart IDE
10. Click Restart

## Install Coca Pods (MacOS Only)
1. Click Launchpad
2. Type `terminal`
3. Click on Terminal
4. Type `sudo gem install cocoapods`
5. Press Enter
6. Enter your password and press Enter
7. Type `pod setup`
8. Press Enter

## Verify Flutter Environment
**MacOS**:
1. Click Launchpad
2. Type `terminal`
3. Click on Terminal
4. Type `sudo xcode-select –switch /Applications/Xcode.app/Contents/Developer`
   * If you are using a beta version of Xcode replace `Xcode.app` with `Xcode-beta.app`
5. Press Enter
6. Enter your password and press Enter
7. Type `sudo xcode -runFirstLaunch`
8. Press Enter
9. Enter your password and press Enter
10. Type `flutter doctor`
11. Press Enter
12. Your only error should be about connected devices

**Windows**:
13. Click start
14. Type `command`
15. Click Command Prompt
16. Type `flutter doctor –android-licenses`
17. Press Enter
18. You will have to type the letter `y` after each prompt and press Enter
19. Type `flutter doctor`
20. Press Enter
21. Your only error should be about connected devices

## Clone the Repository
**MacOS**:
1. Create a folder on your `Desktop` called `SOS_DEV`
2. Click Launchpad
3. Type `terminal`
4. Click on Terminal
5. Type `cd $HOME/Desktop/SOS_DEV`
6. Press Enter
7. Type `git clone https://github.com/SOScodeteam/sos_app`
8. In your folder `SOS_DEV` on the `Desktop` you should now have a folder called `sos_app`

**Windows**:
1. Create a folder on your `Desktop` called `SOS_DEV`
2. Click start
3. Type `command`
4. Click Command Prompt
5. Type `cd %homepath%\Desktop\SOS_DEV`
6. Press Enter
7. Type `git clone https://github.com/SOScodeteam/sos_app`
8. In your folder `SOS_DEV` on the `Desktop` you should now have a folder called `sos_app`


## Setup the Project in Android Studio
**MacOS**:
1. Open Android Studio
2. Click Open an existing Android Studio project
3. Browse to `Desktop\SOS_DEV`
4. Highlight `sos_app`
5. Click Open
6. Click Android Studio > Preferences > Language & Frameworks > Flutter
7. Set the Flutter SDK path: `/Users/USERNAME/Development/flutter`
   * Make sure USERNAME is the account name on your mac
8. Click OK
9. Click Android Studio > Preferences > Language & Frameworks > Dart
10. Set the Dart SDK path: `/Users/USERNAME/Development/dart-sdk`
   * Make sure USERNAME is the account name on your mac
11. Click OK
12. Click Tools > Flutter > Flutter Pub Get
13. Click Tools > Flutter > Flutter Upgrade

**Windows**:
1. Open Android Studio
2. Click Open an existing Android Studio project
3. Browse to `C:\Users\USERNAME\Desktop\SOS_DEV`
   * Make sure USERNAME is the account name on your pc
4. Click on `sos_app`
5. Click OK
6. Click File > Settings > Language & Frameworks > Flutter
7. Set the Flutter SDK path: `C:\src\flutter`
8. Click OK
9. Click File > Settings > Language & Frameworks > Dart
10. Set the Dart SDK path: `C:\src\flutter\bin\cache\dart-sdk`
11. Click OK
12. Click Tools > Flutter > Flutter Pub Get
13. Click Tools > Flutter > Flutter Upgrade

## Setup an Emulator
It is possible to run the android emulator on MacOS. The setup is just like the windows setup below. iOS emulators on Windows are not possible.

**MacOS (iOS)**:
1. Click Launchpad
2. Type `terminal`
3. Click on Terminal
4. Type `open -a simulator`
5. Press Enter
6. Type `cd $HOME/Desktop/SOS_DEV/sos_app`
7. Press Enter
8. Type `open ios/Runner.xcworkspace`
9. Press Enter
10. In the left pane click on Runner. It has a blue icon near it
11. In the middle pane click on Signing & Capabilities
12. Next to Team click and select Add an Account
13. You now need to sign in with your apple developer account
14. Back in the terminal type `flutter run`

**Windows (android)**:
1. With the project open inside Android Studio
2. Click in the top right of the tool bar on the AVD Manager icon
    * It's a phone with a small green alien head in the lower right corner of the phone
3. Click + Create Virtual Device…
4. Click on a device (eg. Pixel 3)
5. Click Next
6. Click Download next to the highest API Level (eg. 30)
7. Click Finish
8. Click Next
9. Click Finish
10. Click the Play button under the Actions column
11. Close the AVD Manager
12. Click on `<no devices>` and select Open Android Emulator Pixel 3 API 30
13. An emulator should open, you will see Android booting up
14. Click the green Play button, if you have no coding errors the app will display on the emulator

## Project Structure
**Folders**
- **lib**: Where all the coding for the app is done.
- **android**: contains the build instructions for the android version of the app.
- **ios**: contains the build instructions for the iOS version of the app.
- **assets**: Contains images/fonts to be used in the project

**Files**
- **pubspec.yaml**: Controls dependencies. If you want to use an external library, you will add it here. After you add it you will need to do a Flutter Pub Get. You can also add images and fonts to the project via this file.
- **readme.md**: This file! It's the how to for this app.
   - Helpful readme Editor: https://stackedit.io/app#
   - Paste the readme into the left and a preview is shown on the right
