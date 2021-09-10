import 'package:falabella_challenge/pages/widgets/navbar.dart';
import 'package:falabella_challenge/providers/numbers_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberList extends StatelessWidget {
  const NumberList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NumbersProvider>(context);
    final numbersList = provider.parseList('numbers');
    final replacesList = provider.parseList('replaces');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                Navbar(
                  isList: true,
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Number'),
                      Text('After Replace'),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                    itemCount: provider.getTotalItems,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              numbersList[index].toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              replacesList[index].toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () async {
                      FocusScope.of(context);
                      return _launchInBrowser(
                          'https://github.com/juancastorino/FalabellaChallengeMobile');
                    },
                    child: Text('Go to Github',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}
