#FarmEd 🌱

Educational platform for farmers and agricultural enthusiasts
<img src="(https://github.com/user-attachments/assets/9a2cf578-a137-45a7-8124-853b4eeddd19)" alt="Description of the image" width="400"/>

![Screenshot_20241027_165008](https://github.com/user-attachments/assets/9a2cf578-a137-45a7-8124-853b4eeddd19)



![Screen_recording_20241027_161359.webm](https://github.com/user-attachments/assets/e061524f-754e-4d60-bd96-0e706af2f72d)


Table of Contents:

Introduction
Features
Prerequisites
Installation
Setup
Running the Application
Folder Structure


#Introduction

FarmEd is a mobile application developed to support farmers in Rwanda by providing a comprehensive platform for agricultural education and innovation. The app will serve as a resource hub, offering a wide range of features including instructional videos, informative blog posts, interactive photos, and regularly updated newsletters. Through these resources, farmers will gain access to critical knowledge on modern farming techniques, sustainable practices, and real-time agricultural trends.

#Features
- User Authentication
  
- Blog Page
  
- Search Functionality

- Newsletter

- Instructional Videos

- User Profile & notification



#Prerequisites

Ensure you have the following tools installed:

Flutter SDK: Install Flutter
Dart SDK (comes with Flutter)
Android Studio (for Android emulation)
Xcode (for iOS emulation, optional if targeting iOS)
Git: Install Git
Visual Studio Code (or any preferred code editor)
Installation
Clone the Repository:

bash

    git clone https://github.com/Bernice-Awinpang-Akudbilla/FarmEd.git  
     cd FarmEd
Install Dependencies:
Inside the project directory, run:

     flutter pub get

#Running the Application<br>

- Start an Emulator or Connect a Device:<br>
Use Android Studio to launch an emulator or connect a physical device.<br>

- Run the App:<br>

      flutter run
  
- Hot Reload (during development):
Make changes and save to see updates instantly.

Folder Structure
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

