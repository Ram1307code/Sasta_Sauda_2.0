import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class FarmerAnalyticsPage extends StatelessWidget {
  final int totalListed;
  final int totalSold;
  final int totalRemaining;

  const FarmerAnalyticsPage({
    super.key,
    required this.totalListed,
    required this.totalSold,
    required this.totalRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final totalRevenue = 25450.0; // Dummy data
    final thisMonthSales = 15; // Dummy data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Overview',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppTheme.primaryGreen,
                  ),
            ),
            const SizedBox(height: 24),

            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'Total Listed',
                    '$totalListed',
                    Icons.inventory,
                    AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'Total Sold',
                    '$totalSold',
                    Icons.shopping_cart_checkout,
                    AppTheme.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'In Stock',
                    '$totalRemaining',
                    Icons.inventory_2,
                    AppTheme.warning,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    context,
                    'This Month',
                    '$thisMonthSales',
                    Icons.calendar_month,
                    AppTheme.info,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Revenue Card
            Card(
              color: AppTheme.paleGreen,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 32,
                          color: AppTheme.primaryGreen,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Total Revenue',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '₹${totalRevenue.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppTheme.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Based on completed sales',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textLight,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Product History
            Text(
              'Listing History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildHistoryItem(
              context,
              'Fresh Tomatoes',
              'Listed 2 days ago',
              '500 kg available',
              AppTheme.success,
            ),
            _buildHistoryItem(
              context,
              'Basmati Rice',
              'Listed 5 days ago',
              '1000 kg available',
              AppTheme.success,
            ),
            _buildHistoryItem(
              context,
              'Wheat',
              'Listed 7 days ago',
              '2000 kg available',
              AppTheme.success,
            ),
            const SizedBox(height: 32),

            // Tips Card
            Card(
              color: AppTheme.skyBlue.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: AppTheme.sunYellow,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Tips to Improve Sales',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildTip('Keep your products updated regularly'),
                    _buildTip('Price competitively compared to market'),
                    _buildTip('Provide accurate descriptions'),
                    _buildTip('Respond quickly to buyer inquiries'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(
    BuildContext context,
    String title,
    String date,
    String stock,
    Color statusColor,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check_circle, color: statusColor),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(date),
            Text(stock, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check,
            size: 16,
            color: AppTheme.primaryGreen,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
