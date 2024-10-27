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
  <img src="https://github.com/user-attachments/assets/ea81f124-0e0a-4bc8-bff8-cefb0d18281d" alt="Description of the image" width="400" style="float:left; margin-right: 10px;"/>
![signup]()

- Blog Page
  ![blogs](https://github.com/user-attachments/assets/795d90ee-5b08-43b0-a8fa-9a9d8b847e1c)

- Search Functionality
![search](https://github.com/user-attachments/assets/d77b8408-ae94-453e-a264-85633334e9b2)

- Newsletter
![newsletters](https://github.com/user-attachments/assets/4299b759-2c91-47a4-a725-99fa3d306f33)

- Instructional Videos
![videos](https://github.com/user-attachments/assets/5df06c32-48d0-4f41-81a7-c57cb8a5c78c)

- User Profile & notification
![profile](https://github.com/user-attachments/assets/77d0d47c-05eb-4d52-bf92-6553599ffb71)



<h2>Prerequisites</h2>

Ensure you have the following tools installed:

Flutter SDK: Install Flutter
Dart SDK (comes with Flutter)
Android Studio (for Android emulation)
Xcode (for iOS emulation, optional if targeting iOS)
Git: Install Git
Visual Studio Code (or any preferred code editor)
Installation
Clone the Repository:



    git clone https://github.com/Bernice-Awinpang-Akudbilla/FarmEd.git  
     cd FarmEd
Install Dependencies:
Inside the project directory, run:

     flutter pub get

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


License
This project is licensed under the MIT License - see the LICENSE file for details.

