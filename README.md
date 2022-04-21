## Getting Started

Flutter enviroment setup can be found here [Flutter](https://flutter.dev/docs/get-started/install)

## Step to build Android apps
Initialization project and installing packages (only first time) :
1. Open project in VScode
2. Run 'flutter pub get' in terminal

Debug run :
1. Open project in VScode
2. make sure you have only 1 android emulator running
3. check if your device exist by running 'flutter devices'
4. For debug run 'flutter run' or Choose menu from Toolbar : Run => Run without debugging

Build .APK File :
1. Open project in VScode
2. Run 'flutter build apk --release'

Build .AAB File (For playstore release) :
1. Open project in VScode
2. Run 'flutter build aab --release'

## Step to build iOS apps
Initialization project and installing packages (only first time) :
1. Open project in VScode
2. Run 'flutter pub get' in terminal
3. Edit Podfile in ios folder, un-comment line "platform :ios, 'xx.x'"
4. In ios folder run 'pod install'

Debug run :
1. Open project in VScode
3. make sure you have only 1 iOS simulator running
4. check if your device exist by running 'flutter devices'
5. For debug run 'flutter run' or Choose menu from Toolbar : Run => Run without debugging
