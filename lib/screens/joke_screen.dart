import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Joke extends StatefulWidget {
  const Joke({Key? key}) : super(key: key);

  @override
  State<Joke> createState() => _JokeState();
}

class _JokeState extends State<Joke> {
  var joke;
  var save;
  var loading;
  bool show = false;

  @override
  void initState() {
    super.initState();
    api();
  }

  api() async {
    setState(() {
      loading = true;
    });

    save = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

    var decode = jsonDecode(save.body);

    print(decode);

    setState(() {
      joke = decode;
      loading = false;
      show = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/joke_bg.png"))),
                child: loading == false
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 180,
                            ),

                            Text(
                              joke['setup'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    show = true;
                                  });
                                },
                                child: Text("Answer")),
                            show == true
                                ? Text(
                                    joke['punchline'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : SizedBox(),


                            SizedBox(
                              height: 100,
                            ),


                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                    onPressed: () {
                                      api();
                                    },
                                    child: Icon(Icons.arrow_forward)),
                              ],
                            )
                          ],
                        ),
                    )
                    : Lottie.asset("assets/images/loading.json",fit: BoxFit.contain, height: 5, width: 5,),)));
  }
}
