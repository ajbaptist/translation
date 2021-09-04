import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation/translation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.teal,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    RxString lang = 'ENGLISH'.obs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TRANSLATION'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: DropdownButton<String>(
                items: <String>[
                  'ENGLISH',
                  'FRENCH',
                  'GERMAN',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    lang.value = value!;
                  });
                  if (value == 'ENGLISH') {
                    Get.updateLocale(Locale('en', 'US'));
                    print(value);
                  } else if (value == 'GERMAN') {
                    Get.updateLocale(Locale('de', 'DE'));
                    print(value);
                  } else {
                    Get.updateLocale(Locale('fr', 'FR'));
                    print(value);
                  }
                },
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.teal, Colors.green])),
                  padding: EdgeInsets.all(15),
                  child: Text(string.tr,
                      textAlign: TextAlign.center, style: style),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
          ),
          Text(
            'hint'.tr,
            textAlign: TextAlign.center,
            style: style,
          )
        ],
      ),
    );
  }
}
