import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
final  List<bool> _checked = [false, false, false, false];
  List<String> title = [
    "Read the book",
    "Practice doing homework",
    "Read the extra layer",
    "Listen to the audio"
  ];
  List<String> subtitle = [
    "Reading the book helps you to understand the content",
    "Practice doing homework helps you to understand the content",
    "Read the extra layer helps you to understand the content",
    "Listen to the audio helps you to understand the content",
  ];
  bool _selectAll = false;

  void selectedvalues() {
    List<String> selected = [];
    for (int i = 0; i < _checked.length; i++) {
      if (_checked[i] == true) {
        selected.add(title[i]);
      }
    }
    debugPrint(selected.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Options'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: selectedvalues,
          ),
        ],
      ),
      body: Column(children: [
        ListTile(
          title: const Text('Select all'),
          trailing: Checkbox(
            value: _selectAll,
            onChanged: (value) {
              setState(() {
                _selectAll = value!;
                for (int i = 0; i < _checked.length; i++) {
                  _checked[i] = value;
                }
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.green,
              checkColor: Colors.white,
              title: Text(title[index]),
              subtitle: Text(subtitle[index]),
              value: _checked[index],
              onChanged: (bool? value) {
                setState(() {
                  _checked[index] = value!;
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}

