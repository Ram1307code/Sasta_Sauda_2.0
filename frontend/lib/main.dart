import 'dart:async';
import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/buyer_dashboard.dart';
import 'screens/seller_dashboard.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(const SastaSaudaApp());
}

class SastaSaudaApp extends StatelessWidget {
  const SastaSaudaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sasta Sauda',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/buyer-dashboard': (context) => const BuyerDashboard(),
        '/seller-dashboard': (context) => const SellerDashboard(),
        '/admin-dashboard': (context) => const AdminDashboard(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primaryGreen,
              AppTheme.lightGreen,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.agriculture,
                  size: 80,
                  color: AppTheme.white,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Sasta Sauda",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "Fair Prices. Direct Trade.",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.white.withOpacity(0.9),
                    ),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(
                color: AppTheme.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
