import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:penjualanku/constants.dart';
import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart' as cart_divider;
import 'package:penjualanku/screens/details/components/garis.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cart_divider.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            tooltip: 'Kosongkan keranjang',
            onPressed: () {
              if (cart.items.isEmpty) {
                return;
              } else {
                cart.clear();
                ElegantNotification.error(
                  width: 360,
                  isDismissable: true,
                  animationCurve: Curves.easeOut,
                  position: Alignment.topCenter,
                  animation: AnimationType.fromTop,
                  title: const Text('Clear'),
                  description: const Text('Semua product dibersihkan'),
                  shadow: BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ).show(context);
              }
            },
          ),
        ],
      ),
      body: _buildCartBody(cart),
      bottomNavigationBar: _buildBottomNavigationBar(context, cart),
    );
  }

  Widget _buildCartBody(Cart cart) {
    if (cart.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                  'assets/images/cart.png'), // Ganti dengan path gambar yang sesuai
            ),
            const Text(
              'Product Kosong',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Silahkan masukan product ke dalam keranjang')
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 572,
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return _buildCartItem(
                    product, cart, context); // Pastikan metode ini benar
              },
            ),
          ),
          Container(
            height: 100,
            width: 360,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Total Product:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${cart.productCount()}",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DashedRow(), // Ganti dengan DashedRow yang benar
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total Harga:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Rp-${cart.totalPrice().toStringAsFixed(3)}", // Ganti dengan metode totalPrice() yang sesuai
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildCartItem(Product product, Cart cart, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: _buildProductImage(product),
            title: Text(product.nama),
            subtitle: Text('\Rp${product.price.toStringAsFixed(3)}'),
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                tooltip: 'Hapus produk',
                onPressed: () {
                  cart.remove(product);
                  ElegantNotification.error(
                    width: 360,
                    isDismissable: true,
                    animationCurve: Curves.easeOut,
                    position: Alignment.topCenter,
                    animation: AnimationType.fromTop,
                    title: const Text('Delete'),
                    description: Text("${product.nama} dihapus."),
                    shadow: BoxShadow(
                      color: Colors.green.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ).show(context);
                },
              ),
            ),
          ),
          DashedRow(),
        ],
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: product.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Image.asset(product.image),
      ),
    );
  }

  Widget? _buildBottomNavigationBar(BuildContext context, Cart cart) {
    if (cart.items.isEmpty) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          final productNames =
              cart.items.map((product) => product.nama).join(", ");
          final snackBarMessage = "Produk: $productNames\n"
              "Jumlah Produk: ${cart.productCount()}\n"
              "Total Harga: \Rp${cart.totalPrice().toStringAsFixed(3)}";

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(snackBarMessage),
              duration: const Duration(seconds: 5),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          'BAYAR SEKARANG',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  final Function(int) onCountChanged;

  const CartCounter(
      {super.key, required this.onCountChanged, required int initialCount});

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 32,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                    widget.onCountChanged(numOfItems);
                    print("Jumlah produk di keranjang: $numOfItems");
                  });
                }
              },
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
            child: Text(
              numOfItems.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.titleLarge,
              selectionColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 40,
            height: 32,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {
                setState(() {
                  numOfItems++;
                  widget.onCountChanged(numOfItems);
                  print("Jumlah produk di keranjang: $numOfItems");
                });
              },
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
