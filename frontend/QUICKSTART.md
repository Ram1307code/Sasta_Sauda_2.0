# 🚀 Quick Start Guide - Sasta Sauda

## Running the App

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run the App**
   ```bash
   flutter run
   ```

3. **Build for Production**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   
   # Web
   flutter build web --release
   ```

## 📱 App Flow

### First Launch
1. **Splash Screen** (3 seconds)
2. **Home/Landing Page**
   - Learn about the platform
   - View features
   - Access Login/Signup

### Authentication
- **Login**: Email + Password + Role Selection
- **Signup**: Full registration form with role selection
- Roles: Buyer, Farmer, Admin

### User Dashboards

#### 🛒 Buyer Dashboard
- Browse products by category
- Search functionality
- View product details
- Add to cart
- Checkout
- Profile management

#### 🌾 Farmer Dashboard
- Add/Edit/Delete products
- Monitor inventory
- View sales analytics
- Track performance

#### 👨‍💼 Admin Dashboard
- Approve/reject farmer registrations
- Manage users (buyers & sellers)
- View platform analytics
- Monitor sales trends

## 🎨 Key Features to Explore

### For Buyers
1. Open the app → Login as Buyer
2. Browse products in the marketplace
3. Filter by categories: Fruits, Vegetables, Grains, Other
4. Click on any product to see details
5. Compare farmer price vs market price
6. Add items to cart
7. Proceed to checkout

### For Farmers
1. Open the app → Login as Farmer
2. Click "Add Product" button
3. Select emoji icon for product
4. Fill in product details
5. Set your price and stock quantity
6. View your analytics
7. Manage your listings

### For Admins
1. Open the app → Login as Admin
2. View platform overview
3. Check pending seller verifications (badge notification)
4. Approve/reject seller accounts
5. View sales analytics
6. Monitor platform performance

## 🎯 Test Credentials

Since this is a demo app, you can use any credentials to login. Simply:
- Enter any email (e.g., test@example.com)
- Enter any password (min 6 characters)
- Select your role (Buyer/Farmer/Admin)
- Click Login

## 📂 Project Structure Overview

```
lib/
├── constants/         # Theme and styling
├── models/           # Data models
├── screens/          # All app screens
│   ├── buyer/       # Buyer-specific screens
│   ├── seller/      # Farmer-specific screens
│   └── admin/       # Admin-specific screens
├── utils/           # Helper functions and dummy data
└── main.dart        # App entry point
```

## 🎨 Color Scheme

- **Primary Green**: #2E7D32
- **Light Green**: #66BB6A  
- **Pale Green**: #C8E6C9
- **White**: #FFFFFF
- **Off-White**: #F5F5F5

## 📊 Dummy Data

The app includes sample data for demonstration:
- 8 sample products across different categories
- 4 sample sellers
- 3 sample buyers
- Sales and analytics data

## 🔧 Troubleshooting

### Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

### Dependency Issues
```bash
flutter pub upgrade
```

### Check Flutter Setup
```bash
flutter doctor
```

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🌟 App Highlights

1. **Clean UI/UX**: Modern Material Design 3
2. **Role-Based Access**: Separate dashboards for different users
3. **Real-time Cart**: Dynamic shopping cart with calculations
4. **Price Transparency**: Compare farmer vs market prices
5. **Admin Controls**: Comprehensive management tools
6. **Analytics**: Detailed insights for farmers and admins
7. **Responsive Design**: Works on all screen sizes

## 📈 Next Steps

After exploring the app, consider:
1. Integrating a backend (Firebase, REST API)
2. Adding real authentication
3. Implementing payment gateway
4. Adding push notifications
5. Enabling real-time chat
6. Adding image upload for products
7. Implementing order tracking

## 💡 Tips

- Use the **category filters** to quickly find products
- Check the **analytics page** for farmer performance insights
- Explore the **admin dashboard** for platform-wide statistics
- Review the **price comparison** feature to see savings

## 🎓 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design 3](https://m3.material.io/)
- [Dart Language Guide](https://dart.dev/guides)

---

**Happy Coding! 🌾**

For questions or support, refer to the main [README.md](README.md)
