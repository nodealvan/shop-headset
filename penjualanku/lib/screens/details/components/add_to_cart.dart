import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penjualanku/constants.dart';
import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart' as cart_divider;

import 'package:penjualanku/screens/details/components/cart_screen.dart';

import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart;
  final VoidCallback? onBuyNow;

  const AddToCart({
    super.key,
    required this.product,
    this.onAddToCart,
    this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cart_divider.Cart>(context);
    int count = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        children: [
          CartCounter(
            initialCount: count,
            onCountChanged: (int newCount) {
              count = newCount;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Tooltip(
                  message: 'Tambah ke Keranjang',
                  child: Container(
                    margin: const EdgeInsets.only(right: kDefaultPaddin),
                    height: 50,
                    width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: product.color,
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/add_to_cart.svg",
                        colorFilter: ColorFilter.mode(
                          product.color,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () {
                        for (int i = 0; i < count; i++) {
                          cart.add(product);
                        }
                        ElegantNotification.success(
                          width: 360,
                          isDismissable: true,
                          animationCurve: Curves.easeOut,
                          position: Alignment.topCenter,
                          animation: AnimationType.fromTop,
                          title: const Text('Sukses'),
                          description: Text('${product.nama} ditambahkan'),
                          onNotificationPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ),
                            );
                          },
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (onBuyNow != null) {
                        onBuyNow!();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Proses pembelian $count x ${product.nama}',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: product.color,
                    ),
                    child: Text(
                      "Beli Sekarang".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
