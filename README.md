# Nubble App

This is a project developed inspired in the React Native version from the course _"React Native Professional"_ from [Coffstack](https://coffstack.com.br).

🚧 This project is still in development, so only a few features of it are currently implemented. The README will also be updated as new technologies and featuresare being introduced into this project. 🚧

## Table of Content:

- [About The App](#about-the-app)
- [Demo](#demo)
- [Technologies](#technologies)
- [Folder Structure](#folder-structure)
- [Getting Started](#getting-started)

## About The App

Nubble App is a social network application where users can share photos with one another, follow other people, like and comment their photos.

## Demo

https://github.com/willperes/NubbleSwiftUI/assets/64440935/bb807861-da5b-4e7b-9eb3-ea8736440f7f

## Technologies

This project was developed using SwiftUI using the DDD (Domain-driven Design) approach, and also applying Clean Code and SOLID concepts.

## Folder Structure

```
├── Api                     # Contains the network logic for the app
├── Domain                  # Domain-specific files
├── Models                  # Shared models to be used throughout the app
├── Screens                 # Views that represent the app's screens
│   ├── App                 # Screens to be used only when the user is authenticated
│   └── Auth                # Screens to be used only when the user is not authenticated
├── Utils                   # Utility classes and functions to be used throughout the app
└── Views                   # Views that can be reused throughout the app
```

## Getting Started

To run this app on your local machine, follow these steps:

1. Clone this repository to your local machine using Git:

```bash
git clone https://github.com/willperes/NubbleSwiftUI.git
```

2. Open the project in Xcode.
3. Build and run the app on the simulator or a physical device.

If everything is set up _correctly_, you should see the app running in your _iOS Simulator_.
