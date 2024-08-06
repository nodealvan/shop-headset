import 'package:flutter/foundation.dart';
import 'package:penjualanku/models/Product.dart';

class Cart with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double totalPrice() {
    return _items.fold(
      0,
      (total, product) => total + product.price,
    );
  }

  int productCount() {
    return _items.length;
  }
}
