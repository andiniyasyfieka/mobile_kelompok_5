import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/ticket.dart';
import 'package:karang_aqua_palette/wisatapage.dart'; // Tambahkan halaman Riwayat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konfirmasi Pembayaran',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TransaksiPage(),
    );
  }
}

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  String selectedPaymentMethod = 'QRIS'; // Default metode pembayaran
  int selectedPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigasi kembali ke halaman Ticket
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Ticket()),
            );
          },
        ),
        title: const Text(
          'Konfirmasi Pesanan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 111, 209, 255),
              Color.fromARGB(255, 32, 184, 255),
              Color.fromARGB(255, 0, 162, 236),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            _buildOrderCard(),
            _buildPayButton(context), // Pass context to the pay button
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTicketRow(),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            _buildPaymentMethod(
              icon: Icons.qr_code,
              label: 'QRIS',
              isSelected: selectedPaymentMethod == 'QRIS',
              onTap: () => _selectPaymentMethod('QRIS'),
            ),
            const SizedBox(height: 20),
            _buildPaymentMethod(
              icon: Icons.account_balance,
              label: 'Bank',
              isSelected: selectedPaymentMethod == 'Bank',
              onTap: () => _selectPaymentMethod('Bank'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.confirmation_num_outlined, size: 50),
            SizedBox(width: 8),
            Text(
              'Tiket Masuk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TransaksiPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Buy'),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const Spacer(),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Navigasi ke halaman Riwayat setelah menekan tombol bayar
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WisataPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Warna latar tombol
          padding: const EdgeInsets.symmetric(
              vertical: 16), // Padding atas dan bawah
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Sudut tombol melingkar
            side: const BorderSide(
              color: Colors.black, // Warna border hitam
              width: 2, // Ketebalan border
            ),
          ),
          elevation: 0, // Tidak ada efek bayangan agar border terlihat penuh
        ),
        child: const Center(
          child: Text(
            'Bayar Rp. 15.000',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black, // Warna teks
              fontWeight: FontWeight.bold, // Teks tebal
            ),
          ),
        ),
      ),
    );
  }

  void _selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }
}
