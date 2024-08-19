import 'package:dijitaleller/HomePage.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/%C3%B22Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/AHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/BHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/C2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/CHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/DHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/EHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/FHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/G2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/GHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/HHarfi.dart';
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
import 'package:dijitaleller/Kategoriler/Alfabe/iHarfi.dart';
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
import 'package:dijitaleller/Kategoriler/Zamirler/Bana.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Ben.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Benim.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Biz.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Bize.dart';
import 'package:dijitaleller/Kategoriler/Zamirler/Bizim.dart';
import 'package:dijitaleller/TestPage.dart';
import 'package:dijitaleller/Testler/AlfabeTest.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  final List<Map<String, dynamic>> _allSuggestions = [
    {'title': "Testler", 'page': const TestPage()},
    {'title': "Alfabe Testi", 'page': const AlfabeTesti()},
    {'title': "Anasayfa", 'page': const HomePage()},
    {'title': 'A Harfi', 'page': const AHarfi()},
    {'title': 'B Harfi', 'page': const BHarfi()},
    {'title': "C Harfi", 'page': const CHarfi()},
    {'title': "Ç Harfi", 'page': const C2Harfi()},
    {'title': "D Harfi", 'page': const DHarfi()},
    {'title': "E Harfi", 'page': const EHarfi()},
    {'title': "F Harfi", 'page': const FHarfi()},
    {'title': "G Harfi", 'page': const GHarfi()},
    {'title': "Ğ Harfi", 'page': const G2Harfi()},
    {'title': "H Harfi", 'page': const HHarfi()},
    {"title": "I Harfi", "page": const i2Harfi()},
    {"title": "İ Harfi", "page": const iHarfi()},
    {"title": "J Harfi", "page": const JHarfi()},
    {"title": "K Harfi", "page": const KHarfi()},
    {"title": "L Harfi", "page": const LHarfi()},
    {"title": "M Harfi", "page": const MHarfi()},
    {"title": "N Harfi", "page": const NHarfi()},
    {"title": "O Harfi", "page": const OHarfi()},
    {"title": "Ö Harfi", "page": const O2Harfi()},
    {"title": "P Harfi", "page": const PHarfi()},
    {"title": "R Harfi", "page": const RHarfi()},
    {"title": "S Harfi", "page": const SHarfi()},
    {"title": "Ş Harfi", "page": const S2Harfi()},
    {"title": "T Harfi", "page": const THarfi()},
    {"title": "U Harfi", "page": const UHarfi()},
    {"title": "Ü Harfi", "page": const U2Harfi()},
    {"title": "V Harfi", "page": const VHarfi()},
    {"title": "Y Harfi", "page": const YHarfi()},
    {"title": "Z Harfi", "page": const ZHarfi()},
    {"title": "1 (Bir)", "page": const Bir()},
    {"title": "2 (İki)", "page": const Iki()},
    {"title": "3 (Üç)", "page": const Uc()},
    {"title": "4 (Dört)", "page": const Dort()},
    {"title": "5 (Beş)", "page": const Bes()},
    {"title": "6 (Altı)", "page": const Alti()},
    {"title": "7 (Yedi)", "page": const Yedi()},
    {"title": "8 (Sekiz)", "page": const Sekiz()},
    {"title": "9 (Dokuz)", "page": const Dokuz()},
    {"title": "10 (On)", "page": const On()},
    {"title": "11 (On Bir)", "page": const OnBir()},
    {"title": "12 (On İki)", "page": const OnIki()},
    {"title": "13 (On Üç)", "page": const OnUc()},
    {"title": "14 (On Dört)", "page": const OnDort()},
    {"title": "15 (On Beş)", "page": const OnBes()},
    {"title": "16 (On Altı)", "page": const OnAlti()},
    {"title": "17 (On Yadi)", "page": const OnYedi()},
    {"title": "18 (On Sekiz)", "page": const OnSekiz()},
    {"title": "19 (On Dokuz)", "page": const OnDokuz()},
    {"title": "20 (Yirmi)", "page": const Yirmi()},
    {
      "title": "30 (Otuz)",
      "page": const Otuz(),
    },
    {"title": "40 (Kırk)", "page": const Kirk()},
    {"title": "50 (Elli)", "page": const Elli()},
    {"title": "60 (Altmış)", "page": const Altmis()},
    {"title": "70 (Yetmiş)", "page": const Yetmis()},
    {"title": "80 (Seksen)", "page": const Seksen()},
    {"title": "90 (Doksan)", "page": const Doksan()},
    {"title": "100 (Yüz)", "page": const Yuz()},
    {"title": "200 (İki Yüz)", "page": const IkiYuz()},
    {"title": "300 (Üç Yüz)", "page": const UcYuz()},
    {"title": "400 (Dört Yüz)", "page": const DortYuz()},
    {"title": "500 (Beş Yüz)", "page": const BesYuz()},
    {"title": "600 (Altı Yüz)", "page": const AltiYuz()},
    {"title": "700 (Yedi Yüz)", "page": const YediYuz()},
    {"title": "800 (Sekiz Yüz)", "page": const SekizYuz()},
    {"title": "900 (Dokuz Yüz)", "page": const DokuzYuz()},
    {"title": "1000 (Bin)", "page": const Bin()},
    {"title": "1000000 (Milyon)", "page": const Milyon()},
    {"title": "Bana", "page": const Bana()},
    {"title": "Ben", "page": const Ben()},
    {"title": "Benim", "page": const Benim()},
    {"title": "Biz", "page": const Biz()},
    {"title": "Bize", "page": const Bize()},
    {"title": "Bizim", "page": const Bizim()}
  ];

  void _updateSearchResults(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _searchResults = _allSuggestions
          .where((item) =>
              (item['title'] as String).toLowerCase().contains(lowerCaseQuery))
          .toList();
    });
  }

  void _onItemTapped(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => item['page'] as Widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Neyi merak ediyorsun ?',
          style: GoogleFonts.montserrat(
              color: Colors.pink, fontWeight: FontWeight.bold),
        ),
      )),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.pink,
                ),
                labelText: 'Ara',
                labelStyle: const TextStyle(color: Colors.pink),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.pink, width: 2.0),
                ),
              ),
              onChanged: _updateSearchResults,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]['title']),
                  onTap: () => _onItemTapped(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SearchPage(),
  ));
}
