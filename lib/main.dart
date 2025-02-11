import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:mybook/chapters/chapter1.dart';
import 'package:mybook/chapters/chapter2.dart';
import 'package:mybook/chapters/chapter3.dart';
import 'package:mybook/chapters/chapter4.dart';
import 'package:mybook/chapters/chapter5.dart';
import 'package:mybook/chapters/chapter6.dart';
import 'package:mybook/chapters/chapter7.dart';
import 'package:mybook/chapters/chapter8.dart';
import 'package:mybook/chapters/chapter9.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookCover(),
      theme: ThemeData(
        fontFamily: 'Merriweather',
        scaffoldBackgroundColor:
            Color.fromARGB(255, 255, 255, 255), // Light parchment color
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BookCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.9,
              height: constraints.maxHeight * 0.8,
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: _buildCoverPage(context),
                back:
                    MyBook(), // Make sure MyBook() does not have its own Scaffold
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoverPage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/cover2.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      alignment: Alignment
          .center, // This ensures the text is centered within the container
      // child: Text(
      //   // 'The King and Daughter',
      //   textAlign: TextAlign.center, // Ensures the text itself is centered
      //   style: TextStyle(
      //     fontSize: 32,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //     shadows: [
      //       Shadow(
      //         color: Colors.black,
      //         blurRadius: 5,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class MyBook extends StatelessWidget {
  // List of chapter names
  final list = [
    "The White Moon",
    "Good and Bad",
    "The Nightmare",
    "The Long Road",
    "The White Horse",
    "Mrs. Perfect",
    "A and Alone",
    "King & Daughter"
  ];

  // Corresponding chapter routes
  final routes = [
    Chapter1(),
    Chapter2(),
    Chapter3(),
    Chapter4(),
    Chapter5(),
    Chapter6(),
    Chapter7(),
    Chapter8(),
    Chapter9()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // Used instead of Scaffold to avoid nesting errors
      color: Color.fromARGB(255, 246, 246, 243),
      child: Column(
        children: [
          AppBar(
            title: Text('The Book Name',
                style: TextStyle(fontFamily: 'Merriweather', fontSize: 24)),
            backgroundColor: const Color.fromARGB(255, 247, 246, 245),
            centerTitle: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Dynamically navigate based on the index
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => routes[index]),
                      );
                    },
                    child: ChapterCard(
                        title: list[index], chapterNumber: index + 1),
                  );
                },
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 245, 244, 244),
            onPressed: _sendEmail,
            child:
                Icon(Icons.mail, color: const Color.fromARGB(255, 11, 11, 11)),
          ),
        ],
      ),
    );
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'xyz@gmail.com',
      queryParameters: {
        'subject': 'Feedback about My Book',
        'body': 'Hello, I want to share my feedback...',
      },
    );

    try {
      bool launched = await launchUrl(emailUri);
      if (!launched) {
        throw 'Could not launch email app';
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }
}

class ChapterCard extends StatelessWidget {
  final String title;
  final int chapterNumber;
  const ChapterCard({required this.title, required this.chapterNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: const Color.fromARGB(255, 238, 238, 238),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 189, 187, 186),
              child: Text('$chapterNumber',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
