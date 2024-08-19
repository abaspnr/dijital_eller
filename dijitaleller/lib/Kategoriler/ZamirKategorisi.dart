import 'package:dijitaleller/Kategoriler/Zamirler/Bana.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Biz.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Bize.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Bizim.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/O.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Ona.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Onlar%C3%A7n.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Onlar.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Onlara.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Onun.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Sana.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Sen.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Senin.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Siz.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Size.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Sizin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dijitaleller/HomePage.dart';

// Diğer importlar...

class ZamirKategorisi extends StatefulWidget {
  const ZamirKategorisi({super.key});

  @override
  _ZamirKategorisiState createState() => _ZamirKategorisiState();
}

class _ZamirKategorisiState extends State<ZamirKategorisi> {
  final List<String> sayfaListesi = [
    "Bana",
    "Ben",
    "Benim",
    "Biz",
    "Bize",
    "Bizim",
    "Sana",
    "Sen",
    "Senin",
    "Siz",
    "Size",
    "Sizin",
    "O",
    "Ona",
    "Onlar",
    "Onlara",
    "Onların",
    "Onun",
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
            'Zamirler',
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
      case 'Bana':
        return const Bana();
      case "Ben":
        return const Bana();
      case "Benim":
        return const Bana();
      case "Biz":
        return const Biz();
      case "Bize":
        return const Bize();
      case "Bizim":
        return const Bizim();
      case "Sana":
        return const Sana();
      case "Sen":
        return const Sen();
      case "Senin":
        return const Senin();
      case "Siz":
        return const Siz();
      case "Size":
        return const Sizee();
      case "Sizin":
        return const Sizin();
      case "O":
        return const O();
      case "Ona":
        return const Ona();
      case "Onlar":
        return const Onlar();
      case "Onlara":
        return const Onlara();
      case "Onların":
        return const Onlarin();
      case "Onun":
        return const Onun();

      default:
        return const HomePage();
    }
  }
}
