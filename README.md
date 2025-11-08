# [TODO_APP] - Flutter Mobile App

## Description
A Flutter-based ToDo App that helps users manage their daily tasks efficiently.
It allows adding, and deleting tasks while saving all data locally using SQLite.
The app features smooth UI, dark/light modes, and smart task filtering (New, Done, Archived).
Built following clean architecture and Bloc state management for a responsive, scalable experience.

## Screen Record
https://github.com/user-attachments/assets/85531e0b-4966-42fd-9ebd-09c49ae8dc6e

A **productive and responsive ToDo Manager built with Flutter**, using **Bloc** for efficient state management and **SQLite** for persistent local storage.
It provides categorized task organization with instant updates and dynamic theme switching.

---

## 📸 Screenshots  
| New Tasks                                | Done Tasks                                 | Archived Tasks                                     | Light Mode                                |
| ---------------------------------------- | ------------------------------------------ | -------------------------------------------------- | ---------------------------------------- |
| ![dark-new-tasks_with-task](https://github.com/user-attachments/assets/078292b8-f121-4b53-b219-eb67c24f7386) | ![dark-done-tasks_with-task](https://github.com/user-attachments/assets/a9a46141-e8b3-4527-a2be-97d36102e4be)| ![dark-archived-tasks_with-task](https://github.com/user-attachments/assets/01993478-07d3-46f9-9a99-bd5c27ee02f6)|![light-new-tasks](https://github.com/user-attachments/assets/05c8bc0d-a3d4-40b0-8757-7d40c1fd5429)|

---

## ✨ Features  
- **🗂️ Add, Delete Tasks** Users can add tasks with title, date, and time, Tasks can be deleted anytime.
- **🧠 Task Categorization** ability to organize tasks into New, Done, and Archived tabs.
- **💾 Local Data Storage** Uses **SQLite (sqflite)** for saving tasks permanently on the device.
- **🌙 Dark & Light Theme Toggle** Saves theme preference using **Shared Preferences**.
- **⚙️ Bloc State Management** Handles all app states efficiently with **Cubit and flutter_bloc**.
- **📆 Date & Time Picker Integration** Adds intuitive date/time scheduling with the **intl package**.
- **🧩 Clean, Responsive UI** Adaptive design that fits both Android & iOS screens perfectly.
---

## 🛠️ Technologies & Packages  
| Tech / Package                    | Purpose                                 |
| --------------------------------- | --------------------------------------- |
| **Flutter & Dart**                | Core language and framework             |
| `sqflite`                         | Local database for task storage         |
| `path`                            | Database path management                |
| `path_provider`                   | Access to local device directories      |
| `shared_preferences`              | Store app theme preferences             |
| `bloc` / `flutter_bloc`           | State management (Cubit implementation) |
| `intl`                            | Date & time formatting                  |
| `hexcolor`                        | Custom color utilities                  |
| `conditional_builder_null_safety` | Conditional UI rendering                |
| `cupertino_icons`                 | iOS-style icons                         |


---

**🎯 What I Learned**
- **Using SQLite database to perform CRUD operations (Create, Read, Update, Delete)**.
- **Applying Bloc/Cubit to manage states effectively without rebuilding unnecessary widgets.**
- **Persisting user preferences (like dark mode) using Shared Preferences.**
- **Organizing code with Clean Architecture and Separation of Concerns.**
- **Designing an intuitive, minimal, and responsive ToDo interface.**

## 🎓 Learning Context

 **This app was built while following the https://www.udemy.com/course/complete-flutter-arabic/?couponCode=KEEPLEARNINGOCTA**  
 I completed it as part of my self-paced Flutter learning journey to master:
 - Widget composition & custom UI components
 - Implemented all logic and UI manually — typed, and refined every line.
 - Followed best practices for reusability, folder structure, and code readability.
 - Navigation between screens
 - Responsive layouts using `Expanded`, `Container`, and `Slider`

 **All code is written by me line-by-line** — no copy-paste. I typed, debugged the design (colors, icons, layout tweaks) to reinforce understanding.

**Why share this?**  
Transparency builds trust. This project proves I can **follow structured learning, execute cleanly, and deliver a working app**

## 🔗 Links
> - **APK Download**: See Releases
> - **LinkedIn Profile**: https://www.linkedin.com/in/yousif-abdelsalam/

📄 License
MIT License – feel free to fork, modify, and use in your own projects.

- Built by Yousif Abdelsalam – 2nd-year Computer Engineering student @ AIET, Egypt.
- Open to feedback, collaborations, or internship opportunities!

