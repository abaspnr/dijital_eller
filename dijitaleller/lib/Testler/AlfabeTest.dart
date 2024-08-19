import 'package:dijitaleller/TestPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AlfabeTesti extends StatefulWidget {
  const AlfabeTesti({super.key});

  @override
  State<AlfabeTesti> createState() => _AlfabeTestiState();
}

class _AlfabeTestiState extends State<AlfabeTesti> {
  @override
  Widget build(BuildContext context) {
    return const AlfabeTestiApp();
  }
}

void main() {
  runApp(const AlfabeTestiApp());
}

class AlfabeTestiApp extends StatelessWidget {
  const AlfabeTestiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alfabe Testi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const AlfabeTestiPage(),
    );
  }
}

class AlfabeTestiPage extends StatefulWidget {
  const AlfabeTestiPage({super.key});

  @override
  _AlfabeTestiPageState createState() => _AlfabeTestiPageState();
}

class _AlfabeTestiPageState extends State<AlfabeTestiPage> {
  final List<TestQuestion> questions = [
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1tqpYtIM1Z2t-oyrtgPjGIAHAvneMr-Zp',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'A',
      options: ['A', 'B', 'C', 'D'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=13wQbUqj_cnzWBSbwpC_Ag88pduc3VDAp',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'C',
      options: ['A', 'B', 'C', 'D'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1NBEm27TyUoKRnI7MuHeiiUXlHENDjpO-',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'Z',
      options: ['K', 'Y', 'V', 'Z'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1kOtkL0luhXCCkUooQT6FIG327s7RhEkY',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'G',
      options: ['Ğ', 'G', 'C', 'Ç'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1cyJiOsEd69XwD49ycbYy4H3WAWThMDNo',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'Ç',
      options: ['Ğ', 'G', 'C', 'Ç'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1MyfV24LuaP-zHASHABY4wcUinYZQHmav',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'K',
      options: ['K', 'Y', 'V', 'Z'],
    ),
    TestQuestion(
      imagePath:
          'https://drive.google.com/uc?export=view&id=1hL1BH4-A8JmTs1KguXQSl103dPikpzVP',
      question: 'Yukarıda hangi harf işaret edilmiştir?',
      correctAnswer: 'B',
      options: ['A', 'B', 'C', 'D'],
    ),
  ];

  int currentQuestionIndex = 0;
  bool? currentAnswer;
  bool isCorrectAnswerSelected = false;

  @override
  void initState() {
    super.initState();
    for (var question in questions) {
      question.options.shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: HexColor("#D8097E"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TestPage()),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                  child: CachedNetworkImage(
                    imageUrl: currentQuestion.imagePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                currentQuestion.question,
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.5,
                children:
                    List.generate(currentQuestion.options.length, (index) {
                  return buildAnswerButton(
                    context,
                    currentQuestion.options[index],
                    currentQuestion.options[index] ==
                        currentQuestion.correctAnswer,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswerButton(BuildContext context, String text, bool isCorrect) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color:
            isCorrectAnswerSelected && isCorrect ? Colors.green : Colors.pink,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          checkAnswer(isCorrect);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }

  void checkAnswer(bool isCorrect) {
    setState(() {
      currentAnswer = isCorrect;
      if (isCorrect) {
        isCorrectAnswerSelected = true;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isCorrectAnswerSelected = false;
            if (currentQuestionIndex < questions.length - 1) {
              currentQuestionIndex++;
              questions[currentQuestionIndex].options.shuffle();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Harfler Testi Tamamlandı'),
                    content: const Text('Tebrikler, harfler testini tamamladınız!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestPage()));
                        },
                        child: const Text('Kapat'),
                      ),
                    ],
                  );
                },
              );
            }
          });
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Yanlış Cevap'),
              content: const Text('Üzgünüm, yanlış cevap verdiniz.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tekrar Dene'),
                ),
              ],
            );
          },
        );
      }
    });
  }
}

class TestQuestion {
  final String question;
  final String correctAnswer;
  final String imagePath;
  final List<String> options;

  TestQuestion({
    required this.question,
    required this.correctAnswer,
    required this.imagePath,
    required this.options,
  });
}
