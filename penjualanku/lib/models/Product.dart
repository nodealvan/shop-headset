import 'package:flutter/material.dart';

// Dummy text untuk deskripsi produk
String dummyText =
    "Produk lokal Indonesia untuk perlengkapan gaming, aksesoris, mobile, kantor (baik komputer dan gadget)"
    "serta card reader dan capture card.Kami menyediakan pilihan produk terbaik yang stylish, modern, elegan, dan inovatif."
    "Hal ini didukung dengan berbagai informasi terkait tips dan review produk yang insightful";

// Definisi kelas Product
class Product {
  final int id;
  final String image;
  final String title;
  final String description;
  late final int price;
  final int size;
  final Color color;
  final String nama;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.color,
    required this.nama,
  });
}

// Daftar produk dengan penambahan nama
List<Product> products = [
  Product(
    id: 1,
    title: "Premium",
    nama: "ROG Cetra G90j",
    price: 745,
    size: 12,
    description: dummyText,
    image: "assets/images/premium1.png",
    color: const Color.fromARGB(255, 225, 18, 32),
  ),
  Product(
    id: 2,
    title: "Premium",
    nama: "Razer Hammerhead K339",
    price: 685,
    size: 8,
    description: dummyText,
    image: "assets/images/premium2.png",
    color: const Color.fromARGB(255, 210, 49, 116),
  ),
  Product(
    id: 3,
    title: "Premium",
    nama: "Turtle Beach Battle 2L66",
    price: 540,
    size: 10,
    description: dummyText,
    image: "assets/images/premium3.png",
    color: const Color.fromARGB(255, 18, 225, 135),
  ),
  Product(
    id: 4,
    title: "Premium",
    nama: "Roccat Syva Pro G688",
    price: 650,
    size: 11,
    description: dummyText,
    image: "assets/images/premium4.png",
    color: const Color.fromARGB(255, 219, 82, 3),
  ),
  Product(
    id: 5,
    title: "Premium",
    nama: "HyperX Cloud Bust 77",
    price: 880,
    size: 10,
    description: dummyText,
    image: "assets/images/premium5.png",
    color: const Color.fromARGB(255, 35, 167, 237),
  ),
  Product(
    id: 6,
    title: "Premium",
    nama: "Cooler Master MH710",
    price: 420,
    size: 10,
    description: dummyText,
    image: "assets/images/premium6.png",
    color: const Color.fromARGB(255, 222, 119, 9),
  ),
  Product(
    id: 7,
    title: "Premium",
    nama: "Sony MDR-XB55AP",
    price: 415,
    size: 10,
    description: dummyText,
    image: "assets/images/premium7.png",
    color: const Color.fromARGB(255, 117, 69, 25),
  ),
  Product(
    id: 8,
    title: "Honor",
    nama: "dbE GE200",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/honor1.png",
    color: const Color.fromARGB(255, 209, 213, 214),
  ),
  Product(
    id: 9,
    title: "Honor",
    nama: "Plextone DX6",
    price: 275,
    size: 12,
    description: dummyText,
    image: "assets/images/honor2.png",
    color: const Color.fromARGB(221, 65, 94, 167),
  ),
  Product(
    id: 11,
    title: "Beginner",
    nama: "Razer Hammerhead X77j",
    price: 187,
    size: 12,
    description: dummyText,
    image: "assets/images/beginer1.png",
    color: const Color.fromARGB(255, 117, 69, 25),
  ),
  Product(
    id: 12,
    title: "Beginner",
    nama: "Plextone DX6 Blazing",
    price: 260,
    size: 12,
    description: dummyText,
    image: "assets/images/beginer2.png",
    color: const Color.fromARGB(255, 182, 20, 17),
  ),
  Product(
    id: 13,
    title: "Beginner",
    nama: "Rexus ME-4",
    price: 202,
    size: 12,
    description: dummyText,
    image: "assets/images/beginer3.png",
    color: const Color.fromARGB(255, 142, 126, 75),
  ),
];

// Memeriksa daftar produk untuk memastikan setiap produk memiliki nama
void main() {
  // Perulangan untuk menampilkan informasi produk
  for (var product in products) {
    print("Product ID: ${product.id}, Nama: ${product.nama}");
  }
}
