<h1>FarmEd 🌱</h1>
Educational platform for farmers and agricultural enthusiasts<br>

<img src="https://github.com/user-attachments/assets/9a2cf578-a137-45a7-8124-853b4eeddd19" alt="Description of the image" width="400" style="float:left; margin-right: 10px;"/>

<h2>Table of Contents:</h2>

- Introduction
- Features
- Prerequisites
- Installation
- Setup
- Running the Application
- Folder Structure


<h2>Introduction</h2>

FarmEd is a mobile application developed to support farmers in Rwanda by providing a comprehensive platform for agricultural education and innovation. The app will serve as a resource hub, offering a wide range of features including instructional videos, informative blog posts, interactive photos, and regularly updated newsletters. Through these resources, farmers will gain access to critical knowledge on modern farming techniques, sustainable practices, and real-time agricultural trends.

<h2>Features</h2>

- User Authentication

- Blog Page
 

- Search Functionality

- Newsletter

- Instructional Videos

- User Profile & notification

<h2>Prerequisites</h2>

Ensure you have the following tools installed:

- Flutter SDK: Install Flutter
- Dart SDK (comes with Flutter)
- Android Studio (for Android emulation)
- Xcode (for iOS emulation, optional if targeting iOS)
- Git: Install Git
- Visual Studio Code (or any preferred code editor)

<h2>Installation</h2>
Clone the Repository:

    git clone https://github.com/Bernice-Awinpang-Akudbilla/FarmEd.git  
    cd FarmEd
    
Install Dependencies:
Inside the project directory, run:
   
    flutter pub get

Update pubspec.yaml:
Ensure all required packages are listed. Example:

    dependencies:
      flutter:
        sdk: flutter
      cupertino_icons: ^1.0.2
      provider: ^6.0.0  # For state management

<h2>Running the Application</h2><br>

- Start an Emulator or Connect a Device:<br>
Use Android Studio to launch an emulator or connect a physical device.<br>

- Run the App:<br>

      flutter run
  
- Hot Reload (during development):
Make changes and save to see updates instantly.

<h2>Folder Structure</h2>
Here’s an overview of the core folder structure:

      /FarmEd
      │
      ├── /lib
      │   ├── /pages          # Contains different pages of the app
      │   ├── /components     # Reusable components
      │   ├── homescreen.dart  # Main home screen of the app
      │   └── main.dart       # Application entry point
      │
      ├── /android            # Android platform files
      ├── /ios                # iOS platform files
      ├── /image              # Contains image assets
      └── pubspec.yaml        




