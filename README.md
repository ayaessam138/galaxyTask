# 📰 News App (Flutter + Clean Architecture)

## Overview  
This project is a Flutter application that fetches and displays news articles using the [News API](https://newsapi.org/). It follows the **Clean Architecture** approach to ensure modularity, scalability, and maintainability. The app consists of two main pages: a **Home Page** listing articles and an **Article Details Page** displaying full article details.

## Features  
- **Home Page:** Displays a list of news articles fetched from the API.  
- **Article Details Page:** Shows the full content of a selected article.  
- **Pull-to-Refresh:** Users can refresh the article list by pulling down.  
- **Offline Caching:** Articles are stored locally using Hive for offline access.  
- **State Management:** Uses **Cubit (Bloc)** for managing state efficiently.  

## Architecture  
The project follows the **Clean Architecture** pattern, ensuring separation of concerns and maintainability.

## Folder Structure  
┣ 📂 lib
┃ ┣ 📂 core # Shared resources (constants, utilities, common widgets)
┃ ┣ 📂 data # Data layer (repositories, data sources, models)
┃ ┃ ┣ 📂 datasources # API & Local storage operations
┃ ┃ ┣ 📂 models # Data models
┃ ┃ ┗ 📂 repositories # Repository implementations
┃ ┣ 📂 domain # Business logic (entities, repositories, use cases)
┃ ┃ ┣ 📂 entities # Core business models
┃ ┃ ┣ 📂 repositories # Repository interfaces
┃ ┃ ┗ 📂 usecases # Business logic (fetching articles, etc.)
┃ ┣ 📂 presentation # UI layer (pages, widgets, cubits)
┃ ┃ ┣ 📂 pages # Home & Article Details screens
┃ ┃ ┣ 📂 widgets # Reusable UI components
┃ ┃ ┗ 📂 cubit # State management (Cubit/Bloc)
┃ ┗ main.dart # App entry point
┣ 📄 pubspec.yaml # Dependencies
┣ 📄 README.md # Documentation


## Technologies Used  
- **Flutter** – Cross-platform mobile development.  
- **Dart** – Programming language.  
- **Cubit (Bloc)** – State management.  
- **Dio** – API handling.  
- **Hive** – Local storage for offline access.   

## Deployment Steps  
1️⃣ **Ensure dependencies are installed**  
```sh
flutter pub get  
