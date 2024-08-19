import 'package:dijitaleller/Kategoriler/Zaman/Carsamba.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Cuma.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Cumartesi.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Pazar.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Pazartesi.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Persembe.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Sali.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dijitaleller/HomePage.dart';

// Diğer importlar...

class ZamanKategorisi extends StatefulWidget {
  const ZamanKategorisi({super.key});

  @override
  _ZamanKategorisiState createState() => _ZamanKategorisiState();
}

class _ZamanKategorisiState extends State<ZamanKategorisi> {
  final List<String> sayfaListesi = [
    "Pazartesi",
    "Salı",
    "Çarşamba",
    "Perşembe",
    "Cuma",
    "Cumartesi",
    "Pazar",
    "Sabah",
    "Öğlen",
    "Akşam",
    "Gece",
    "Kış",
    "İlkbahar",
    "Sonbahar",
    "Yaz",
    "Gün",
    "Hafta",
    "Yıl",
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
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
            'Zamanlar',
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
                  color: HexColor("#ff6361"),
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
      case 'Pazartesi':
        return const Pazartesi();
      case "Salı":
        return const Sali();
      case "Çarşamba":
        return const Carsamba();
      case "Perşembe":
        return const Persembe();
      case "Cuma":
        return const Cuma();
      case "Cumartesi":
        return const Cumartesi();
      case "Pazar":
        return const Pazar();
      default:
        return const HomePage();
    }
  }
}
