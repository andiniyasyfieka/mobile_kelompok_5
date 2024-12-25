import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/transaksi_page.dart';
import 'package:karang_aqua_palette/wisatapage.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int _currentIndex = 1; // Menyimpan indeks navigasi bawah yang dipilih
  int selectedPrice = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WisataPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(), // Bagian header
              const SizedBox(height: 20),
              _buildTicketSection(), // Bagian konten tiket
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Navigasi bawah
    );
  }

  // Bagian header dengan gambar dan teks
  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 111, 209, 255),
                Color.fromARGB(255, 32, 184, 255),
                Color.fromARGB(255, 0, 162, 236),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 20, // Posisi teks di kiri
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hi, Ocean View!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('karpot.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 54, 67, 253),
                    width: 3,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Bagian konten tiket
  Widget _buildTicketSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildTicketCard(
            title: 'Tiket Masuk',
            subtitle: 'Weekday',
            price: 'Rp. 15.000 /Orang',
            buttonText: 'Buy',
            priceValue: 15000, // Tambahkan harga value untuk Weekday
          ),
          const SizedBox(height: 16),
          _buildTicketCard(
            title: 'Tiket Masuk',
            subtitle: 'Weekend',
            price: 'Rp. 20.000 /Orang',
            buttonText: 'Buy',
            priceValue: 20000, // Tambahkan harga value untuk Weekend
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard({
    required String title,
    required String subtitle,
    required String price,
    required String buttonText,
    required int priceValue,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.confirmation_num_outlined,
                size: 40,
                color: Colors.black87,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedPrice = priceValue; // Update harga yang dipilih
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TransaksiPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
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
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Ticket"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: "Culinary"),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review), label: "Review"),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
