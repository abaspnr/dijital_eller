import 'package:dijitaleller/Kategoriler/Sayilar/1.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/10.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/100.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/1000.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/11.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/12.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/13.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/14.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/15.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/16.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/17.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/18.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/19.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/2.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/20.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/200.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/3.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/30.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/300.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/4.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/40.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/400.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/5.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/50.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/500.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/6.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/60.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/600.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/7.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/70.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/700.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/8.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/80.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/800.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/9.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/90.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/900.dart';
import 'package:dijitaleller/Kategoriler/Sayilar/million.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:dijitaleller/HomePage.dart';

// Diğer importlar...

class SayiKategorisi extends StatefulWidget {
  const SayiKategorisi({super.key});

  @override
  _SayiKategorisiState createState() => _SayiKategorisiState();
}

class _SayiKategorisiState extends State<SayiKategorisi> {
  final List<String> sayfaListesi = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '8',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '17',
    '18',
    '19',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
    "200",
    "300",
    "400",
    "500",
    "600",
    "700",
    "800",
    "900",
    "1.000",
    "1.000.000"
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
            'Sayılar',
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
      case '1':
        return const Bir();
      case "2":
        return const Iki();
      case "3":
        return const Uc();
      case "4":
        return const Dort();
      case "5":
        return const Bes();
      case "6":
        return const Alti();
      case "7":
        return const Yedi();
      case "8":
        return const Sekiz();
      case "9":
        return const Dokuz();
      case "10":
        return const On();
      case "11":
        return const OnBir();
      case "12":
        return const OnIki();
      case "13":
        return const OnUc();
      case "14":
        return const OnDort();
      case "15":
        return const OnBes();
      case "16":
        return const OnAlti();
      case "17":
        return const OnYedi();
      case "18":
        return const OnSekiz();
      case "19":
        return const OnDokuz();
      case "20":
        return const Yirmi();
      case "30":
        return const Otuz();
      case "40":
        return const Kirk();
      case "50":
        return const Elli();
      case "60":
        return const Altmis();
      case "70":
        return const Yetmis();
      case "80":
        return const Seksen();
      case "90":
        return const Doksan();
      case "100":
        return const Yuz();
      case "200":
        return const IkiYuz();
      case "300":
        return const UcYuz();
      case "400":
        return const DortYuz();
      case "500":
        return const BesYuz();
      case "600":
        return const AltiYuz();
      case "700":
        return const YediYuz();
      case "800":
        return const SekizYuz();
      case "900":
        return const DokuzYuz();
      case "1000":
        return const Bin();
      case "1000000":
        return const Milyon();

      default:
        return const HomePage();
    }
  }
}
