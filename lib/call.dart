import 'package:flutter/material.dart';
import 'package:api_integration/models/apidata.dart';
import 'package:dio/dio.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final Dio dio = Dio();

  ApiData data = ApiData();

  void getData() async {
    try {
      final Response response = await dio
          .get('https://api-evole.deploywork.com/api/content/get-tags');

      if (response.statusCode == 200) {
        data = ApiData.fromJson(response.data);
        setState(() {});
      } else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState(); 
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api'),
      ),
      body: data.data == null
          ? Center(child: Text('Loading...'))
          : ListView.builder(
              itemCount: data.data?.tags?.length ?? 0,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      tileColor: Colors.grey.shade300,
                      title: Text(data.data?.tags?[index].name ?? ''),
                      subtitle: Text(
                          "Is Active : ${data.data?.tags?[index].active}")),
                );
              },
            ),
    );
  }
}
