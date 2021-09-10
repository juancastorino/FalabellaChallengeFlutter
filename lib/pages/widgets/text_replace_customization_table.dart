import 'package:falabella_challenge/providers/numbers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextReplaceCustomizationTable extends StatelessWidget {
  const TextReplaceCustomizationTable({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final NumbersProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Number'),
            Text('After Replace'),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(hintText: '1'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (replaceNumber1) {
                  provider.setReplaceNumber1(int.parse(replaceNumber1));
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(hintText: 'Falabella'),
                onChanged: (replaceText1) {
                  provider.setReplaceText1(replaceText1);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(hintText: '5'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (replaceNumber2) {
                  provider.setReplaceNumber2(int.parse(replaceNumber2));
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(hintText: 'IT'),
                onChanged: (replaceText2) {
                  provider.setReplaceText2(replaceText2);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text('Common Multiple Text'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(hintText: 'Integraciones'),
                onChanged: (commonMultipleFoundedText) {
                  provider
                      .setCommonMultipleFoundedText(commonMultipleFoundedText);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
