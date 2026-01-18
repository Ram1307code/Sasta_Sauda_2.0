# Sasta Sauda - AgriTech Platform

A modern Flutter-based AgriTech application connecting farmers directly with buyers for fair prices and fresh produce.

## 🌾 Overview

Sasta Sauda eliminates middlemen by providing a direct platform where farmers can list their products and buyers can purchase fresh agricultural produce at transparent, competitive prices. The platform ensures fair compensation for farmers while offering buyers access to quality products.

## ✨ Features

### 🏠 Home/Landing Page
- Clean, welcoming design with farm visuals
- About section explaining the platform's mission
- Key features showcase for both buyers and farmers
- Call-to-action buttons for Login and Sign Up
- Responsive and smooth transitions

### 🛒 Buyer Dashboard
- **Product Marketplace**
  - Browse products by categories: Fruits, Vegetables, Grains, Other
  - Advanced search functionality
  - Product cards with images, prices, and farmer information
  - Price comparison (farmer price vs market price)
  - Discount percentage display
  
- **Shopping Cart**
  - Add/remove products
  - Quantity management
  - Real-time total calculation
  - Checkout functionality

- **Product Details**
  - Detailed product information
  - Farmer information
  - Stock availability
  - Price comparison card
  - Savings calculation

- **Profile Management**
  - View and edit profile
  - Order history
  - Delivery addresses
  - Wishlist
  - Settings and support

### 🌾 Seller (Farmer) Dashboard
- **Product Management**
  - Add new product listings with emoji icons
  - Edit existing products
  - Delete products
  - Visual product catalog
  
- **Inventory Tracking**
  - Stock quantity monitoring
  - Low stock warnings
  - Product availability status

- **Analytics & Insights**
  - Total products listed
  - Total products sold
  - Current inventory
  - Revenue tracking
  - Listing history
  - Performance tips

### 👨‍💼 Admin Dashboard
- **Platform Overview**
  - Total sellers, buyers, orders
  - Revenue statistics
  - Quick stats dashboard

- **Seller Verification System**
  - Review seller registration details
  - Approve/reject seller accounts
  - Manage verification status
  - Pending verifications alerts

- **User Management**
  - Complete list of buyers and sellers
  - Filter by verification status
  - Detailed user profiles
  - User activity tracking

- **Sales Analytics**
  - Total platform sales
  - Category-wise sales breakdown
  - Top-selling products
  - Sales predictions and trends
  - Performance insights
  - Growth metrics

## 🎨 Design Theme

### Color Palette
- **Primary**: Fresh Green (#2E7D32)
- **Secondary**: Light Green (#66BB6A)
- **Accent**: Pale Green (#C8E6C9)
- **Background**: White (#FFFFFF) & Off-White (#F5F5F5)
- **Earthy Accents**: Warm Orange, Sun Yellow, Sky Blue

### Visual Style
- Modern, farmer-first design
- Clean cards with soft shadows
- Rounded elements for friendliness
- Farm-themed icons and emoji
- Trustworthy, professional interface
- Responsive layouts

## 📁 Project Structure

```
lib/
├── constants/
│   └── app_theme.dart              # Theme configuration
├── models/
│   ├── product.dart                # Product data model
│   ├── user.dart                   # User data model
│   └── cart.dart                   # Shopping cart model
├── screens/
│   ├── home_page.dart              # Landing page
│   ├── login_page.dart             # Login screen
│   ├── signup_page.dart            # Registration screen
│   ├── buyer_dashboard.dart        # Buyer main screen
│   ├── seller_dashboard.dart       # Farmer main screen
│   ├── admin_dashboard.dart        # Admin main screen
│   ├── buyer/
│   │   ├── product_detail_page.dart
│   │   ├── cart_page.dart
│   │   └── profile_page.dart
│   ├── seller/
│   │   ├── add_product_page.dart
│   │   └── farmer_analytics_page.dart
│   └── admin/
│       ├── sellers_list_page.dart
│       ├── buyers_list_page.dart
│       └── sales_analytics_page.dart
├── utils/
│   └── dummy_data.dart             # Sample data
└── main.dart                       # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.6.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd sasta_sauda_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📱 User Roles

### Buyer
- Browse and search products
- Compare prices
- Add items to cart
- Place orders
- Track order history
- Manage profile

### Farmer/Seller
- List products with details
- Manage inventory
- Update prices
- View sales analytics
- Track performance
- Requires admin verification

### Admin
- Verify seller accounts
- Manage all users
- Monitor platform sales
- View analytics and trends
- Generate reports
- Platform configuration

## 🔐 Authentication Flow

1. **Splash Screen** → Displays for 3 seconds
2. **Home Page** → Landing page with information
3. **Login/Signup** → Role-based authentication
4. **Dashboard** → Navigate to role-specific dashboard

## 🎯 Key Highlights

- ✅ **Direct Trade**: Eliminates middlemen
- ✅ **Fair Pricing**: Transparent price comparison
- ✅ **Verified Sellers**: Admin-approved farmers only
- ✅ **Fresh Produce**: Direct from farms
- ✅ **Analytics**: Data-driven insights for all stakeholders
- ✅ **Mobile-First**: Responsive design for all devices

## 🛠️ Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: StatefulWidget
- **UI Components**: Material Design 3
- **Icons**: Material Icons
- **Navigation**: Named routes

## 📊 Future Enhancements

- [ ] Backend integration (Firebase/REST API)
- [ ] Real-time chat between buyers and sellers
- [ ] Payment gateway integration
- [ ] Order tracking with delivery status
- [ ] Rating and review system
- [ ] Push notifications
- [ ] Multi-language support
- [ ] Advanced analytics with charts
- [ ] Location-based product search
- [ ] Seasonal product recommendations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.

## 👥 Team

Developed with ❤️ for connecting farmers and buyers.

---

**Sasta Sauda** - Empowering farmers, serving buyers 🌾
