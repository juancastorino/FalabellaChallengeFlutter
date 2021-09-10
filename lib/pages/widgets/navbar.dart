import 'package:falabella_challenge/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  final bool isList;

  const Navbar({
    Key? key,
    this.isList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/falabella-logo.svg',
            height: 50,
          ),
          isList
              ? Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      color: Colors.white70,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Go back',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 15)),
                    ),
                  ),
                )
              : Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      onPressed: () async {
                        FocusScope.of(context);
                        return _launchInBrowser(
                            'https://github.com/juancastorino/FalabellaChallengeMobile');
                      },
                      child: Text('By Juan Castorino',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ),
        ],
      ),
    );
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
}
