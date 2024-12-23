Aenzbi Wallet
Overview
Aenzbi Wallet is a mobile wallet and banking application designed to provide secure and convenient financial services such as wallet management, transactions, bill payments, and more. This project is built using Flutter for the frontend and Django for the backend, with PostgreSQL or Firebase for data storage and Firebase Authentication for user management.

Features
User Authentication (Signup/Login)
Wallet Management (Balance, Transaction History, Money Transfer)
Add Money and Withdraw Functionality
Bill Payments (Electricity, Water, etc.)
QR Code Payments and Manual Entry Options
Social Login (Google, Apple)
Biometric Login (Face ID/Fingerprint)
Project Structure
Frontend (Flutter)
The frontend is built using Flutter and follows a structured project layout for scalability. lib/ ├── screens/ │ ├── splash_screen.dart │ ├── onboarding_screen.dart │ └── auth_screen.dart ├── widgets/ ├── models/ ├── services/ └── main.dart

Code

Backend (Django)
The backend is built using Django and Django REST framework, with PostgreSQL for data storage. aenzbi_backend/ ├── aenzbi_backend/ │ ├── settings.py │ └── urls.py ├── wallet/ │ ├── models.py │ ├── serializers.py │ ├── views.py │ └── urls.py └── manage.py

Code

Getting Started
Prerequisites
Flutter SDK
Dart SDK
Python 3.x
PostgreSQL
Firebase Account (for Authentication)
Setup
Clone the repository:
git clone https://github.com/allyelvis/aenzbi_wallet.git
cd aenzbi_wallet
Install Flutter dependencies:

flutter pub get Set up the backend:

sh cd ../aenzbi_backend pip install -r requirements.txt python manage.py migrate python manage.py runserver Configure Firebase:

Follow the Firebase setup guide to add Firebase to your Flutter project. Add google-services.json for Android and GoogleService-Info.plist for iOS. Running the App Start the backend server:

sh cd aenzbi_backend python manage.py runserver Run the Flutter app:

flutter run Contributing We welcome contributions from the community. To contribute, please follow these steps:

Fork the repository. Create a new branch with a descriptive name. Make your changes and commit them with descriptive messages. Push your changes to your fork. Create a pull request to the main repository. License This project is licensed under the MIT License. See the LICENSE file for details.

Contact For any inquiries or support, please contact us at admin@aenzbi.bi.