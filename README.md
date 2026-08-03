# RideNova Mobile App Documentation

## Overview

RideNova is a Flutter-based mobile ride-booking application built using **Clean Architecture** and **Riverpod** for efficient and scalable state management. The application provides a complete ride-booking experience, including user authentication, Google Maps integration, location selection, vehicle selection, driver search, ride tracking, ride history, and profile management.

A standout feature of RideNova is its **Gemini AI-powered Ride Assistant**, which allows users to book rides using natural language. Instead of manually entering booking details, users can simply describe their journey, and the AI intelligently extracts the pickup location, destination, travel date, travel time, and preferred vehicle type to streamline the booking process.

The project is designed specifically for Android and iOS platforms with a modular architecture, making it easy to extend with backend services, online payments, real-time ride tracking, and additional AI capabilities in the future.

---

## Architecture

The project follows **Clean Architecture** principles with a feature-first organization.

```text
lib/
├── app/              # App-wide configurations
├── core/             # Core utilities, services and reusable widgets
└── features/
    ├── ai_assistant/ # Gemini AI assistant
    ├── auth/         # Authentication
    ├── home/         # Home screen
    ├── onboarding/   # Splash & onboarding
    ├── profile/      # User profile
    └── ride/         # Ride booking & tracking
```

---

## Key Features

### 1. Onboarding & Authentication

- Splash screen with animated logo
- Interactive onboarding screens
- Login & Sign Up
- Form validation
- Clean authentication flow

### 2. Home Screen

- Google Maps integration
- Current location support
- Saved places
- Destination search
- Quick ride booking
- AI Assistant shortcut

### 3. Gemini AI Ride Assistant

- Natural language ride booking
- AI-powered booking assistant using **Google Gemini**
- Extracts booking details from user messages
- Automatically identifies:
    - Pickup location
    - Destination
    - Travel date
    - Travel time
    - Vehicle type
- Reduces manual booking steps
- Built using Clean Architecture for future AI model integration
- Designed for future voice-based ride booking

---

### 4. Ride Booking

- Pickup & destination selection
- Vehicle selection
- Economy
- Comfort
- Premium
- Fare estimation
- Payment method selection
- Booking confirmation

---

### 5. Ride Experience

- Driver search animation
- Driver details
- Ride progress tracking
- Ride completion summary
- Fare summary

---

### 6. User Profile

- User profile management
- Ride history
- Settings
- Account information

---

## AI Module Architecture

The AI booking assistant follows the application's Clean Architecture.

```
Presentation Layer
        │
        ▼
Riverpod Provider
        │
        ▼
Use Case
        │
        ▼
Repository
        │
        ▼
Gemini Remote Data Source
        │
        ▼
Google Gemini AI
```

---

## State Management

RideNova uses **Flutter Riverpod** for reactive state management.

Main providers include:

- `currentRideProvider`
- `savedLocationsProvider`
- `vehicleTypesProvider`
- `selectedVehicleTypeProvider`
- `rideHistoryProvider`
- `aiAssistantProvider`

---

## Navigation

Navigation is implemented using **go_router**, providing clean and declarative routing throughout the application.

Main routes include:

- Splash
- Onboarding
- Login
- Signup
- Home
- AI Assistant
- Location Selector
- Vehicle Selection
- Driver Search
- Ride In Progress
- Ride Completion
- Ride History
- Profile
- Settings

---

## UI Components

Reusable UI components include:

- CustomButton
- CustomTextField
- LoadingIndicator
- VehicleTypeCard
- RideMap
- AI Chat Bubble
- AI Text Field
- Ride Summary Card

---

## Mobile-Specific Features

### Android

- Material Design UI
- Google Maps integration
- Location permissions
- Responsive layouts

### iOS

- Cupertino-style components
- Native navigation
- Maps integration
- Responsive layouts

---

## Technologies Used

- Flutter
- Dart
- Riverpod
- GoRouter
- Google Maps Flutter
- HTTP
- Flutter Secure Storage
- Clean Architecture
- Google Gemini AI Integration

---

## Future Enhancements

- Firebase Authentication
- Backend API integration
- Online ride booking
- Secure payment gateway
- Real-time driver tracking
- Push notifications
- Voice-enabled AI booking
- Multi-language AI support
- Personalized ride recommendations
- Smart fare prediction

---

## Development Notes

- Built using **Flutter** and **Dart**
- Implements **Clean Architecture** with feature-first organization
- Uses **Riverpod** for scalable state management
- Navigation handled using **GoRouter**
- Google Maps integration for location services
- AI booking assistant designed using **Google Gemini**
- Modular architecture for easy backend and AI service integration
- Designed for Android and iOS mobile platforms
- Optimized for portrait orientation
