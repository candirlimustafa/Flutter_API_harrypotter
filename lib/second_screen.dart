// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:staj_proje/Color_constants.dart';

import 'Ana_sayfa.dart';

class second_screen extends StatelessWidget {
  const second_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Scaffold(
        body: const MyStatelessWidget(),
        
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          title: const Text('MUSTAFA ÇANDIRLI'),
          backgroundColor: sixthColor,
        ),
      
      body: Center(
        child: Card(
          elevation: 50,
          color: thirdColor,
          child: SizedBox(
            width: 300,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                   Image.asset(
              'assets/images/mustafa.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
                  const SizedBox(
                    height: 50,
                  ), 
                  // ignore: prefer_const_constructors
                  Text(
                    'MUSTAFA ÇANDIRLI',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 25,
                        color: Color(0xffdff6ff),
                      fontWeight: FontWeight.w500,
                    ), 
                  ), 
                  const SizedBox(
                    height: 10,
                  ), 
                  const Text(
                    'Ondokuz Mayıs Üniversitesi \n Bilgisayar Mühendisliği\n mustafa.candirli@bil.omu.edu.tr',
                    style: TextStyle(
                      fontSize: 15,
                        color: Color(0xffdff6ff),
                    ), 
                  ), 
                  const SizedBox(
                    height: 10,
                  ), 
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: sixthColor,
                            shape: CircleBorder(),
                          ), 
                          child: IconButton(
                            icon: Icon(Icons.navigate_before),
                            iconSize: 50,
                            color: fifthColor,
                            onPressed: ()  {Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Ana_sayfa()),
                            );
                            },
                          ),
                        ),
                      ],
                    ),
                    
                  ) 
                ],
              ), 
            ), 
          ), 
        ), 
      ), 
      
    );
  }
}


