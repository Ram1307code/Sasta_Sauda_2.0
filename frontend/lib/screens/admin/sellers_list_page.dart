import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';
import '../../models/user.dart';

class SellersListPage extends StatefulWidget {
  final bool showPendingOnly;

  const SellersListPage({super.key, this.showPendingOnly = false});

  @override
  State<SellersListPage> createState() => _SellersListPageState();
}

class _SellersListPageState extends State<SellersListPage> {
  List<User> allSellers = [];
  List<User> filteredSellers = [];
  String filterStatus = 'All';

  @override
  void initState() {
    super.initState();
    _loadSellers();
    if (widget.showPendingOnly) {
      filterStatus = 'Pending';
    }
    _applyFilter();
  }

  void _loadSellers() {
    // Dummy data
    allSellers = [
      User(
        id: 'S1',
        name: 'Ramesh Kumar',
        email: 'ramesh@example.com',
        phone: '+91 98765 43210',
        role: UserRole.seller,
        address: 'Village Rampur, Punjab',
        registeredDate: DateTime.now().subtract(const Duration(days: 30)),
        isVerified: true,
      ),
      User(
        id: 'S2',
        name: 'Suresh Patil',
        email: 'suresh@example.com',
        phone: '+91 98765 43211',
        role: UserRole.seller,
        address: 'Nashik, Maharashtra',
        registeredDate: DateTime.now().subtract(const Duration(days: 15)),
        isVerified: true,
      ),
      User(
        id: 'S3',
        name: 'Vijay Singh',
        email: 'vijay@example.com',
        phone: '+91 98765 43212',
        role: UserRole.seller,
        address: 'Jaipur, Rajasthan',
        registeredDate: DateTime.now().subtract(const Duration(days: 5)),
        isVerified: false,
      ),
      User(
        id: 'S4',
        name: 'Lakshmi Devi',
        email: 'lakshmi@example.com',
        phone: '+91 98765 43213',
        role: UserRole.seller,
        address: 'Coimbatore, Tamil Nadu',
        registeredDate: DateTime.now().subtract(const Duration(days: 2)),
        isVerified: false,
      ),
    ];
  }

  void _applyFilter() {
    setState(() {
      if (filterStatus == 'All') {
        filteredSellers = allSellers;
      } else if (filterStatus == 'Verified') {
        filteredSellers = allSellers.where((s) => s.isVerified).toList();
      } else {
        filteredSellers = allSellers.where((s) => !s.isVerified).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sellers Management'),
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildFilterChip('All'),
                const SizedBox(width: 8),
                _buildFilterChip('Verified'),
                const SizedBox(width: 8),
                _buildFilterChip('Pending'),
              ],
            ),
          ),

          // Sellers List
          Expanded(
            child: filteredSellers.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 64,
                          color: AppTheme.lightGray,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No sellers found',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.textLight,
                                  ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredSellers.length,
                    itemBuilder: (context, index) {
                      final seller = filteredSellers[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: CircleAvatar(
                            backgroundColor: seller.isVerified
                                ? AppTheme.success.withOpacity(0.2)
                                : AppTheme.warning.withOpacity(0.2),
                            child: Icon(
                              Icons.person,
                              color: seller.isVerified
                                  ? AppTheme.success
                                  : AppTheme.warning,
                            ),
                          ),
                          title: Row(
                            children: [
                              Expanded(child: Text(seller.name)),
                              if (seller.isVerified)
                                const Icon(
                                  Icons.verified,
                                  color: AppTheme.success,
                                  size: 20,
                                ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(seller.email),
                              Text(seller.phone),
                              Text(seller.address ?? 'No address'),
                              const SizedBox(height: 4),
                              Text(
                                'Registered: ${_formatDate(seller.registeredDate)}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: seller.isVerified
                              ? null
                              : const Icon(
                                  Icons.pending_actions,
                                  color: AppTheme.warning,
                                ),
                          onTap: () {
                            _showSellerDetails(seller);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = filterStatus == label;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          filterStatus = label;
          _applyFilter();
        });
      },
      backgroundColor: AppTheme.white,
      selectedColor: AppTheme.lightGreen,
      labelStyle: TextStyle(
        color: isSelected ? AppTheme.white : AppTheme.textDark,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  void _showSellerDetails(User seller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
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
                  backgroundColor: seller.isVerified
                      ? AppTheme.success.withOpacity(0.2)
                      : AppTheme.warning.withOpacity(0.2),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color:
                        seller.isVerified ? AppTheme.success : AppTheme.warning,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  seller.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: seller.isVerified
                        ? AppTheme.success.withOpacity(0.1)
                        : AppTheme.warning.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        seller.isVerified ? Icons.verified : Icons.pending,
                        size: 16,
                        color: seller.isVerified
                            ? AppTheme.success
                            : AppTheme.warning,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        seller.isVerified ? 'Verified' : 'Pending Verification',
                        style: TextStyle(
                          color: seller.isVerified
                              ? AppTheme.success
                              : AppTheme.warning,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildInfoRow(Icons.email, 'Email', seller.email),
              _buildInfoRow(Icons.phone, 'Phone', seller.phone),
              _buildInfoRow(Icons.location_on, 'Address',
                  seller.address ?? 'Not provided'),
              _buildInfoRow(Icons.calendar_today, 'Registered',
                  _formatDate(seller.registeredDate)),
              const SizedBox(height: 32),
              if (!seller.isVerified) ...[
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _approveSeller(seller);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Approve'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.success,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _rejectSeller(seller);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('Reject'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.error,
                          side: const BorderSide(color: AppTheme.error),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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

  void _approveSeller(User seller) {
    setState(() {
      seller.isVerified = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${seller.name} has been approved'),
        backgroundColor: AppTheme.success,
      ),
    );
  }

  void _rejectSeller(User seller) {
    setState(() {
      allSellers.removeWhere((s) => s.id == seller.id);
      _applyFilter();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${seller.name} has been rejected'),
        backgroundColor: AppTheme.error,
      ),
    );
  }
}
