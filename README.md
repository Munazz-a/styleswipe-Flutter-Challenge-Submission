# StyleSwipe – Flutter Build Challenge Submission

---

## 📌 Overview

StyleSwipe is a Flutter application built as part of the Round 2 Flutter Developer Build Challenge.

The app fetches product data from FakeStoreAPI and allows users to:

- Browse products
- Like or dislike items
- Persist preferences locally
- Open products in an in-app browser
- Track and view browsing history

The focus of this project was on clean architecture, proper state management, API integration, local persistence, and structured code organization.

---

## 🚀 Features Implemented

### 1️⃣ Product Feed

- Fetches product data from FakeStoreAPI
- Displays product image, title, and price
- Handles loading and error states properly

### 2️⃣ Style Preference Interaction

- Users can like or dislike products
- UI updates instantly using state management
- Preferences are stored locally
- Preferences persist after app restart

### 3️⃣ In-App Product Browser

- Products open inside an internal WebView
- Visited URLs are tracked
- Browsing history is stored locally
- History screen displays all previously visited URLs

---

## 🏗️ Approach

The project is structured with clear separation of concerns:

- **Models** → Represent API data structure  
- **Services** → Handle API calls  
- **Providers** → Manage state and business logic  
- **Screens** → UI pages  
- **Widgets** → Reusable UI components  

This separation ensures clean code, maintainability, and scalability.

---

## 🔄 State Management Choice

I used **Provider** for state management.

### Why Provider?

- Lightweight and simple
- Scalable for small-to-medium apps
- Clean separation between UI and business logic
- Easy to explain and maintain

The `ProductProvider` manages:

- Product data
- Loading and error states
- User preferences
- Browsing history

---

## 💾 Data Persistence Method

I used **Hive** for local storage.

### Why Hive?

- Lightweight
- Fast
- No complex setup required
- Suitable for storing simple key-value data

Hive stores:

- User preferences (liked/disliked products)
- Browsing history (visited URLs)

All data persists across app restarts.

---

## ⏳ Handling Loading and Errors

- A `CircularProgressIndicator` is displayed while fetching API data.
- Errors are caught and displayed in the UI.
- The app handles failures gracefully without crashing.

---

## 🔮 What I Would Improve With More Time

- Add search and filtering functionality
- Add animations for smoother UX
- Improve UI polish and responsiveness
- Implement caching strategy for API responses
- Add unit tests and widget tests
- Improve the history screen with timestamps

---

## ⏱️ Approximate Time Spent

Approximately **25 hours** (replace with actual time).

### Time Breakdown

- Project setup & architecture planning
- API integration
- State management implementation
- Local persistence
- WebView + history tracking
- Testing and debugging
- Documentation and demo recording

---


Thank you for the opportunity to complete this challenge.

