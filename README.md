# Pairs - E-Commerce App for Shoes

## Introduction
Pairs is a Flutter-based e-commerce application designed for buying and selling shoes. The app incorporates Firebase for secure user authentication and Firestore as the database for user and cart data.

## Project Overview
Pairs enable users to explore a variety of shoes, make purchases, and manage their shopping carts.

## Key Features
- User Sign In through Email.
- Dynamic and Minimalistic UI to Browse Shoes.
- User-Specific Management of Shopping Cart.

## Installation Guide
### Prerequisites:
- Flutter installed
- Firebase project set up

### Steps:
1. Clone the repository: `git clone https://github.com/itsvinayyay/Pairs`
2. Navigate to the project: `cd [project_directory]`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Authentication
Users can Sign In using the emails registered at the time of Signing Up/Creating their account. At the time of signing up, users need to provide their Email, passwords, Name, and Mobile Number.

## Firestore Database
### UserData:
A new user entry is created in Firestore whenever a user signs up. Fields include user information like name and contact details.
### CartData:
A separate sub-collection is created for each user to manage their shopping cart. Whenever a user adds a product to the cart, a new document is added to this sub-collection.

### Products:
For demo purposes, the demo products have been saved in this collection in the Cloud Firestore.

## Usage Guide
1. Launch the app and sign up using an email ID.
2. Explore the shoe catalog, and the minimalist UI, and add products to your cart.
3. Log Out, and sign In again to see your cart data again as it is.

## Technologies Used
- Flutter
- Firebase (Authentication, Firestore)

## Useful Links
- [LinkedIn post](https://www.linkedin.com/feed/update/urn:li:activity:7068985774997708800?utm_source=share&utm_medium=member_desktop)
- [GitHub](https://github.com/itsvinayyay/Pairs)
- [APK Link](https://drive.google.com/file/d/1Gs9K3sOWr9VEV3kBTPFu6KYNXxcuIKvV/view?usp=sharing)
- [Video Link](https://drive.google.com/file/d/1pBFMI26jwXPtvfhKVO1gwsotXObJrlF_/view?usp=sharing)

## Conclusion
In conclusion, the development of Pairs marks a successful fusion of Flutter, Firebase, and Firestore, delivering a seamless and secure e-commerce experience. With features like email sign-in, OTP authentication, a sleek UI, and personalized cart management, "Pairs" prioritizes user satisfaction.

