import 'package:flutter/material.dart';
import 'package:penjualanku/models/Product.dart';
import 'package:penjualanku/screens/details/cart_notifier.dart' as cart_divider;
import 'package:penjualanku/screens/details/components/cart_screen.dart';
import 'package:penjualanku/screens/details/details_screen.dart';
import 'package:penjualanku/screens/home/build_category.dart';
import 'package:penjualanku/screens/home/navigasi.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => cart_divider.Cart()), 
      ],
      child: MaterialApp(
        title: 'Marketing App',
        theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 1,
          ),
        ),
        initialRoute: '/TestScreen',
        routes: {
          '/': (context) => const Navigasi(),
          '/cart': (context) => const CartScreen(),
          '/TestScreen': (context) => TestScreen(),
          '/details': (context) => DetailsScreen(
                product: ModalRoute.of(context)!.settings.arguments as Product,
                onCountChanged: (int count) {},
                onFavoriteToggled: (bool isFavorite) {},
              ),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
