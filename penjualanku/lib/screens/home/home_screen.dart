import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penjualanku/constants.dart';
import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart' as cart_divider;
import 'package:penjualanku/screens/details/components/cart_screen.dart';
import 'package:penjualanku/screens/details/details_screen.dart';
import 'package:penjualanku/screens/home/SearchBar.dart';
import 'package:penjualanku/screens/home/barcode.dart';
import 'package:penjualanku/screens/home/components/item_card.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  List<Product> _getFilteredProducts(String category) {
    return category == "All"
        ? products
        : products.where((product) => product.title == category).toList();
  }

  void _addProductToCart(Product product) {
    final cart = Provider.of<cart_divider.Cart>(context, listen: false);
    cart.add(product);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cart_divider.Cart>(context);
    final List<Product> filteredProducts =
        _getFilteredProducts(selectedCategory);

    return Scaffold(
      appBar: _buildAppBar(context, cart),
      body: _buildBody(context, filteredProducts),
    );
  }

  AppBar _buildAppBar(BuildContext context, cart_divider.Cart cart) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    colorFilter:
                        const ColorFilter.mode(kTextColor, BlendMode.srcIn),
                  ),
                ),
                if (cart.productCount() > 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cart.productCount()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, List<Product> filteredProducts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryTitle(context),
        const SizedBox(
          height: 20,
        ),
        _Menu(context),
        const SizedBox(
          height: 20,
        ),
        //SearchProduct(),
        Center(child: StylishSearchBar()),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            _buildCategoryContainer(context, "All"),
            _buildCategoryContainer(context, "Premium"),
            _buildCategoryContainer(context, "Honor"),
            _buildCategoryContainer(context, "Beginner"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: filteredProducts[index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: filteredProducts[index],
                        onCountChanged: (int count) {
                          _addProductToCart(filteredProducts[index]);
                        },
                        onFavoriteToggled: (bool isFavorite) {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryContainer(BuildContext context, String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        width: 80,
        height: 40,
        alignment: Alignment.center,
        
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Widget _buildCategoryTitle(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text(
          "Flutter company",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "shade",
                fontSize: 35,
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text(
          "Gaming Earphones",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "Aovel"),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

Widget _Menu(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]),
                child: const Icon(
                  Icons.bubble_chart_rounded,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Tentang')
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Barcode()));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(2, 2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ]),
                  child: const Icon(
                    Icons.barcode_reader,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Scan')
            ],
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]),
                child: const Icon(
                  Icons.discount,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Discount')
            ],
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]),
                child: const Icon(Icons.location_on),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Location')
            ],
          )
        ],
      )
    ],
  );
}
