import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../models/furniture_item.dart';

class ARViewScreen extends StatefulWidget {
  final FurnitureItem item;

  const ARViewScreen({super.key, required this.item});

  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  bool _isARMode = false;
  String _selectedColor = '';

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.item.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        actions: [
          IconButton(
            icon: Icon(_isARMode ? Icons.view_in_ar : Icons.threed_rotation),
            onPressed: () {
              setState(() {
                _isARMode = !_isARMode;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 3D Model Viewer
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: ModelViewer(
                backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                src: widget.item.modelUrl,
                alt: widget.item.name,
                ar: _isARMode,
                autoRotate: !_isARMode,
                cameraControls: true,
                disableZoom: false,
              ),
            ),
          ),

          // Product Details
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Text(
                        '\$${widget.item.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Category
                  Chip(
                    label: Text(widget.item.category),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 16),

                  // Dimensions
                  Text(
                    'Dimensions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    children: [
                      _buildDimensionChip('Width', widget.item.dimensions['width']!),
                      _buildDimensionChip('Height', widget.item.dimensions['height']!),
                      _buildDimensionChip('Depth', widget.item.dimensions['depth']!),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Color Selection
                  Text(
                    'Available Colors',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: widget.item.colors.map((color) {
                      final isSelected = color == _selectedColor;
                      return ChoiceChip(
                        label: Text(color),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // TODO: Add to cart
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to cart!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Add to Cart'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {
                            setState(() {
                              _isARMode = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('AR mode activated!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: const Icon(Icons.view_in_ar),
                          label: const Text('View in AR'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDimensionChip(String label, double value) {
    return Chip(
      label: Text('$label: ${value.toStringAsFixed(2)}m'),
      avatar: const Icon(Icons.straighten, size: 16),
    );
  }
}
