import 'package:flutter/material.dart';

import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/details_screen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Search> {
  String searchText = '';
  List<Product> filteredProducts = products;

  void _updateSearchText(String text) {
    setState(() {
      searchText = text;
      filteredProducts = _filterProducts(searchText);
    });
  }

  List<Product> _filterProducts(String query) {
    return products
        .where((product) =>
            product.nama.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void _addProductToCart(Product product) {
    // Implementasikan logika untuk menambahkan produk ke keranjang
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            //width: 320,
            //decoration: BoxDecoration(
            //  color: Colors.white,
            //  //borderRadius: BorderRadius.circular(30),
            //  boxShadow: [
            //    BoxShadow(
            //      color: Colors.black.withOpacity(0.1),
            //      blurRadius: 0.2,
            //      spreadRadius: 2,
            //      offset: Offset(0, 3),
            //    ),
            //  ],
            //),
            child: TextField(
              onChanged: _updateSearchText,
              decoration: const InputDecoration(
                hintText: 'Cari Produk...',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                suffixIcon: Icon(Icons.search, color: Colors.blue),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(
                  vertical: 1.0), // Mengurangi margin vertikal
              child: ListTile(
                visualDensity:
                    VisualDensity.compact, // Mengurangi jarak dalam ListTile
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  product.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "Aovel",
                  ),
                ),
                subtitle: Text(
                  'Rp${product.price.toStringAsFixed(3)}',
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: product, // Berikan produk yang benar
                        onCountChanged: (int count) {
                          _addProductToCart(product); // Tambahkan ke Cart
                        },
                        onFavoriteToggled: (bool isFavorite) {
                          // Logika favorit
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
