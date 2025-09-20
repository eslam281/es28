# 🕌 Hisn Muslim (Flutter)

## 🎯 Purpose
This project is a **cross-platform Islamic mobile application** developed with Flutter.  
It delivers authentic supplications and prayer reminders while showcasing advanced mobile development concepts.  

The app demonstrates:
- A mix of **MVC** and **Clean Architecture** principles.
- **Background services & alarm scheduling** with WorkManager & Android Alarm Manager Plus.
- **State management** with GetX (including routing & dependency injection).
- **Offline-first architecture** using Hive local database.
- Integration with a **REST API** to fetch and update prayer data dynamically.

---

## ✨ Features
- 📅 Fetch monthly prayer times from REST API.  
- 💾 Save and cache prayer times locally with Hive.  
- ⏰ Daily alarms & notifications, even when the app is closed.  
- 🌙 Dark/Light theme support.  
- 📡 Offline mode with cached data.  
- 🔔 Full-screen alarm UI for Fajr time with Adhan audio playback.  

---

## 🗂️ Project Structure
```
lib/
├─ controller/ 
├─ core/ # Constants, functions, localization, services, shared
├─ data/ # datasource, modle
├─ view/ # component, screen
```
---

## ⚙️ Tech Stack
- **State Management**: GetX (v4.6.6)  
- **Database**: Hive (v2.2.3)  
- **Networking**: http (v1.2.2)  
- **Background Services**: WorkManager, Android Alarm Manager Plus  
- **Others**: Cached Network Image, Flutter Local Notifications, Audioplayers  
---

## 🚀 Usage
Clone the repo and run:
```bash
flutter pub get
flutter run
```

## 📌 Notes
This project is for educational purposes, but designed to be close to production-level with background services, notifications, and offline-first support.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.


