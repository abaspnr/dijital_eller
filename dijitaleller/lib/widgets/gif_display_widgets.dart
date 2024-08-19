import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GifDisplayWidget extends StatelessWidget {
  final String gifKey;

  GifDisplayWidget({required this.gifKey});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('gifBox'),
      builder: (context, AsyncSnapshot<Box> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            var gifBytes = snapshot.data?.get(gifKey);
            if (gifBytes != null) {
              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Border radius
                  child: Image.memory(
                    gifBytes,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            } else {
              return Center(
                child: LinearProgressIndicator(
                  color: Colors.blue,
                  minHeight: 10,
                ),
              );
            }
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
