import 'package:dijitaleller/Kategoriler/Alfabe/%C3%B22Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/C2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/CHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/DHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/EHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/FHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/G2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/GHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/HHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/IHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/JHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/KHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/LHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/MHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/NHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/O2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/OHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/PHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/Rharfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/S2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/SHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/THarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/U2HArfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/UHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/VHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/YHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/ZHarfi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dijitaleller/HomePage.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/AHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/BHarfi.dart';
// Diğer importlar...

class AlfabeKategorisi extends StatefulWidget {
  const AlfabeKategorisi({super.key});

  @override
  _AlfabeKategorisiState createState() => _AlfabeKategorisiState();
}

class _AlfabeKategorisiState extends State<AlfabeKategorisi> {
  final List<String> sayfaListesi = [
    'A',
    'B',
    'C',
    'Ç',
    'D',
    'E',
    'F',
    'G',
    'Ğ',
    'H',
    'I',
    'İ',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'Ö',
    'P',
    'R',
    'S',
    'Ş',
    'T',
    'U',
    'Ü',
    'V',
    'Y',
    'Z',
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
            'Alfabe',
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
                  color: HexColor("#ffa600"),
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
      case 'A':
        return const AHarfi();
      case 'B':
        return const BHarfi();
      case 'C':
        return const CHarfi();
      case "Ç":
        return const C2Harfi();
      case 'D':
        return const DHarfi();
      case 'E':
        return const EHarfi();
      case 'F':
        return const FHarfi();
      case 'G':
        return const GHarfi();
      case 'Ğ':
        return const G2Harfi();
      case 'H':
        return const HHarfi();
      case 'İ':
        return const iHarfi();
      case 'I':
        return const i2Harfi();
      case 'J':
        return const JHarfi();
      case 'K':
        return const KHarfi();
      case 'L':
        return const LHarfi();
      case 'M':
        return const MHarfi();
      case 'N':
        return const NHarfi();
      case 'O':
        return const OHarfi();
      case 'Ö':
        return const O2Harfi();
      case 'P':
        return const PHarfi();
      case 'R':
        return const RHarfi();
      case 'S':
        return const SHarfi();
      case 'Ş':
        return const S2Harfi();
      case 'T':
        return const THarfi();
      case 'U':
        return const UHarfi();
      case 'Ü':
        return const U2Harfi();
      case 'V':
        return const VHarfi();
      case 'Y':
        return const YHarfi();
      case 'Z':
        return const ZHarfi();
      default:
        return const HomePage();
    }
  }
}
