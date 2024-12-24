import 'package:flutter/material.dart';
import 'package:karang_aqua_palette/wisatapage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 111, 209, 255),
            Color.fromARGB(255, 32, 184, 255),
            Color.fromARGB(255, 0, 162, 236)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Mengatur jarak antara teks dan tombol
          children: [
            const SizedBox(height: 100), // Jarak dari atas layar
            Column(
              children: [
                const Text(
                  'Karang',
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 7, 7),
                    fontFamily: 'YourFont',
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                    height:
                        8), 
                Text(
                  'Aqua Palette',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(
                height:
                    40), 
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WisataPage()), 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Icon(Icons.arrow_forward, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
