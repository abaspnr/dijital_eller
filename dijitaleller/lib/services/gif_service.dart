import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class GifService {
  Future<void> downloadAndSaveGif(String url, String key) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Uint8List gifBytes = response.bodyBytes;
      var box = await Hive.openBox('gifBox');
      await box.put(key, gifBytes);
    }
  }

  Future<void> downloadGifs() async {
    List<String> gifUrls = [
      // URL list
      "https://drive.google.com/uc?export=view&id=1hpITBosj1cdJFOfp-KSJv74UGcThglD8",
      "https://drive.google.com/uc?export=view&id=1faONJ6UpNBF9fO_0KRQ2qzB3ksTF8P0m",
      "https://drive.google.com/uc?export=view&id=1cfmUPE6TeR0tcilp530qdEQm-iypQcvg",
      "https://drive.google.com/uc?export=view&id=1mwcy5sSyTUpQUoQrJ3K-hN8cRqCIuOkv",
      "https://drive.google.com/uc?export=view&id=1bTJfvfQ0yQH1d6gLtONfARmI8LoX9r3D",
      "https://drive.google.com/uc?export=view&id=1c0Bw35MO-Z__5_g5xIsCJvf7DvhNS4aw",
      "https://drive.google.com/uc?export=view&id=1NdF9erjK3KZ-yoKlrTIe2BcXac2EubgS",
    ];

    List<Future<void>> downloadTasks = gifUrls
        .map((url) => downloadAndSaveGif(url, 'gif${gifUrls.indexOf(url)}'))
        .toList();

    await Future.wait(downloadTasks);
  }
}
