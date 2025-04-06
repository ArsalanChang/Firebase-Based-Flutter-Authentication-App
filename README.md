
# 🔐 Firebase-Based Flutter Authentication App

## 📌 Overview

This Flutter-based mobile application provides a robust and secure **user authentication system** using **Firebase Authentication**. The app includes essential features such as **user registration**, **login**, **password reset**, **update password**, and **account deletion**, making it a complete starter kit for apps requiring authentication and user management. It uses **Firebase** as a backend to ensure real-time data handling and secure cloud storage.

---

## 🎯 Key Features

✅ **User Registration & Login** – New users can register, and existing users can securely log in using email and password.  
✅ **Password Reset & Update** – Users can reset forgotten passwords and update them from within the app.  
✅ **Account Deletion** – Users have the option to permanently delete their account from Firebase.  
✅ **Email Validation & Error Handling** – Friendly prompts and feedback for user actions.  
✅ **Firebase Integration** – Realtime syncing with Firebase Auth and Cloud Firestore or Firebase Realtime Database.  
✅ **Cross-Platform UI** – Built using Flutter for Android and iOS with responsive design and smooth navigation.

---

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)  
- **Authentication**: Firebase Authentication  
- **Backend**: Firebase (Firestore / Realtime Database, Firebase Storage)  
- **State Management**: Provider / Riverpod (optional – based on your implementation)  
- **Other Tools**: Firebase CLI, FlutterFire CLI

---

## 🚀 Installation & Setup

### 🔧 Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)  
- Dart SDK (comes with Flutter)  
- Android Studio or VS Code  
- Firebase CLI  
- A Firebase Project (set up via [Firebase Console](https://console.firebase.google.com/))

### 📥 Clone the Repository

```bash
git clone https://github.com/ArslanChang/Firebase-Based-Flutter-Authentication-App.git
cd Firebase-Based-Flutter-Authentication-App
```

### 📦 Install Dependencies

```bash
flutter pub get
```

### 🔗 Connect Firebase

1. Create a Firebase project on the Firebase Console.  
2. Add Android/iOS app to the Firebase project.  
3. Download `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) and place it in the respective directories.  
4. Run Firebase CLI to configure your project:

```bash
firebase login
flutterfire configure
```

### ▶️ Run the App

```bash
flutter run
```

---

## 👣 App Flow

1. **Register** – Create an account with email and password.  
2. **Login** – Log in using registered credentials.  
3. **Forgot Password** – Receive password reset link via email.  
4. **Update Password** – Change password from the app.  
5. **Delete Account** – Permanently delete user account from Firebase.

---
📱 Screenshots
<div align="center"> <table> <tr> <td align="center"> <b>🔐 Sign In</b><br> <img src="https://github.com/ArsalanChang/Firebase-Based-Flutter-Authentication-App/blob/2a8f6fb97074ede61a34fd2afac53de962ab7ec0/signIn.png" width="200"/> </td> <td align="center"> <b>📝 Sign Up</b><br> <img src="https://github.com/ArsalanChang/Firebase-Based-Flutter-Authentication-App/blob/2a8f6fb97074ede61a34fd2afac53de962ab7ec0/signUp.png" width="200"/> </td> </tr> </table> </div>
---

## 🌱 Future Enhancements

- Social Login (Google, Apple, Facebook)  
- Email Verification Flow  
- Phone Number Authentication  
- Persistent Login (with auto-redirect)  
- User Profile Picture Upload (Firebase Storage)

---

## 🤝 Contribution Guidelines

We welcome contributions to improve this project!  
To contribute:

1. Fork the repository.  
2. Create a new branch: `git checkout -b feature-name`  
3. Make your changes.  
4. Commit: `git commit -m "Add feature"`  
5. Push: `git push origin feature-name`  
6. Open a Pull Request for review.

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 📩 Contact

For any queries, support, or collaboration opportunities:  
**Arsalan Chang**  
📧 Email: arslanchang21@gmail.com
🌐 GitHub: [github.com/ArslanChang](https://github.com/ArsalanChang)

