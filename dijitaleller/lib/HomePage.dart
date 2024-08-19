import 'package:dijitaleller/Kategoriler/AlfabeKategorisi.dart';
import 'package:dijitaleller/Kategoriler/RenkKategorisi.dart';
import 'package:dijitaleller/Kategoriler/SayiKategorisi.dart';
import 'package:dijitaleller/Kategoriler/ZamanKategorisi.dart';
import 'package:dijitaleller/Kategoriler/ZamirKategorisi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:dijitaleller/services/gif_service.dart'; // GifService sınıfını ekleyin

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _preloadGifs();
  }

  void _preloadGifs() {
    final gifService = GifService();
    gifService
        .downloadGifs(); // GIF'leri indirip Hive'a kaydetme işlemini başlat
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Dijital Eller\'e Hoşgeldin',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox(
                  //   width: screenWidth * 0.05,
                  // ),
                  SizedBox(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.1,
                    child: Image.asset(
                      "assets/dijitaleller_logo.png",
                      color:
                          Colors.white, // Görüntü rengini beyaz olarak ayarlar
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("1. kutu");
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 400),
                                pageBuilder: (_, __, ___) =>
                                    const AlfabeKategorisi(),
                                transitionsBuilder: (_, animation, __, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );

                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#ffa600"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/alfabe2.png",
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Alfabe",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("2. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SayiKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#ff8531"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/sayilar2.png",
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Sayılar",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("3. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ZamirKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#ff6361"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/zamirler.png",
                                    width: 100,
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Zamirler",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("4. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RenkKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#de5a79"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/renkler2.png",
                                    fit: BoxFit.fill,
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Renkler",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("5. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ZamanKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#bc5090"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/zaman2.png",
                                    fit: BoxFit.fill,
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Zaman",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("6. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AlfabeKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#8a508f"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/hayvanlar2.png",
                                    fit: BoxFit.contain,
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Hayvanlar",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("5. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AlfabeKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#58508d"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/deyimler2.png",
                                    fit: BoxFit.fill,
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Deyimler",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("6. kutu");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AlfabeKategorisi()));
                            // İlk kutuya tıklandığında yapılacak işlemler
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.03,
                            ),
                            child: Container(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.21,
                              decoration: BoxDecoration(
                                color: HexColor("#003f5c"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/aile2.png",
                                    fit: BoxFit.contain,
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(height: 10), // Boşluk ekledim
                                  Text(
                                    "Aile",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
