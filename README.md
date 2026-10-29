# Lab 3: The Dart App Simulator — Online Store Cart System

**Course:** Mobile Development 1  
**Project:** Midterm Final Showcase  

---

## 📌 Project Overview
This console-based Dart OOP application simulates an **Online Store Cart System** with asynchronous server operations and error handling.

## 🏗️ Core Architecture & Features
* **Abstract Interface (`Describable`):** Enforces a consistent `getDescription()` method across product types.
* **OOP & Inheritance (`Product` & `ElectronicProduct`):** Implements constructors, instance variables, methods, and super calls.
* **Mixin (`Discountable`):** Provides reusable promotional discount calculations across qualifying items.
* **Asynchronous Operations (`Future` & `async/await`):** Simulates network delays for server data fetching and checkout processing.
* **Error Handling (`try-catch`):** Guards asynchronous processes and cart operations against runtime failures.

---

## 🛠️ How to Run
1. Ensure the **Dart SDK** is installed on your machine.
2. Clone the repository and run: dart main.dart