# Flutter Reddit Clone

A responsive Reddit Clone built using Flutter and Firebase, compatible with iOS, Android, and web platforms.

## Dependencies

- `any_link_preview: ^3.0.0`: Library for extracting preview information from URLs.
- `cloud_firestore: ^4.4.5`: Official Firebase plugin for Cloud Firestore, a NoSQL document database.
- `cupertino_icons: ^1.0.2`: Flutter's official Cupertino icons package.
- `dotted_border: ^2.0.0+3`: Widget for creating dotted borders in Flutter.
- `file_picker: ^5.2.7`: Flutter plugin for picking files from the file system.
- `firebase_auth: ^4.3.0`: Official Firebase plugin for authentication.
- `firebase_core: ^2.8.0`: Official Firebase plugin for initializing Firebase services.
- `firebase_storage: ^11.0.16`: Official Firebase plugin for Cloud Storage.
- `flutter`: Flutter SDK.
- `flutter_riverpod: ^2.3.2`: Flutter state management library.
- `fpdart: ^0.5.0`: Functional programming utilities for Dart.
- `google_sign_in: ^6.0.2`: Flutter plugin for Google Sign-In.
- `routemaster: ^1.0.1`: Flutter package for declarative routing.
- `shared_preferences: ^2.1.0`: Flutter plugin for persisting key-value data.
- `uuid: ^3.0.7`: Library for generating universally unique identifiers (UUIDs).

## Features

- User registration and login using email/password or Google Sign-In.
- Creation of posts with images and URLs.
- Upvoting and downvoting of posts.
- Commenting on posts.
- Displaying post previews for URLs.
- Cloud storage for storing user-uploaded images.
- Responsive design for iOS, Android, and web platforms.

## Getting Started

1. Clone the repository:

```shell
git clone https://github.com/SanskarModi22/Reddit-Clone.git
```

2. Install the dependencies:

```shell
cd reddit_clone_flutter
flutter pub get
```

3. Setup Firebase project:

   - Create a new Firebase project using the Firebase console (https://console.firebase.google.com/).
   - Enable the Firestore and Cloud Storage services.
   - Download the `GoogleService-Info.plist` file for iOS or `google-services.json` file for Android and place them in the respective platform folders (`ios/Runner` for iOS and `android/app` for Android).
   - Configure authentication providers (Email/Password and Google Sign-In) in the Firebase console and enable them.

4. Run the app:

```shell
flutter run
```

The app will run on both mobile devices (iOS and Android) and web platforms, adapting its layout and functionality according to the screen size and platform.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please create an issue on the GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE).
```

Make sure to update the repository URL (`https://github.com/SanskarModi22/Reddit-Clone.git`) and provide any additional instructions or configuration details specific to the responsiveness of your project across different platforms.