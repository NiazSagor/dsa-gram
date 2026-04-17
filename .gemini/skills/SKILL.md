# Flutter Architecture Rules (MVP - DSA Learning App)

---

# 🧠 Core Principles

- Flutter app for Android + iOS only
- Strict MVVM architecture using Provider
- UI must be dumb (render only)
- Business logic stays in ViewModels
- Data access only via Repository layer

---

# 🧱 Architecture Flow

UI (Widgets)
↓
ViewModel (ChangeNotifier / Provider)
↓
Repository Layer
↓
Supabase Client

❌ No direct Supabase calls from UI or ViewModel

---

# 📦 Folder Structure (Feature-Based Modularization)

lib/
├── core/
│    ├── network/
│    ├── supabase/
│    ├── constants/
│    ├── utils/
│
├── features/
│    ├── patterns/
│    │     ├── data/
│    │     │     ├── models/
│    │     │     ├── repository/
│    │     │
│    │     ├── presentation/
│    │     │     ├── screens/
│    │     │     ├── widgets/
│    │     │     ├── viewmodel/
│
│    ├── cards/
│    │     ├── data/
│    │     ├── presentation/
│    │
│    ├── swipe/
│    │     ├── presentation/
│    │     ├── viewmodel/
│
├── shared/
│    ├── widgets/
│    ├── themes/

---

# 🧠 MVVM RULES

## View (UI Layer)
- Only renders UI
- No business logic allowed
- Calls ViewModel methods only

## ViewModel
- Extends ChangeNotifier
- Holds UI state
- Handles loading / error / transformation
- Calls repository only

## Repository
- Only responsible for Supabase communication
- No UI logic allowed

---

# 🔌 STATE MANAGEMENT

- Only Provider is allowed
- No Bloc / Riverpod / Redux
- One ViewModel per feature

---

# 🗄️ SUPABASE RULES

- All API calls must go through repository layer
- No direct Supabase calls in UI or ViewModel

---

# 📱 UI RULES

- Keep UI minimal and fast
- Use PageView for swipe navigation
- One screen = one responsibility
- Avoid deep widget nesting
- Prefer reusable components

---

# 📄 CARD RENDERING RULES

Cards may support:
- text content
- HTML content (WebView)
- code snippets

Rendering logic must NOT be duplicated.
Use a single centralized renderer.

---

# 🌐 API RULES (IMPORTANT)

## Response DTO Format

All API responses must be normalized into a consistent model:

- Always map Supabase response → Model class
- Never pass raw JSON into UI
- Every feature must define its own model in `/data/models`

Example rule:
- Supabase response → CardModel / PatternModel
- No dynamic maps in UI layer

---

## Error Handling Patterns

All repositories must follow this pattern:

- Wrap Supabase calls in try-catch
- Convert errors into a unified AppError model
- Never throw raw exceptions into UI

Standard structure:

- success → return data
- failure → return controlled error object

UI must only react to:
- loading
- success
- error state

---

# 🎨 UI RULES (IMPORTANT)

## Reusable Card Components

- Every card type must have a reusable widget
- Do NOT duplicate UI across screens
- Create:
    - ConceptCardWidget
    - CodeCardWidget
    - QuizCardWidget
    - HtmlCardWidget

All cards must be composable and reusable.

---

## Animation Constraints

- Use only lightweight animations
- Prefer implicit animations (AnimatedContainer, AnimatedOpacity)
- Avoid heavy animation libraries
- Swipe transitions must use native PageView behavior
- No complex chained animations in MVP

---

# 🧠 NAMING CONVENTIONS

## ViewModel Naming

Must follow pattern:

- PatternViewModel
- CardViewModel
- SwipeViewModel

Format:
👉 FeatureName + ViewModel

---

## Repository Naming

Must follow pattern:

- PatternRepository
- CardRepository

Format:
👉 FeatureName + Repository

---

## General Rules

- No abbreviations in class names
- Use clear descriptive naming
- No generic names like Manager / Handler / Service (unless justified)

---

# 🚫 DO NOT

- Do not bypass repository layer
- Do not put logic in widgets
- Do not return raw JSON to UI
- Do not create unstructured folders
- Do not mix features

---

# ✅ DO

- Keep feature modular
- Keep ViewModels small
- Keep repositories thin
- Keep UI reusable and dumb
- Enforce consistent data models
