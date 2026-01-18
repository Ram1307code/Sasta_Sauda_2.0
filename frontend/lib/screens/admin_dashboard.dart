import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import 'admin/sellers_list_page.dart';
import 'admin/buyers_list_page.dart';
import 'admin/sales_analytics_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final int totalSellers = 250;
  final int pendingSellers = 12;
  final int totalBuyers = 1850;
  final double totalSales = 1250000.0;
  final int totalOrders = 5430;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryGreen, AppTheme.lightGreen],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppTheme.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      size: 32,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin Panel',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: AppTheme.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Manage Sasta Sauda Platform',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.white.withOpacity(0.9),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Stats
            Text(
              'Platform Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    Icons.store,
                    '$totalSellers',
                    'Sellers',
                    AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    Icons.shopping_bag,
                    '$totalBuyers',
                    'Buyers',
                    AppTheme.skyBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    Icons.receipt_long,
                    '$totalOrders',
                    'Orders',
                    AppTheme.warmOrange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    Icons.currency_rupee,
                    '${(totalSales / 1000).toStringAsFixed(0)}K',
                    'Revenue',
                    AppTheme.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pending Verifications Alert
            if (pendingSellers > 0)
              Card(
                color: AppTheme.warning.withOpacity(0.1),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.warning.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.warning, color: AppTheme.warning),
                  ),
                  title: const Text('Pending Verifications'),
                  subtitle:
                      Text('$pendingSellers sellers waiting for approval'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SellersListPage(showPendingOnly: true),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 24),

            // Management Options
            Text(
              'Management',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildManagementCard(
              context,
              Icons.verified_user,
              'Seller Verification',
              'Review and approve seller registrations',
              AppTheme.primaryGreen,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SellersListPage(),
                  ),
                );
              },
            ),
            _buildManagementCard(
              context,
              Icons.people,
              'Manage Sellers',
              'View and manage all registered sellers',
              AppTheme.lightGreen,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SellersListPage(),
                  ),
                );
              },
            ),
            _buildManagementCard(
              context,
              Icons.shopping_cart,
              'Manage Buyers',
              'View and manage all registered buyers',
              AppTheme.skyBlue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuyersListPage(),
                  ),
                );
              },
            ),
            _buildManagementCard(
              context,
              Icons.analytics,
              'Sales Analytics',
              'View detailed sales reports and trends',
              AppTheme.warmOrange,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SalesAnalyticsPage(),
                  ),
                );
              },
            ),
            _buildManagementCard(
              context,
              Icons.category,
              'Product Categories',
              'Manage product categories and tags',
              AppTheme.sunYellow,
              () {},
            ),
            _buildManagementCard(
              context,
              Icons.settings,
              'Platform Settings',
              'Configure platform settings and policies',
              AppTheme.mediumGray,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color,
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

  Widget _buildManagementCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
