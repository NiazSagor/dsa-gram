# DSAgram

> Instagram Reels for learning Data Structures & Algorithms

A swipe-based mobile learning app that makes mastering DSA patterns engaging and bite-sized. Learn through short, focused cards in a vertical scrolling interface inspired by modern social media.

## ✨ Features

- **Swipe-Based Learning**: One card, one idea—scroll through at your own pace
- **Rich Content Support**: HTML-based cards with code snippets, visualizations, and quizzes
- **Pattern-Focused Curriculum**: Learn DSA through structured patterns and real-world recognition
- **Seamless Navigation**: Fast, intuitive pattern selection and card viewing
- **Offline Ready**: All patterns and cards load efficiently on mobile

## 🏗️ Architecture

**MVVM Pattern** with clear separation of concerns:

```
UI Layer (Dumb widgets) 
    ↓
ViewModel Layer (Business logic & state)
    ↓
Repository Layer (Data source abstraction)
    ↓
Backend (Supabase PostgreSQL)
```

**State Management**: Provider (minimal, predictable, Flutter-native)

**Design Principle**: App acts as a renderer; backend is the single source of truth.

## 📚 Data Model

### Patterns Table
```sql
- id (uuid)
- title (text)
- category (text)
- order_index (integer)
```

### Cards Table
```sql
- id (uuid)
- pattern_id (uuid)
- type (enum: concept, intuition, pitfall, recognition, code, quiz, problem)
- title (text)
- content (text)
- html_content (text)
- code_snippet (text)
- json_content (jsonb)
- order_index (integer)
```

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Frontend** | Flutter (Android + iOS) |
| **State Management** | Provider (MVVM) |
| **Backend** | Supabase (PostgreSQL) |
| **Rich Content** | WebView (HTML rendering) |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- Supabase account & API credentials

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/NiazSagor/dsa-gram.git
   cd dsa-gram
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   - Create `.env` file in project root
   - Add your Supabase URL and Anon Key:
     ```
     SUPABASE_URL=your_url_here
     SUPABASE_ANON_KEY=your_key_here
     ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 App Flow

```
1. Load Patterns
   ↓
2. Select Pattern
   ↓
3. Load Cards
   ↓
4. Swipe Through Cards
   ↓
5. Completion Screen
   └─→ Restart / Next Pattern / Random Pattern
```

## 📦 MVP Scope

**Included:**
- ✅ Pattern listing screen
- ✅ Vertical swipe card viewer
- ✅ HTML content rendering
- ✅ Basic navigation flow
- ✅ Completion & navigation screen

**Out of Scope:**
- ❌ Authentication
- ❌ Analytics
- ❌ Social features
- ❌ Notifications
- ❌ AI features

## 📁 Folder Structure

```
lib/
├── features/
│   ├── patterns/
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   ├── cards/
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   └── ...
├── core/
│   ├── providers/
│   ├── services/
│   └── utils/
└── main.dart
```

**Feature-based modular structure** ensures scalability and separation of concerns.

## 🧠 Design Philosophy

- **One Card = One Idea**: Micro-learning approach
- **Fast Consumption**: Minimal friction, immediate value
- **Minimal UI**: Focus on content, not chrome
- **Backend-Driven**: All content lives server-side
- **Renderer App**: UI is a thin, dumb presentation layer

## 🤝 Contributing

Guidelines coming soon.

## 📄 License

This project is licensed under the MIT License—see the LICENSE file for details.

---

**Learn DSA one swipe at a time.** 🚀