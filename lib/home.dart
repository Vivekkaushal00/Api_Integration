import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dio dio = Dio();
  
  void postData() async {
    try {
      final Response response =  await dio.get('https://api.restful-api.dev/objects');
      if (response.statusCode == 200) {
        print(response.data);        
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ElevatedButton(onPressed: () {postData();}, child: const Text('Tap')),
    );
  }
}