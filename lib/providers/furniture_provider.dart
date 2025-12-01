import 'package:flutter/foundation.dart';
import '../models/furniture_item.dart';

class FurnitureProvider with ChangeNotifier {
  List<FurnitureItem> _items = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';

  List<FurnitureItem> get items => _items;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  List<FurnitureItem> get filteredItems {
    var filtered = _items;

    // Filter by category
    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((item) => item.category == _selectedCategory)
          .toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((item) =>
              item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              item.description
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  List<FurnitureItem> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  List<String> get categories {
    return ['All', ...{for (var item in _items) item.category}];
  }

  // Initialize with sample data
  FurnitureProvider() {
    _loadSampleData();
  }

  void _loadSampleData() {
    _items = [
      FurnitureItem(
        id: '1',
        name: 'Modern Sofa',
        description: 'Comfortable 3-seater sofa with elegant design',
        category: 'Sofa',
        price: 899.99,
        imageUrl: 'assets/images/sofa1.jpg',
        modelUrl: 'assets/models/sofa.glb',
        colors: ['Gray', 'Blue', 'Beige'],
        dimensions: {'width': 2.1, 'height': 0.85, 'depth': 0.9},
      ),
      FurnitureItem(
        id: '2',
        name: 'Oak Dining Table',
        description: 'Solid oak dining table for 6 people',
        category: 'Table',
        price: 1299.99,
        imageUrl: 'assets/images/table1.jpg',
        modelUrl: 'assets/models/table.glb',
        colors: ['Natural Oak', 'Dark Walnut'],
        dimensions: {'width': 1.8, 'height': 0.75, 'depth': 0.9},
      ),
      FurnitureItem(
        id: '3',
        name: 'Ergonomic Office Chair',
        description: 'Professional office chair with lumbar support',
        category: 'Chair',
        price: 349.99,
        imageUrl: 'assets/images/chair1.jpg',
        modelUrl: 'assets/models/chair.glb',
        colors: ['Black', 'Gray', 'Red'],
        dimensions: {'width': 0.65, 'height': 1.2, 'depth': 0.65},
      ),
      FurnitureItem(
        id: '4',
        name: 'King Size Bed',
        description: 'Luxurious king size bed with storage',
        category: 'Bed',
        price: 1599.99,
        imageUrl: 'assets/images/bed1.jpg',
        modelUrl: 'assets/models/bed.glb',
        colors: ['White', 'Gray', 'Brown'],
        dimensions: {'width': 2.0, 'height': 1.2, 'depth': 2.2},
      ),
    ];
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavorite(String itemId) {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _items[index].isFavorite = !_items[index].isFavorite;
      notifyListeners();
    }
  }

  FurnitureItem? getItemById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
