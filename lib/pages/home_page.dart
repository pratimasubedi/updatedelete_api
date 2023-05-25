import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Update & Delete'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(
                    data[index],
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  trailing: Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  children: [
                                    TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          text = value;
                                        });
                                      },
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            data[index] = text;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text('update'))
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  data.removeAt(index);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
