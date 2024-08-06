import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class Barcode extends StatefulWidget {
  
  const Barcode({super.key});

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String result = ''; 
  bool isScanning = false; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isScanning)
        _startScanning(); 
    });
  }

  @override
  void dispose() {
    isScanning = false; 
    super.dispose();
  }

  Future<void> _startScanning() async {
    if (isScanning) return; // Hindari pemindaian ganda

    isScanning = true;

    try {
      var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ),
      );

      if (mounted) {

        setState(() {
          if (res is String && res.isNotEmpty && res != "-1") {
            result = res; // Pemindaian berhasil
          } else {
            result =
                'Pemindaian tidak menghasilkan data'; // Jika pemindaian gagal
          }
        });
      }
    } catch (e) {
      if (mounted) {
        // Memastikan widget masih dalam tree
        setState(() {
          result = 'Terjadi kesalahan saat pemindaian'; // Menangani kesalahan
        });
      }
    }

    isScanning = false; // Pemindaian selesai
  }

  Widget _buildScanButton() {
    return GestureDetector(
      onTap: _startScanning,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            // Gunakan Card untuk tampilan lebih baik
            child: SizedBox(
              height: 180,
              width: 200,
              child: Image.asset('assets/images/scan.png', fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 30,
            width: 150,
            color: Colors.white
                .withOpacity(0.7), // Transparansi untuk kesan modern
            child: const Center(
              child: Text(
                'Ketuk untuk scan',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 2,
              child: SizedBox(
                height: 240,
                width: 240,
                child: SfBarcodeGenerator(
                  value:
                      'https://github.com/nodealvan/website-ku', // Contoh QR code
                  symbology: QRCode(),
                  showValue: true,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mohon untuk mendekatkan kamera ke barcode'),
                Text('Agar mendapatkan hasil yang baik'),
              ],
            ),
            const SizedBox(height: 20),
            _buildScanButton(), // Menggunakan komponen yang konsisten
            if (result.isNotEmpty) ...[
              const SizedBox(height: 10),
              const Text('Hasil Barcode:'),
              Text(result),
            ],
          ],
        ),
      ),
    );
  }
}
