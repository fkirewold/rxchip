import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String perception;

  const DetailPage({super.key, required this.name, required this.perception});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.keyboard_backspace),color: Colors.white,onPressed: (){
            Navigator.pop(context);
          },),
          title: Text(name,style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 13, 69, 224),
          elevation: 3,
        ),
        body: UserBody(
          perception: perception,
        ),
      ),
    );
  }
}

class UserBody extends StatefulWidget {
  final String perception;
  const UserBody({super.key, required this.perception});

  @override
  State<UserBody> createState() => _USerBodyState();
}

class _USerBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
  
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Container(
            width: 300, // Set a fixed width
            height: 200, // Set a fixed height
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            child: SingleChildScrollView(
              child: Text(
                widget.perception,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
      ),
      )
    );
  }
}
