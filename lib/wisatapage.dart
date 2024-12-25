import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/ticket.dart';
import 'package:karang_aqua_palette/transaksi_page.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({super.key});

  @override
  State<WisataPage> createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  int _currentIndex = 0; // Menyimpan indeks navigasi bawah yang dipilih
  int _selectedTab = 0; // Menyimpan tab (Wahana/Fasilitas) yang dipilih

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      // Navigasi ke halaman Ticket
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Ticket()),
      );
    }
  }

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
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
              _buildTabBar(), // Tab bar untuk memilih Wahana/Fasilitas
              const SizedBox(height: 20),
              _buildContent(), // Konten berdasarkan tab yang dipilih
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

  // Tab bar untuk memilih Wahana atau Fasilitas
  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabButton("Wahana", 0),
        const SizedBox(width: 10),
        _buildTabButton("Fasilitas", 1),
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => _changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Konten berdasarkan tab yang dipilih
  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child:
          _selectedTab == 0 ? _buildWahanaContent() : _buildFasilitasContent(),
    );
  }

  // Konten untuk tab Wahana
  Widget _buildWahanaContent() {
    final List<Map<String, String>> wahanaList = [
      {
        "title": "ATV Track",
        "description":
            "Wahana ini cocok bagi mereka yang mencari sensasi petualangan, dengan pemandangan alam yang indah, termasuk pantai dan kawasan hijau sekitar.",
        "image": "th.jpeg",
        "price": "Rp. 50.000"
      },
      {
        "title": "Balon Udara Mini",
        "description":
            "Balon ini menjadi salah satu daya tarik utama bagi wisatawan yang ingin mengabadikan momen dengan latar belakang yang estetis.",
        "image": "balon.jpeg",
        "price": "Rp. 20.000"
      },
      {
        "title": "Kids Park",
        "description":
            "Area bermain khusus untuk anak-anak yang sudah termasuk dalam tiket masuk utama ke lokasi.",
        "image": "kids.jpg",
        "price": "Rp. 0"
      },
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: wahanaList.length,
      itemBuilder: (context, index) {
        final wahana = wahanaList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wahana["title"]!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(wahana["image"]!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      wahana["description"]!,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    wahana["price"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman Riwayat setelah menekan tombol bayar
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransaksiPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Buy"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Konten untuk tab Fasilitas
  Widget _buildFasilitasContent() {
    final List<Map<String, String>> fasilitasList = [
      {
        "title": "Spot Selfie Instagramable",
        "description":
            "Spot-spot seperti ini mencakup replika bangunan unik (misalnya Santorini), dan pemandangan pantai yang indah.",
        "image": "foto.jpg",
      },
      {
        "title": "Mushola",
        "description":
            "Mushola disediakan untuk memudahkan pengunjung yang ingin beribadah tanpa harus meninggalkan lokasi wisata.",
        "image": "Mushola.jpeg",
      },
      {
        "title": "Area Parkir",
        "description":
            "area parkir cukup luas untuk menampung kendaraan dari berbagai jenis, mengingat tempat ini sering dikunjungi oleh wisatawan dalam jumlah besar.",
        "image": "parkir.jpeg",
      },
      {
        "title": "Toilet",
        "description":
            "toilet menjadi fasilitas penting untuk mendukung kenyamanan pengunjung selama berada di lokasi.",
        "image": "toilet.jpg",
      }
    ];

    return Column(
      children: fasilitasList.map((fasilitas) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fasilitas["title"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      fasilitas["description"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  fasilitas["image"]!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Navigasi bawah
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
