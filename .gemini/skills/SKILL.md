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

# 📦 DATA CONTRACTS (VERY IMPORTANT)

This project uses Supabase as the single source of truth.

The app must assume the following database schema and always generate models (DTOs) based on it.

---

## 🧠 Core Data Model

### 1. patterns (Table)

Represents DSA learning topics.

#### Schema

- id: String (uuid)
- title: String
- category: String (e.g. Array, Graph, DP)
- description: String? (optional)
- order_index: Int
- created_at: DateTime

---

### 2. cards (Table)

Represents individual swipe learning units.

Each row = ONE learning card.

#### Schema

- id: String (uuid)
- pattern_id: String (uuid, foreign key → patterns.id)
- type: String (enum)
    - concept
    - intuition
    - pitfall
    - recognition
    - code
    - quiz
    - problem
- title: String?
- content: String? (fallback plain text)
- html_content: String? (MVP rendering via WebView)
- code_snippet: String? (monospace code block)
- json_content: Map<String, dynamic>? (future native Flutter rendering)
- order_index: Int
- created_at: DateTime

---

### 3. user_progress (optional future table)

Tracks learning progress per user.

- id: String (uuid)
- user_id: String
- card_id: String
- is_completed: Boolean
- mastery_level: Int (0–3)
- last_viewed_at: DateTime
- created_at: DateTime

---

## 🧠 DTO GENERATION RULES

When generating Flutter models:

### 1. Every table MUST have a corresponding model

- PatternModel
- CardModel
- UserProgressModel (future)

---

### 2. Models must be strongly typed

- No dynamic types unless absolutely required
- json_content must be:
  → Map<String, dynamic>

---

### 3. Naming conventions

- Use PascalCase for models
- Use camelCase for fields
- Match Supabase fields exactly

---

### 4. Null safety rules

- Fields marked optional in schema MUST be nullable in Dart
- Example:
    - title → String?
    - content → String?

---

## 🔄 DATA FLOW RULES

### Supabase → App Flow

1. Supabase returns JSON
2. Repository layer converts JSON → DTO
3. ViewModel consumes only DTOs
4. UI NEVER handles raw JSON

---

## 📄 RENDERING DECISION RULE (IMPORTANT)

Cards must be rendered using this priority:

1. json_content (future native UI)
2. html_content (WebView - MVP)
3. content (plain text fallback)

---

## 🚫 DO NOT

- Do NOT generate UI logic inside models
- Do NOT use raw Map data in ViewModels
- Do NOT bypass repository layer
- Do NOT assume missing fields exist

---

## ✅ DO

- Always generate DTOs from schema above
- Always map Supabase response → model
- Always keep models clean and UI-agnostic

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
