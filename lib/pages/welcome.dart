import 'package:falabella_challenge/pages/number_list.dart';
import 'package:falabella_challenge/pages/widgets/text_replace_customization_table.dart';
import 'package:falabella_challenge/providers/numbers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:falabella_challenge/pages/widgets/titles.dart';
import 'package:falabella_challenge/pages/widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NumbersProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),
            SizedBox(height: 20),
            Titles(
              texto: 'Numbers',
              margin: MediaQuery.of(context).size.width * 0.050,
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text('Start Number'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      decoration: InputDecoration(hintText: '1'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (endNumberText) {
                        provider.setStart(int.parse(endNumberText));
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('End Number'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      decoration: InputDecoration(hintText: '100'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (endNumberText) {
                        provider.setEnd(int.parse(endNumberText));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Titles(
              texto: 'Text Replace Customization',
              margin: MediaQuery.of(context).size.width * 0.050,
            ),
            SizedBox(height: 30),
            TextReplaceCustomizationTable(provider: provider),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const NumberList();
                      }),
                    );
                  },
                  child: Text('Go for it!',
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
