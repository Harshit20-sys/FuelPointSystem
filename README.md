# ⛽ Fuel Point Management System

The Fuel Point Management System is a web-based platform designed to help fuel pump owners manage fuel offers and help customers discover the best fuel discounts nearby. It promotes smart fuel purchasing decisions and encourages competition among stations.

## 🚀 Features

### 👤 Owner Module
- Owner Registration & Login
- Add Fuel Types (Petrol, Diesel, CNG)
- Create, View, Edit & Delete Time-Based Fuel Offers
- View Active Offers

### 🙋‍♂️ Public/User Module
- View Nearby Fuel Stations
- View Latest Offers
- Get Directions to Any Station Using Live Location (via Google Maps)

## 🧰 Tech Stack

| Layer     | Technology       |
|-----------|------------------|
| Frontend  | HTML, CSS        |
| Backend   | Java (Servlets)  |
| Database  | MySQL            |
| Server    | Apache Tomcat 9  |
| IDE       | Eclipse          |
| Hosting   | GitHub           |
| Mapping API | Google Maps Directions API |

## 📸 Screenshots


 ![Dashboard](https://github.com/Harshit20-sys/FuelPointSystem/blob/531476522407cf1ab87bc288e0e47c4a395d2d82/DASHBOARD.png) 

## 🗺️ Directions Integration

Fuel offers shown to users include a **"Get Directions"** button, which:
- Automatically fetches the user's current location
- Redirects to Google Maps with real-time directions to the fuel station

> 🚨 Ensure browser location access is enabled for this to work.

## ⚙️ How to Run Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/fuel-point-management.git

PROJECT STRUCTURE.

FuelPointSystem/
├── WebContent/
│   ├── publicoffers.jsp
│   ├── login.jsp
│   ├── register.jsp
│   └── ...
├── src/
│   └── com.fuel.servlet/
│       ├── AddFuelTypeServlet.java
│       ├── CreateOfferServlet.java
│       └── ...
├── database/
│   └── fuel_point_db.sql
└── README.md
