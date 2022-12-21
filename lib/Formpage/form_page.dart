import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hand_on/model/post.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}
const String dataUrl = 'https://jsonplaceholder.typicode.com/todos';

Future<Post?>submit(String title, bool status) async{
  var url = Uri.parse(dataUrl);
  var mydata = json.encode({'title': title, 'completed': status});
  var connection = await http.post(url, body: mydata);

  if (connection.statusCode == 200) {
    print('Successfully added ToDo!');
    var display = connection.body;
    print(display);

    String todoResponse = connection.body;
    postFromJson(todoResponse);
  } else {
    return null;
  }
  return null;
}

class _FormPageState extends State<FormPage> {
  var formkey = GlobalKey<FormState>();
  Post? edit;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add New Data'),
        ),
      ),
      body: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Todo Title',
                    hintText: 'Name of Activity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter todo title';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      Post? data = await submit(name.text, false);
                      setState(() {
                        edit = data;
                      });
                    } else {
                      return;
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Submit'))
            ],
          )),
    );
  }
}
