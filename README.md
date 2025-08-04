# 🚀 flutter-app-gen

A proof-of-concept Flutter framework that renders entire apps from a single JSON configuration. Inspired by Server-Driven UI (SDUI) principles, this project enables you to define screens, components, themes, navigation, and state — all from a remotely or locally fetched JSON file.

---

## 📸 Screenshots

| Home Screen (Carousel + List) | Form Example | Remote Listing |
|-------------------------------|---------------|----------------|
| ![Home](screenshots/home.png) | ![Form](screenshots/form.png) | ![Listing](screenshots/listing.png) |

---

## 🧩 How It Works

At runtime, the app reads a JSON configuration (`appDataConfig`) that defines:

- **App metadata**: name, version  
- **Theme**: colors, dark mode support  
- **Navigation**: routes, drawer items  
- **Screens**: types (`base`, `form`, `listing`), their UI components and state  
- **Initial Actions**: like `fetch` to populate data before render  

The app renders a full working UI from this structure — **no manual coding required per screen**.

---

## 🔧 Supported Component Types (via JSON)

- `carousel`: Image/text carousels  
- `list`: Lists with icons, stats, or remote data  
- `text`: Static content  
- `dropdown`, `input`, `checkbox`, `button`: Form elements  
- `centeredtext`: Center-aligned static text blocks  

---

## 🛠 Example Features (from Demo Config)

- Home screen with a **carousel** and a **list** populated from initial state  
- A **dynamic form screen** with multiple input fields and a submit button  
- A **remote list fetcher** using a GET API (`jsonplaceholder.typicode.com`)  
- A **custom theme**, with light/dark support  
- A **drawer menu** configured from JSON  

---

## 📁 Sample JSON Structure

```json
{
  "appName": "JDF DEMO APP",
  "themeConfig": {
    "primaryColor": "#FFC107",
    "isDarkMode": false
  },
  "intialRoute": "/home",
  "routes": ["/home", "/details", "/listing"],
  "screens": [
    {
      "title": "Home Screen",
      "routeName": "/home",
      "components": [
        { "type": "carousel", "params": { "dataKey": "carouselData" } },
        { "type": "list", "params": { "dataKey": "data" } }
      ]
    }
  ]
}
