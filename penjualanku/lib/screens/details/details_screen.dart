import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:penjualanku/constants.dart';
import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart' as cart_divider;
import 'package:penjualanku/screens/details/components/add_to_cart.dart';
import 'package:penjualanku/screens/details/components/description.dart';
import 'package:penjualanku/screens/details/components/product_title_with_image.dart';

import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  final Function(int) onCountChanged;
  final Function(bool) onFavoriteToggled;

  const DetailsScreen({
    super.key,
    required this.product,
    required this.onCountChanged,
    required this.onFavoriteToggled,
  });

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<cart_divider.Cart>(context);
    final cart = Provider.of<cart_divider.Cart>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  left: kDefaultPaddin,
                  right: kDefaultPaddin,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // ColorAndSize(product: product),
                    const SizedBox(height: kDefaultPaddin / 1),
                    Description(product: product),
                    const SizedBox(height: kDefaultPaddin / 1),
                    AddToCart(
                      product: product,
                      onAddToCart: () {
                        cart.add(product);
                        ElegantNotification.success(
                          width: 360,
                          isDismissable: true,
                          animationCurve: Curves.easeOut,
                          position: Alignment.topCenter,
                          animation: AnimationType.fromTop,
                          title: const Text('Sukses'),
                          description:
                              Text("${product.nama} ditambahkan ke keranjang"),
                          shadow: BoxShadow(
                            color: Colors.green.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ).show(context);
                      },
                      onBuyNow: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content:
                                Text('Melanjutkan pembelian ${product.nama}'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ProductTitleWithImage(
                product: product,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
