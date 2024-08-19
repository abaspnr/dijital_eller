import 'package:dijitaleller/main.dart'; // MyHomePage sınıfına erişim için
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyHomePage()), // MyHomePage'ye yönlendirme
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D8097E"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                "assets/dijitaleller_logo.png",
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Dijital\n Eller",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
