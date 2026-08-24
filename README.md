

# ⭐ Northstar POS Dashboard

A modern, full-stack **Point of Sale (POS) and Inventory Management System** built with **HTML, CSS, JavaScript, Express.js, and MySQL**.

Northstar POS provides a simple interface for managing products, processing sales, tracking inventory, and monitoring business performance through a centralized dashboard.

---

## 📸 Overview

Northstar POS is designed for small and medium-sized businesses that need a lightweight system to:

* Monitor daily sales
* Process customer purchases
* Manage products and inventory
* Automatically deduct stock after checkout
* Review sales history
* Track key business performance indicators
* Interact with the system through a REST API

The application uses **Express.js** as the backend server and **MySQL** as the relational database.

---

## ✨ Features

### 📊 Dashboard

Get a quick overview of business performance with key metrics such as:

* Total sales
* Number of transactions
* Products in inventory
* Low-stock products
* Recent transactions
* Sales performance

### 🛒 Point of Sale

The POS interface allows users to:

* Browse available products
* Add products to a cart
* Adjust quantities
* Remove products from the cart
* Automatically calculate totals
* Complete customer checkouts

### 📦 Inventory Management

Manage your product catalog and stock levels with:

* Product listings
* Stock quantities
* Product pricing
* Stock status
* Low-stock identification
* Automatic stock deduction after sales

### 💳 Checkout

The checkout process automatically:

1. Validates the cart
2. Calculates the transaction total
3. Creates the sale
4. Records sale items
5. Deducts purchased quantities from inventory
6. Returns the transaction result

### 📋 Sales History

Review previous transactions, including:

* Sale ID
* Transaction date
* Items purchased
* Quantities
* Total amount

### 🔌 REST API

The backend exposes RESTful endpoints for interacting with:

* Products
* Inventory
* Sales
* Checkout
* Dashboard statistics

This makes the application suitable for future integrations with mobile applications, reporting systems, or third-party services.

---

## 🏗️ Technology Stack

| Layer           | Technology              |
| --------------- | ----------------------- |
| Frontend        | HTML5, CSS3, JavaScript |
| Backend         | Node.js + Express.js    |
| Database        | MySQL                   |
| API             | REST API                |
| Package Manager | npm                     |
| Development     | JavaScript              |

---

## 📁 Project Structure

```text
northstar-pos/
│
├── public/
│   ├── index.html
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── app.js
│
├── routes/
│   ├── products.js
│   ├── sales.js
│   └── dashboard.js
│
├── db/
│   └── connection.js
│
├── schema.sql
├── server.js
├── package.json
├── package-lock.json
├── .env.example
├── .gitignore
└── README.md
```

> The exact folder structure may vary depending on your implementation.

---

## ⚙️ Requirements

Before running Northstar POS, make sure you have installed:

* **Node.js** 18+
* **npm**
* **MySQL** 8+
* **MySQL Workbench** or another MySQL client

Verify your installations:

```bash
node --version
npm --version
mysql --version
```

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/northstar-pos.git
```

Navigate into the project:

```bash
cd northstar-pos
```

---

### 2. Create the Database

Open **MySQL Workbench** and execute:

```text
schema.sql
```

This creates the required database tables and initial data.

Alternatively, from the MySQL command line:

```bash
mysql -u root -p < schema.sql
```

---

### 3. Configure Environment Variables

Create a `.env` file from the provided example:

```bash
cp .env.example .env
```

On Windows, you can simply copy the file manually:

```text
.env.example → .env
```

Configure your database credentials:

```env
PORT=3000

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=northstar_pos
DB_PORT=3306
```

> Never commit your `.env` file to GitHub. It may contain sensitive database credentials.

---

### 4. Install Dependencies

Run:

```bash
npm install
```

---

### 5. Start the Application

```bash
npm start
```

The application should start on:

```text
http://localhost:3000
```

Open the address in your browser.

---

## 🖥️ Application Flow

The typical POS workflow is:

```text
Dashboard
    │
    ├── View KPIs
    │
    ├── Inventory
    │      └── Manage Products & Stock
    │
    └── POS
           │
           ├── Select Products
           ├── Add to Cart
           ├── Adjust Quantity
           └── Checkout
                  │
                  ├── Create Sale
                  ├── Record Sale Items
                  └── Deduct Inventory
```

---

## 🗄️ Database

Northstar POS uses MySQL to persist products, inventory, and sales information.

A typical database structure includes:

### Products

Stores product information.

| Field        | Description               |
| ------------ | ------------------------- |
| `id`         | Unique product identifier |
| `name`       | Product name              |
| `price`      | Selling price             |
| `stock`      | Available quantity        |
| `created_at` | Creation timestamp        |

### Sales

Stores completed transactions.

| Field        | Description            |
| ------------ | ---------------------- |
| `id`         | Unique sale identifier |
| `total`      | Transaction total      |
| `created_at` | Sale timestamp         |

### Sale Items

Stores the products included in each sale.

| Field        | Description               |
| ------------ | ------------------------- |
| `id`         | Unique record identifier  |
| `sale_id`    | Associated sale           |
| `product_id` | Purchased product         |
| `quantity`   | Quantity purchased        |
| `price`      | Product price at checkout |

---

## 🔌 REST API

The backend provides REST endpoints for interacting with the application.

### Products

#### Get Products

```http
GET /api/products
```

Returns the available products.

#### Get a Product

```http
GET /api/products/:id
```

Returns information about a specific product.

#### Create a Product

```http
POST /api/products
```

Example request:

```json
{
  "name": "Coffee",
  "price": 250,
  "stock": 50
}
```

---

### Sales

#### Get Sales

```http
GET /api/sales
```

Returns sales history.

#### Get Sale

```http
GET /api/sales/:id
```

Returns details about a specific transaction.

---

### Checkout

```http
POST /api/checkout
```

Example request:

```json
{
  "items": [
    {
      "product_id": 1,
      "quantity": 2
    },
    {
      "product_id": 3,
      "quantity": 1
    }
  ]
}
```

The checkout process should perform the transaction atomically:

```text
Validate Products
       ↓
Validate Stock
       ↓
Calculate Total
       ↓
Create Sale
       ↓
Create Sale Items
       ↓
Deduct Stock
       ↓
Commit Transaction
```

If an error occurs during checkout, the transaction should be rolled back to prevent inconsistent inventory or sales data.

---

## 📈 Dashboard KPIs

The dashboard can expose metrics such as:

```text
┌──────────────────┐
│   TOTAL SALES    │
│    KSh 125,450   │
└──────────────────┘

┌──────────────────┐
│  TRANSACTIONS    │
│       342        │
└──────────────────┘

┌──────────────────┐
│    PRODUCTS      │
│       128        │
└──────────────────┘

┌──────────────────┐
│   LOW STOCK      │
│        7         │
└──────────────────┘
```

These values should be retrieved dynamically from the database rather than hard-coded.

---

## 🔐 Security Considerations

For production deployments, consider implementing:

* Password hashing
* User authentication
* Role-based access control
* Input validation
* SQL injection protection
* Rate limiting
* Secure HTTP headers
* HTTPS
* Database least-privilege users
* Environment-based secrets
* Audit logging

Never store database passwords or API secrets directly in source code.

---

## 🧪 Testing

Run the application:

```bash
npm start
```

Then verify:

### Dashboard

* [ ] Dashboard loads successfully
* [ ] KPI values are displayed
* [ ] Recent sales are shown

### POS

* [ ] Products load correctly
* [ ] Products can be added to the cart
* [ ] Cart quantities can be modified
* [ ] Products can be removed
* [ ] Total is calculated correctly

### Checkout

* [ ] Checkout succeeds with valid stock
* [ ] Sale is recorded
* [ ] Sale items are recorded
* [ ] Inventory is deducted
* [ ] Insufficient stock is rejected

### Inventory

* [ ] Products are displayed
* [ ] Stock quantities are accurate
* [ ] Low-stock products are identifiable

### Sales

* [ ] Sales history loads
* [ ] Transaction totals are correct
* [ ] Sale details are accessible

---

## 🐛 Troubleshooting

### MySQL connection failed

Check your `.env` configuration:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=northstar_pos
DB_PORT=3306
```

Also confirm that MySQL is running.

---

### Port already in use

If port `3000` is occupied, change:

```env
PORT=3000
```

to another available port, for example:

```env
PORT=3001
```

Then open:

```text
http://localhost:3001
```

---

### Database does not exist

Make sure `schema.sql` has been executed successfully before starting the application.

---

### Products are not appearing

Check:

1. MySQL is running.
2. The correct database is configured.
3. The tables were created.
4. Product records exist.
5. The API endpoint is returning data.
6. Browser developer tools for frontend errors.

---

## 🌱 Future Improvements

Potential future enhancements include:

* 👤 User authentication
* 🔐 Role-based permissions
* 🧾 Printable receipts
* 📱 Responsive/mobile POS interface
* 📊 Advanced sales analytics
* 📈 Sales charts and reports
* 🔔 Low-stock notifications
* 💰 Tax and discount management
* 🏪 Multi-branch support
* 👥 Customer management
* 💳 Multiple payment methods
* 📥 CSV/Excel reporting
* 🧾 Invoice generation
* 🔄 Supplier management
* ☁️ Cloud deployment
* 📡 Offline-first POS functionality

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository.
2. Create a feature branch.

```bash
git checkout -b feature/my-new-feature
```

3. Make your changes.
4. Test the application.
5. Commit your changes.

```bash
git commit -m "feat: add new POS feature"
```

6. Push your branch.

```bash
git push origin feature/my-new-feature
```

7. Open a Pull Request.

---

## 📄 License

This project is available under the **MIT License**.

See the `LICENSE` file for more information.

---

## 👨‍💻 Author

**Northstar POS**

Built with:

* HTML
* CSS
* JavaScript
* Node.js
* Express.js
* MySQL

---

## ⭐ Support

If you find this project useful, consider giving the repository a ⭐ on GitHub.

For bugs, feature requests, or questions, open an issue in the repository.

---

## 🚀 Quick Start

For experienced developers, the entire setup can be summarized as:

```bash
git clone https://github.com/90Hillart/northstar-pos.git
cd northstar-pos
```

Create and configure `.env`, then:

```bash
npm install
npm start
```

Open:

```text
http://localhost:3000
```

**Northstar POS — simple sales, smarter inventory, better business visibility.**
