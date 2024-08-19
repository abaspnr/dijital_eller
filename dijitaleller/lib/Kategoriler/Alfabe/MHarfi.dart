
import 'package:dijitaleller/Kategoriler/Alfabe/LHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/NHarfi.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dijitaleller/Kategoriler/AlfabeKategorisi.dart';

class MHarfi extends StatefulWidget {
  const MHarfi({super.key});

  @override
  State<MHarfi> createState() => _MHarfiState();
}

class _MHarfiState extends State<MHarfi> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AlfabeKategorisi()),
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
                MaterialPageRoute(builder: (context) => const AlfabeKategorisi()),
              );
            },
          ),
          title: Text(
            'Geri',
            style: TextStyle(
              color: HexColor("#D8097E"),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
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
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://drive.google.com/uc?export=view&id=1YXG5GTVlptMv1AeJnTeXhKWlvHLBfdaX",
                    placeholder: (context, url) => SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.5,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "M Harfi",
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
                              pageBuilder: (_, __, ___) => const LHarfi(),
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
                              pageBuilder: (_, __, ___) => const NHarfi(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_right, color: Colors.white),
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
