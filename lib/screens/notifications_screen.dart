import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.black87, size: 28),
          onPressed: () {},
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // Order confirmed notification (New)
          NotificationTile(
            image: 'assets/images/table.png',
            title: 'Your order #123456789 has been confirmed',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
            isNew: true,
            icon: Icons.chair_outlined,
          ),

          // Order canceled notification
          NotificationTile(
            image: 'assets/images/lamp.png',
            title: 'Your order #123456789 has been canceled',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
            isNew: false,
            icon: Icons.lightbulb_outline,
          ),

          // Hot sale promotion
          PromotionalNotificationTile(
            title: 'Discover hot sale furnitures this week.',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
            badge: 'HOT!',
          ),

          // Order shipped notification
          NotificationTile(
            image: 'assets/images/table.png',
            title: 'Your order #123456789 has been shipped successfully',
            description:
                'Please help us to confirm and rate your order to get 10% discount code for next order.',
            isNew: false,
            icon: Icons.chair_outlined,
          ),

          // Order confirmed notification
          NotificationTile(
            image: 'assets/images/table.png',
            title: 'Your order #123456789 has been confirmed',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
            isNew: false,
            icon: Icons.chair_outlined,
          ),

          // Order canceled notification
          NotificationTile(
            image: 'assets/images/armchair.png',
            title: 'Your order #123456789 has been canceled',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec.',
            isNew: false,
            icon: Icons.weekend_outlined,
          ),

          // Order shipped notification
          NotificationTile(
            image: 'assets/images/table.png',
            title: 'Your order #123456789 has been shipped successfully',
            description:
                'Please help us to confirm and rate your order to get 10% discount code for next order.',
            isNew: false,
            icon: Icons.chair_outlined,
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isNew;
  final IconData icon;

  const NotificationTile({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.isNew,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 35,
            ),
          ),

          const SizedBox(width: 16),

          // Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ),
                    if (isNew)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'New',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF27AE60),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionalNotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String badge;

  const PromotionalNotificationTile({
    super.key,
    required this.title,
    required this.description,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
              Text(
                badge,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEB5757),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
