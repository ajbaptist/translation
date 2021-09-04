import 'package:flutter/material.dart';
import 'package:get/get.dart';

String string = 'this is an example page of translation ';
final style = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 20,
);

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          string: 'this is an example page of translation ',
          'hint': 'LANGUAGE : ENGLISH'
        },
        'de_DE': {
          string: 'Dies ist eine Beispielseite für die Übersetzung',
          'hint': 'LANGUAGE : GERMAN'
        },
        'fr_FR': {
          string: 'ceci est un exemple de page de traduction',
          'hint': 'LANGUAGE : FRENCH'
        },
      };
}
