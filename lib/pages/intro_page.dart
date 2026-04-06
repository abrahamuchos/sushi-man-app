import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_man/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Logo-Title
            Text(
              'Sushi Man'.toUpperCase(),
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),

            //Image
            Padding(
              padding: const EdgeInsets.all(35),
              child: Image.asset('lib/images/salmon_eggs.png'),
            ),
            const SizedBox(height: 15),

            //Title
            Text(
              'The taste of japanese food'.toUpperCase(),
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            //Description
            Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            //CTA Button
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
