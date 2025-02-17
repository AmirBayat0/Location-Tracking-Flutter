# 🌍 Flutter User Location App
## 🚀 Get the user's real-time location (latitude, longitude, city, and country) using Flutter and the Geolocator package!


## ✨ Features
* ✅ Fetch real-time latitude & longitude of the user.
* ✅ Convert coordinates to city, country, and full address.
* ✅ Auto-refresh location on startup & via button press.
* ✅ Cupertino-style loading indicator for a smooth UI experience.
* ✅ Works on Android, iOS, and Web.


## 🚀 Getting Started
1️⃣ Clone the repository
 ```
git clone https://github.com/your-username/flutter-user-location.git
cd flutter-user-location
 ```

2️⃣ Install dependencies
 ```
flutter pub get
 ```

3️⃣ Run the app
 ```
flutter run
 ```

## 🛠️ Setup & Permissions

📌 Android
Add the following permissions to your AndroidManifest.xml:
 ```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
 ```

📌 iOS
Update your Info.plist:
 ```
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show relevant data</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We need your location even when the app is in the background</string>
 ```

## 🏗️ Project Structure

 ```
📂 lib/
 ┣ 📜 main.dart           // Entry point of the app
 ┣ 📜 final_view.dart     // Main screen UI & logic
 ┣ 📜 location_helper.dart // Handles location fetching & processing
 ```

## 📜 Code Overview

🔹 Fetch User Location
 ```
Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
);
 ```

🔹 Convert Coordinates to City & Country
 ```
List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude, position.longitude,
);
 ```

🔹 Display Location in UI
 ```
setState(() {
  userLocation = 'City: ${place.locality}, Country: ${place.country}';
});
 ```
 
## 📌 Contribution
Want to contribute? Feel free to fork this repo and submit a PR! 🚀

## 🏆 Show Some Love
⭐ Star this repo if you like it!🐦 Follow me on Twitter for more cool projects!

## 📜 License
This project is licensed under the MIT License.
