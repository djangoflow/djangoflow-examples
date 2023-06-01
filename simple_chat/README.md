# simple_chat

## HOW TO RUN

### backend-django

<!-- PUT INSTRUCTION HERE -->

### frontend-flutter

This repository contains a Makefile that simplifies common tasks for a Flutter frontend project.

#### Requirements

Before using this Makefile, ensure you have the following dependencies installed:

- Dart SDK
- Flutter SDK
- Make (build automation tool)

#### Usage

1. Clone the repository and navigate to its root directory.
2. You can run all the available commands together using the following command
   It will setup everything and will launch the app in web browser.

   ```bash
   make run
   ```

   Or you can follow the next steps to run them separately

3. Open a terminal and run the following commands:

   ```bash
   make install-melos
   ```

   This command activates the Melos package manager within the `frontend-flutter` directory.

4. Next, run the bootstrap command:

   ```bash
   make bootstrap-melos
   ```

   This command bootstraps the project using Melos.

5. Finally, run the Flutter app on Chrome:

   ```bash
   make run-flutter-frontend
   ```

   This command navigates to the `frontend-flutter/chat` directory and executes `flutter run -d chrome`.

   Make sure you have an active Chrome instance available for debugging the Flutter app.
