##DailyDiary 📔

An offline-first diary application built with Flutter, utilizing Riverpod for state management and Drift for robust local SQLite database storage. The architecture is designed with future cloud synchronization (e.g., Supabase/Firestore) in mind.

## 🌟 Features
* **Offline-First:** All entries are saved locally first using a highly efficient SQLite database.
* **Sync-Ready:** Database records include synchronization states (`created`, `updated`, `deleted`, `synced`) to make future cloud migrations seamless.
* **Clean Architecture:** Built using the MVVM (Model-View-ViewModel) pattern.
* **Reactive UI:** Powered by Riverpod and Drift's reactive streams for automatic UI updates without manual refreshes.

## 🛠️ Tech Stack
* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [Riverpod](https://riverpod.dev/)
* **Local Database:** [Drift](https://drift.simonbinder.eu/) (SQLite)

## 📁 Project Structure
The app follows a layer-based MVVM structure:
```text
lib/
├── database/        # Drift database configuration and generated code
├── models/          # Pure data classes
├── repositories/    # Bridge between the database and the ViewModels
├── viewmodels/      # Riverpod Notifiers managing UI state
├── views/           # UI Screens and Widgets
└── main.dart        # App entry point

```

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (Latest stable version)
* Android Studio / VS Code with Flutter extensions
* An active emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone [https://github.com/yourusername/DailyDiary.git](https://github.com/yourusername/DailyDiary.git)

```


2. Navigate to the project directory:
```bash
cd DailyDiary

```


3. Install dependencies:
```bash
flutter pub get

```


4. Generate the database files (Drift):
```bash
dart run build_runner build --delete-conflicting-outputs

```


5. Run the app:
```bash
flutter run

```



## 🔮 Future Roadmap

* Add tags and categorization for entries.
* Implement entry editing and deletion.
* Cloud synchronization with Supabase/Firestore.
* Dark mode and custom themes.