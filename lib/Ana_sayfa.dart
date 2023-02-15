import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:staj_proje/Color_constants.dart';
import 'package:staj_proje/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:staj_proje/second_screen.dart';



// ignore: camel_case_types
class Ana_sayfa extends StatefulWidget{
  const Ana_sayfa({super.key});

  @override
  State<Ana_sayfa> createState() => Ana_sayfaState();
}

// ignore: camel_case_types
class Ana_sayfaState extends State<Ana_sayfa> {

  final String BaseUrl = 'https://hp-api.onrender.com/api/characters';
  Future<model> fetchmodel() async {
  var response = await http.get(Uri.parse(BaseUrl));

  if (response.statusCode == 200) {
    var jsonBody =jsonDecode(response.body);
    return model.fromJson(jsonBody[0]);
  } else {
    throw Exception('api servisi hatali');
  }
}
  late Future<model> futuremodel;

  @override
  void initState() {
    super.initState();
    futuremodel = fetchmodel();
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Ink(
            decoration: ShapeDecoration(
              color: sixthColor,
            shape: CircleBorder(),
            ),
          
          child: IconButton(
            icon: Icon(Icons.navigate_next),
            iconSize: 50,
            color: fifthColor,
            onPressed: ()  {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  second_screen()),
              );
            },
          ),
        ),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('HARRY POTTER'),
        backgroundColor: sixthColor,
        centerTitle: true,
        ),
        body: Center(
          child: Card(
            elevation: 50,
            //shadowColor: Color.fromARGB(255, 112, 165, 208),
            color: thirdColor,
            child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
      
                child: FutureBuilder<model>(
                  future: futuremodel,
                  builder: (context, snapshot) {
                    // ignore: dead_code
                    if (snapshot.hasData) {
                      //Image photo = Image.network(snapshot.data!.image!);
                      return MaterialApp(
                      home: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:primaryColor,
                            radius: 110,
                            child: CircleAvatar(
                              backgroundImage:NetworkImage(snapshot.data!.image!),
                              radius: 100,
                            ), 
                          ),  
                          Text(
                            snapshot.data!.name!,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Color(0xffdff6ff),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            snapshot.data!.species!,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Color(0xffdff6ff),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            snapshot.data!.gender!,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Color(0xffdff6ff),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            snapshot.data!.yearOfBirth!.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              color: Color(0xffdff6ff),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            snapshot.data!.actor!,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xffdff6ff),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          
                          buttonSection,
                        ]
                      ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                  },
                ),
            ),
          ),
          ),
         
        ),
      ),
    ),
    );
  }
}
 