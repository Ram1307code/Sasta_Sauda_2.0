import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),

            // About Section
            _buildAboutSection(context),

            // Features Section
            _buildFeaturesSection(context),

            // Call to Action
            _buildCallToAction(context),

            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and Title
              const Icon(
                Icons.agriculture,
                size: 80,
                color: AppTheme.white,
              ),
              const SizedBox(height: 16),
              Text(
                'Sasta Sauda',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppTheme.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Direct Farm to Market',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.white.withOpacity(0.9),
                    ),
              ),
              const SizedBox(height: 32),
              Text(
                'Connecting Farmers Directly with Buyers\nFor Fair Prices and Fresh Produce',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.white,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 48),

              // CTA Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      foregroundColor: AppTheme.primaryGreen,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.white,
                      side: const BorderSide(color: AppTheme.white, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: AppTheme.white,
      child: Column(
        children: [
          Text(
            'About Sasta Sauda',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppTheme.primaryGreen,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Our mission is to eliminate middlemen and connect farmers directly with buyers, ensuring fair prices for farmers and fresh, affordable produce for consumers.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: AppTheme.textLight,
                ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard(context, '1000+', 'Farmers'),
              _buildStatCard(context, '5000+', 'Buyers'),
              _buildStatCard(context, '10000+', 'Transactions'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: AppTheme.offWhite,
      child: Column(
        children: [
          Text(
            'Key Features',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppTheme.primaryGreen,
                ),
          ),
          const SizedBox(height: 32),
          _buildFeatureCard(
            context,
            Icons.shopping_cart,
            'For Buyers',
            'Browse fresh produce directly from farmers with transparent pricing and quality assurance',
            AppTheme.skyBlue,
          ),
          const SizedBox(height: 16),
          _buildFeatureCard(
            context,
            Icons.store,
            'For Farmers',
            'List your products, reach more customers, and get fair prices without middlemen',
            AppTheme.warmOrange,
          ),
          const SizedBox(height: 16),
          _buildFeatureCard(
            context,
            Icons.verified,
            'Verified Sellers',
            'All farmers are verified by our admin team to ensure authenticity and quality',
            AppTheme.success,
          ),
          const SizedBox(height: 16),
          _buildFeatureCard(
            context,
            Icons.compare_arrows,
            'Price Comparison',
            'See farmer prices vs market prices to understand the value you\'re getting',
            AppTheme.sunYellow,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color accentColor,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: accentColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.lightGreen, AppTheme.primaryGreen],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Ready to Get Started?',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppTheme.white,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join thousands of farmers and buyers on our platform',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.white,
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.white,
              foregroundColor: AppTheme.primaryGreen,
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 16,
              ),
            ),
            child: const Text('Sign Up Now'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppTheme.darkGray,
      child: Column(
        children: [
          Text(
            '© 2026 Sasta Sauda. All rights reserved.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.white,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Empowering farmers, serving buyers',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.white.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }
}
