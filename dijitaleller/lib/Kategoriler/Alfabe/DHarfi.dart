import 'package:dijitaleller/Kategoriler/Alfabe/C2Harfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/EHarfi.dart';
import 'package:dijitaleller/Kategoriler/AlfabeKategorisi.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class DHarfi extends StatefulWidget {
  const DHarfi({super.key});

  @override
  State<DHarfi> createState() => _DHarfiState();
}

class _DHarfiState extends State<DHarfi> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access MediaQuery here
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    // Precache image
    precacheImage(
        NetworkImage(
            "https://drive.google.com/uc?export=view&id=17-DrX3GfZLHQY629Ti32FGaJ1eQ8hgBN"),
        context);
  }

  Future<void> _fetchImageData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://drive.google.com/uc?export=view&id=17-DrX3GfZLHQY629Ti32FGaJ1eQ8hgBN"));
      if (response.statusCode == 200) {
        // Image data fetched successfully
      } else {
        // Handle error
        print('Failed to load image');
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(
                    builder: (context) => const AlfabeKategorisi()),
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
                  child: Image.network(
                    "https://drive.google.com/uc?export=view&id=17-DrX3GfZLHQY629Ti32FGaJ1eQ8hgBN",
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return SizedBox(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.5,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.expectedTotalBytes != null
                                  ? progress.cumulativeBytesLoaded /
                                      (progress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.5,
                        child: Center(
                          child: Icon(Icons.error, size: 50),
                        ),
                      );
                    },
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "D Harfi",
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
                              pageBuilder: (_, __, ___) => const C2Harfi(),
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
                              pageBuilder: (_, __, ___) => const EHarfi(),
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
