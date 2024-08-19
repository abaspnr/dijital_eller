import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:dijitaleller/splashscreen.dart'; // SplashScreen sınıfına erişim için
import 'package:dijitaleller/HomePage.dart';
import 'package:dijitaleller/SearchPage.dart';
import 'package:dijitaleller/TestPage.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromARGB(255, 232, 232, 232),
      ),
      home:
          const SplashScreen(), // SplashScreen'i başlangıç sayfası olarak ayarlayın
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  final Color waterDropColor = Colors.pink; // Pembe renk
  int selectedIndex = 1; // Başlangıç sayfası olarak HomePage'i seçiyoruz
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const <Widget>[
            TestPage(),
            HomePage(), // Ortadaki tuş HomePage'e gidiyor
            SearchPage(),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          waterDropColor: waterDropColor, // Pembe renk ayarı
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.bookmark_rounded,
              outlinedIcon: Icons.bookmark_border_rounded,
            ),
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
              filledIcon: Icons.search_rounded,
              outlinedIcon: Icons.search_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
