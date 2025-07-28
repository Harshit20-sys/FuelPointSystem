# 🚀 Fuel Point Management System

The **Fuel Point Management System** is a web-based Java application where **fuel pump owners** can register their stations and post **time-based offers** on fuel types (Petrol, Diesel, CNG). Users can view offers near them, explore them on a map, and navigate using Google Maps with live location support.

---

## 🌟 Features

### 🔐 Owner Module
- Owner Registration & Login
- Add available fuel types
- Create/View/Edit/Delete time-bound fuel offers
- Dashboard to manage offers

### 👤 User Module
- View all active public fuel offers
- See station details and offers in tabular view
- Google Maps integration:
  - View directions to station from live location
  - Blue pin: User location | Red pin: Fuel station

---

## 🛠️ Tech Stack

| Layer        | Technology                |
|--------------|---------------------------|
| Frontend     | HTML, CSS (No JavaScript) |
| Backend      | Java (Servlets, JSP)      |
| Database     | MySQL                     |
| Server       | Apache Tomcat 9.0         |
| IDE          | Eclipse IDE               |
| APIs Used    | Google Maps Direction API |

---

## 📸 Screenshots

![FRONT INTERFACE](https://github.com/Harshit20-sys/FuelPointSystem/blob/7a0d1ab203e5bc005ad49d103ada5c8cfa32ac7b/DASHBOARD.png)

### 👨‍💼 Owner Dashboard  
![Owner Dashboard](https://github.com/Harshit20-sys/FuelPointSystem/blob/defa4a3e4a5a84364e1d2c944c958a2a06a8b32a/Screenshot%202025-07-28%20082008.png)

### ➕ Add New Offer  
![Add Offer](screenshots/add_offer.png)

### 👀 Public Offers (User View)  
![Public Offers](screenshots/public_offers.png)

### 🗺️ Google Maps Directions  
![Maps Directions](screenshots/maps_directions.png)

---

## 📂 Folder Structure

FuelPointProject/
├── WebContent/
│ ├── owner/ # JSP pages for fuel pump owner
│ ├── public/ # JSP pages visible to users
│ ├── CSS/ # Static stylesheets
│
├── src/
│ └── com.fuel.servlet/ # Java Servlet files
│ ├── RegisterOwnerServlet.java
│ ├── AddFuelServlet.java
│ ├── OfferServlets.java
│
└── database/
└── fuel_point_db.sql # MySQL database script

## ⚙️ How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/fuel-point-project.git

2. Import as a Dynamic Web Project into Eclipse IDE

3. Setup MySQL:

    * Create a new database: fuel_point

    * Import fuel_point_db.sql from /database/ folder

4. Configure DB credentials in DBUtil.java

5. Start Apache Tomcat server (v9.0)

6.  Run project and visit:
   http://localhost:8080/FuelPointProject/

🔮 Future Enhancements
User login and bookmarking system

Real-time fuel price tracking API integration

Notification system for nearby deals

Admin analytics dashboard


📄 License
This project is open-source and available for educational use.
© 2025 Harshit Singh

