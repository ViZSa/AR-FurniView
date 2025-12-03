import 'package:flutter/material.dart';
import 'add_shipping_address_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int _selectedAddressIndex = 0;

  final List<Map<String, dynamic>> _addresses = [
    {
      'name': 'Bruno Fernandes',
      'address': '25 rue Robert Latouche, Nice, 06200, Côte D\'azur, France',
    },
    {
      'name': 'Bruno Fernandes',
      'address': '25 rue Robert Latouche, Nice, 06200, Côte D\'azur, France',
    },
    {
      'name': 'Bruno Fernandes',
      'address': '25 rue Robert Latouche, Nice, 06200, Côte D\'azur, France',
    },
  ];

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
          'Shipping address',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                return AddressCard(
                  name: _addresses[index]['name'],
                  address: _addresses[index]['address'],
                  isSelected: _selectedAddressIndex == index,
                  onCheckboxChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedAddressIndex = index;
                      }
                    });
                  },
                  onEdit: () {
                    // Handle edit
                  },
                );
              },
            ),
          ),
          
          // Add button at bottom
          Padding(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddShippingAddressScreen(),
                  ),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 2,
              child: const Icon(Icons.add, size: 32),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onEdit;

  const AddressCard({
    super.key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onCheckboxChanged,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox with label
          Row(
            children: [
              GestureDetector(
                onTap: () => onCheckboxChanged(!isSelected),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black87 : Colors.white,
                    border: Border.all(
                      color: isSelected ? Colors.black87 : Colors.grey[400]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Use as the shipping address',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Address card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey[700]),
                      onPressed: onEdit,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 15,
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
