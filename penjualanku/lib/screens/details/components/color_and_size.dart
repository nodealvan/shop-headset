// import 'package:flutter/material.dart';
// import 'package:marketing/models/Product.dart';

// // Pemetaan antara label dan ukuran teks
// const Map<String, double> textSizeMap = {
//   'M': 12,
//   'L': 14,
//   'XL': 16,
// };

// class ColorAndSize extends StatefulWidget {
//   final Product product;

//   const ColorAndSize({Key? key, required this.product}) : super(key: key);

//   @override
//   _ColorAndSizeState createState() => _ColorAndSizeState();
// }

// class _ColorAndSizeState extends State<ColorAndSize> {
//   String selectedLabel = 'L'; // Ukuran teks default yang dipilih (label)
//   double selectedSize =
//       textSizeMap['L']!; // Ukuran teks berdasarkan label yang dipilih

//   void _updateTextSize(String newLabel) {
//     setState(() {
//       selectedLabel = newLabel; // Memperbarui label ukuran yang dipilih
//       selectedSize =
//           textSizeMap[newLabel]!; // Ukuran teks yang sesuai dengan label
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 1,
//           child:
//               _buildTextSizeOptions(), // Memisahkan fungsi untuk menampilkan opsi
//         ),
//         const SizedBox(width: 50),
//         Expanded(
//           flex: 1,
//           child:
//               _buildSelectedSizeDisplay(), // Memisahkan fungsi untuk tampilan ukuran teks yang dipilih
//         ),
//       ],
//     );
//   }

//   Widget _buildTextSizeOptions() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Size"), // Label untuk bagian ukuran teks
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment
//               .spaceAround, // Mendistribusikan opsi secara merata
//           children: textSizeMap.keys.map((label) {
//             bool isSelected =
//                 selectedLabel == label; // Status apakah opsi ini dipilih
//             return GestureDetector(
//               onTap: () =>
//                   _updateTextSize(label), // Memperbarui status saat opsi di-tap
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: isSelected
//                       ? const Color.fromARGB(255, 109, 111, 111)
//                       : Colors.white, // Warna latar belakang berdasarkan status
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black,
//                       spreadRadius: 0.5,
//                       blurRadius: 0.3,
//                       blurStyle: BlurStyle.inner,
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(10),
//                 child: Center(
//                   child: _TextSizeOption(
//                     label: label,
//                     isSelected: isSelected,
//                     onTap: () => _updateTextSize(label),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildSelectedSizeDisplay() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30, left: 10),
//       child: Row(
//         children: [
//           RichText(
//             text: TextSpan(
//               style: const TextStyle(color: Colors.black),
//               children: [
//                 TextSpan(
//                   text:
//                       "$selectedLabel", // Label dan ukuran yang dipilih
//                   style: TextStyle(
//                     fontSize: selectedSize,
//                     fontWeight: FontWeight.bold,
//                     color:
//                         Colors.black, // Pastikan warna teks tetap merah saat di-tap
//                   ),
//                 ),
               
//               ],
//             ),
//           ),
//           Container(child: Text('$selectedSize'))
//           //  TextSpan(
//           //     text: "$selectedSize pt"
//           //   )
//         ],
//       ),
//     );
//   }
// }

// class _TextSizeOption extends StatelessWidget {
//   final String label; // Label ukuran teks
//   final bool isSelected; // Apakah opsi ini sedang dipilih
//   final VoidCallback onTap; // Callback untuk penanganan tap

//   const _TextSizeOption({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Callback ketika opsi di-tap
//       child: Text(
//         label, // Menampilkan label ukuran teks
//         style: TextStyle(
//           fontSize: textSizeMap[label], // Ukuran teks berdasarkan label
//           fontWeight: isSelected
//               ? FontWeight.bold
//               : FontWeight.normal, // Menandai pilihan
//           color: isSelected
//               ? Colors.white
//               : Colors.teal, // Ubah warna menjadi merah saat dipilih
//         ),
//       ),
//     );
//   }
// }
