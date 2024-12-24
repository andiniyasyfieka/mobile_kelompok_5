import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/wisatapage.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int _currentIndex = 1; // Menyimpan indeks navigasi bawah yang dipilih

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
              const SizedBox(height: 20), // Konten berdasarkan tab yang dipilih
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

  // Widget BottomNavigationBar dengan gradasi
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Ticket",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Culinary",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: "Review",
          ),
        ],
        backgroundColor:
            Colors.transparent, // Membuat latar belakang transparan
        selectedItemColor: Colors.white, // Warna ikon dan teks aktif
        unselectedItemColor: Colors.white70, // Warna ikon dan teks tidak aktif
        type: BottomNavigationBarType.fixed, // Ukuran tetap
      ),
    );
  }
}
