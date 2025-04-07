# 🛍️ E-Commerce Application

A scalable and maintainable Flutter-based e-commerce application designed with a **base-layer architecture** and integrated with real-time API data. Built following clean code principles and Softagy standards, this project provides a robust foundation for commercial shopping apps with a focus on modularity and performance.

---

## 📌 Overview

This application allows users to browse products, view details, add items to a cart, and place orders. The structure of the project is based on **base-layer architecture** (not feature-based), which organizes code into Data, Domain, and Presentation layers—resulting in better separation of concerns, easier testing, and high scalability.

---


## 📽 Demo

### 🎥 Video Preview

[(https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)](https://drive.google.com/file/d/1GuOkKFdePj6ieAySCRejEV0ojBOZHQYs/view?usp=sharing)


## 🧱 Project Architecture

---

## 🚀 Features

- User authentication (login/register)
- Product listing and filtering
- Product detail page
- Add to cart / remove from cart
- Checkout process
- Real-time API integration
- State management using Cubit (Bloc)
- Clean and responsive UI

---

## 🧰 Technologies Used

- **Flutter**
- **Dart**
- **Bloc/Cubit** for state management
- **Dio** for networking
- **Equatable** for value comparisons
- **Softagy-style base layer architecture**

---

## 📡 API Integration

The application fetches data from a RESTful API. The `data/datasources` layer handles API communication using Dio. API errors are gracefully managed using the Either type from Dartz in the domain layer.

---

## 🧪 Testing

The architecture supports unit testing and mockable data sources. Example tests include:

- Use case logic
- API responses and repositories
- State management testing with Cubit

---

## 📦 Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Dart SDK
- VS Code or Android Studio

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-app.git


