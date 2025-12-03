import 'package:flutter/material.dart';
import 'add_payment_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment method',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your payment cards',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Mastercard
            PaymentCard(
              cardType: 'mastercard',
              cardNumber: '**** **** **** 3947',
              cardHolder: 'Bruno Fernandes',
              expiryDate: '05/25',
              backgroundColor: const Color(0xFF2D2D2D),
            ),
            
            const SizedBox(height: 16),
            
            // Visa card
            PaymentCard(
              cardType: 'visa',
              cardNumber: '**** **** **** 4546',
              cardHolder: 'Bruno Fernandes',
              expiryDate: '11/26',
              backgroundColor: const Color(0xFFFFFFFF),
              isLightCard: true,
            ),
            
            const Spacer(),
            
            // Add new card button
              SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPaymentScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.black87, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add, size: 24),
                label: const Text(
                  'Add new card',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String cardType;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final Color backgroundColor;
  final bool isLightCard;

  const PaymentCard({
    super.key,
    required this.cardType,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.backgroundColor,
    this.isLightCard = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isLightCard ? Colors.black87 : Colors.white;
    final subtextColor = isLightCard ? Colors.grey[600] : Colors.white70;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 40,
                child: _buildCardLogo(),
              ),
              Icon(
                Icons.more_horiz,
                color: textColor,
                size: 28,
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Card number
          Text(
            cardNumber,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: textColor,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Card holder and expiry
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder Name',
                    style: TextStyle(
                      fontSize: 12,
                      color: subtextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cardHolder,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry Date',
                    style: TextStyle(
                      fontSize: 12,
                      color: subtextColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    expiryDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardLogo() {
    if (cardType.toLowerCase() == 'mastercard') {
      return Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    } else if (cardType.toLowerCase() == 'visa') {
      return Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          'VISA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
