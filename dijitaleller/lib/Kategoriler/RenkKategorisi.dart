import 'package:dijitaleller/Kategoriler/Renkler/Beyaz.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Gri.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Kahverengi.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Kirmizi.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Lacivert.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Mavi.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Mor.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Sari.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Siyah.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Turuncu.dart';
import 'package:dijitaleller/Kategoriler/Renkler/Yesil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dijitaleller/HomePage.dart';

// Diğer importlar...

class RenkKategorisi extends StatefulWidget {
  const RenkKategorisi({super.key});

  @override
  _RenkKategorisiState createState() => _RenkKategorisiState();
}

class _RenkKategorisiState extends State<RenkKategorisi> {
  final List<String> sayfaListesi = [
    "Beyaz",
    "Gri",
    "Kahverengi",
    "Kırmızı",
    "Lacivert",
    "Mavi",
    "Mor",
    "Sarı",
    "Siyah",
    "Turuncu",
    "Yeşil"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Geri tuşuna basıldığında gitmek istediğin sayfayı buraya ekle
        Navigator.popUntil(context, (route) => route.isFirst);
        return false; // true dönerse pop işlemini gerçekleştirmeye devam eder
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: HexColor("#D8097E"),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          title: Text(
            'Renkler',
            style: GoogleFonts.montserrat(
              color: HexColor("#D8097E"),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GridView.builder(
          itemCount: sayfaListesi.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) => getPage(sayfaListesi[index]),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: HexColor("#FF9E80"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    sayfaListesi[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getPage(String harf) {
    switch (harf) {
      case "Beyaz":
        return const Beyaz();
      case "Gri":
        return const Gri();
      case "Kahverengi":
        return const Kahverengi();
      case "Kırmızı":
        return const Kirmizi();
      case "Lacivert":
        return const Lacivert();
      case "Mavi":
        return const Mavi();
      case "Mor":
        return const Mor();
      case "Sarı":
        return const Sari();
      case "Siyah":
        return const Siyah();
      case "Turuncu":
        return const Turuncu();
      case "Yesil":
        return const Yesil();

      default:
        return const HomePage();
    }
  }
}
