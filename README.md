# cash_swift

This repository contains the source code for a mobile application designed to facilitate peer-to-peer money transfers which is called Cash Swift. The app allows users to load money into their accounts, transfer funds to other users via QR code scanning or custom UPI IDs, view transaction history, and check their account balance. Additionally, users can categorize their transactions into different categories such as groceries, bills, entertainment, etc.

![Cash Swift](https://github.com/AbheenavSingh/cash_swift/assets/113464197/e5398a6f-a081-4ab1-a333-d041e0678017) 

Technologies Used
Flutter: Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. It is used for developing the user interface and logic of the mobile application.

Native (Android or iOS): The app can be compiled and run natively on both Android and iOS platforms, providing a seamless user experience on both operating systems.

Firebase Firestore: Firebase Firestore is a flexible, scalable database for mobile, web, and server development from Firebase and Google Cloud Platform. It is used to store user account information, transaction history, and other relevant data securely in the cloud.

Features
User Authentication: Users can create an account, log in, and securely manage their account details.
Balance Management: Users can load money into their accounts, which is simulated by updating the balance in the Firebase Firestore database.
Peer-to-Peer Transfers: Users can transfer funds to other users using either QR code scanning or custom UPI IDs (e.g., name_or_phone@cashswift).
Transaction History: Users can view their transaction history, including details such as transaction amount, recipient, date, and category (if categorized).
Account Balance: Users can check their account balance at any time.
Transaction Categorization (Bonus): Users can categorize their transactions into different categories such as groceries, bills, entertainment, etc., to better track their spending habits.
Setup Instructions
Clone the repository to your local machine.

```bash
git clone gh repo clone AbheenavSingh/cash_swift
Install Flutter and set up your development environment. Refer to the official Flutter documentation for instructions.
```

Create a new Firebase project and set up Firebase Firestore as the database. Follow the steps outlined in the Firebase documentation to integrate Firebase with your Flutter app.

Update the Firebase configuration in your Flutter app by replacing the google-services.json file for Android or GoogleService-Info.plist file for iOS with the ones provided by Firebase.

Run the app on your preferred emulator or physical device using Flutter's CLI commands:

```bash
```
flutter run
Contributing
Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.
