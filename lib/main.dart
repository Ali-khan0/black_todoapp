import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: todo()));
}

class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
}

class _todoState extends State<todo> {
  var output = "";
  List<dynamic> lst = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "todo app",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.white70,
              margin: EdgeInsets.only(top: 3),
              child: ListTile(
                title: Text("${lst[index]}"),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit item"),
                                    content: TextField(
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.black54),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
