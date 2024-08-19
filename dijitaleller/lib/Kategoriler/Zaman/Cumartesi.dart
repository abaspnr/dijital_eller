import 'package:dijitaleller/Kategoriler/Zaman/Cuma.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Pazar.dart';
import 'package:dijitaleller/Kategoriler/Zaman/Persembe.dart';
import 'package:dijitaleller/Kategoriler/ZamanKategorisi.dart';
import 'package:dijitaleller/widgets/gif_display_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Cumartesi extends StatefulWidget {
  const Cumartesi({super.key});

  @override
  State<Cumartesi> createState() => _CumartesiState();
}

class _CumartesiState extends State<Cumartesi> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ZamanKategorisi()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: HexColor("#D8097E"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ZamanKategorisi()),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GifDisplayWidget(gifKey: "gif5")),
              ),
              const SizedBox(height: 50),
              const Text(
                "Cumartesi",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Container(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 45,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              pageBuilder: (_, __, ___) => const Cuma(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_left, color: Colors.white),
                        iconSize: 45,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 45,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              pageBuilder: (_, __, ___) => const Pazar(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        icon:
                            const Icon(Icons.arrow_right, color: Colors.white),
                        iconSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
