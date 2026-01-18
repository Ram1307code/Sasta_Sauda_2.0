import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';
import '../../models/user.dart';

class BuyersListPage extends StatefulWidget {
  const BuyersListPage({super.key});

  @override
  State<BuyersListPage> createState() => _BuyersListPageState();
}

class _BuyersListPageState extends State<BuyersListPage> {
  List<User> buyers = [];

  @override
  void initState() {
    super.initState();
    _loadBuyers();
  }

  void _loadBuyers() {
    // Dummy data
    buyers = [
      User(
        id: 'B1',
        name: 'John Buyer',
        email: 'john@example.com',
        phone: '+91 98765 00001',
        role: UserRole.buyer,
        address: 'Mumbai, Maharashtra',
        registeredDate: DateTime.now().subtract(const Duration(days: 60)),
        isVerified: true,
      ),
      User(
        id: 'B2',
        name: 'Sarah Merchant',
        email: 'sarah@example.com',
        phone: '+91 98765 00002',
        role: UserRole.buyer,
        address: 'Delhi, India',
        registeredDate: DateTime.now().subtract(const Duration(days: 45)),
        isVerified: true,
      ),
      User(
        id: 'B3',
        name: 'Rahul Trader',
        email: 'rahul@example.com',
        phone: '+91 98765 00003',
        role: UserRole.buyer,
        address: 'Bangalore, Karnataka',
        registeredDate: DateTime.now().subtract(const Duration(days: 20)),
        isVerified: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buyers Management'),
      ),
      body: buyers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: AppTheme.lightGray,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No buyers found',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.textLight,
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: buyers.length,
              itemBuilder: (context, index) {
                final buyer = buyers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.skyBlue.withOpacity(0.2),
                      child: const Icon(
                        Icons.person,
                        color: AppTheme.skyBlue,
                      ),
                    ),
                    title: Text(buyer.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(buyer.email),
                        Text(buyer.phone),
                        Text(buyer.address ?? 'No address'),
                        const SizedBox(height: 4),
                        Text(
                          'Registered: ${_formatDate(buyer.registeredDate)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showBuyerDetails(buyer);
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showBuyerDetails(User buyer) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.8,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppTheme.skyBlue.withOpacity(0.2),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: AppTheme.skyBlue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  buyer.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.skyBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Buyer',
                    style: TextStyle(
                      color: AppTheme.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildInfoRow(Icons.email, 'Email', buyer.email),
              _buildInfoRow(Icons.phone, 'Phone', buyer.phone),
              _buildInfoRow(Icons.location_on, 'Address',
                  buyer.address ?? 'Not provided'),
              _buildInfoRow(Icons.calendar_today, 'Registered',
                  _formatDate(buyer.registeredDate)),
              const SizedBox(height: 24),
              _buildInfoRow(Icons.shopping_bag, 'Total Orders', '23'),
              _buildInfoRow(Icons.currency_rupee, 'Total Spent', '₹12,450'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
