
//Widget _buildCarousel() {
//  final List<String> imageUrls = [
//    'assets/images/iklan3.png',
//    'assets/images/iklan2.png',
//    'assets/images/iklan.jpg',
//  ];

//  return CarouselSlider(
//    options: CarouselOptions(
//        height: 150,
//        autoPlay: true,
//        enlargeCenterPage: true,
//        autoPlayAnimationDuration: const Duration(milliseconds: 20)),
//    items: imageUrls.map((imageUrl) {
//      return GestureDetector(
//        onTap: () {
//          // Tambahkan aksi saat gambar disentuh, seperti navigasi atau dialog
//          print("Gambar disentuh: $imageUrl");
//        },
//        child: Stack(
//          children: [
//            ClipRRect(
//              borderRadius: BorderRadius.circular(10),
//              child: Image.asset(
//                imageUrl,
//                fit: BoxFit.cover,
//                width: double.infinity,
//              ),
//            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: Container(
//                width: double.infinity,
//                padding: const EdgeInsets.all(10),
//                decoration: BoxDecoration(
//                  color: Colors.black.withOpacity(0.6),
//                  borderRadius: const BorderRadius.only(
//                    bottomLeft: Radius.circular(10),
//                    bottomRight: Radius.circular(10),
//                  ),
//                ),
//                child: const Text(
//                  "Promo Spesial",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                    fontSize: 16,
//                  ),
//                ),
//              ),
//            ),
//          ],
//        ),
//      );
//    }).toList(),
//  );
//}
