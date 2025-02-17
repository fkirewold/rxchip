import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String perception;

  const DetailPage({super.key, required this.name, required this.perception});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 149, 194, 165),
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: Colors.white,onPressed: (){
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
  final String text='''I hope this email finds you well.
I recently applied for the [Job Position] at [Bank Name] and ensured that I met all the listed qualifications and requirements. However, I have not received any notification regarding the written exam, while I understand that invitations have been sent out.

I would appreciate it if you could clarify whether my application was reviewed and provide any feedback on my eligibility. I am highly interested in this opportunity and would be grateful for any insights you can share.

Looking forward to your response.

Best regards,
[Your Full Name]
[Your Contact Information]
[Your Application Reference Number (if available)]''';

  final String perception;
  const UserBody({super.key, required this.perception});

  @override
  State<UserBody> createState() => _USerBodyState();
}

class _USerBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
     final double hight=MediaQuery.of(context).size.height;
     final double width =MediaQuery.of(context).size.width;


    return  Padding(
      padding: const EdgeInsets.only(top:10.0,left: 10),
      child: SizedBox(
         height: hight*0.6,
         width: width*0.9,     
      child: Card(
        clipBehavior: Clip.hardEdge,
         color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
      
        child: Padding(
          padding: EdgeInsets.all(6),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.text),
                
                Row(
                  spacing: width*0.05,
                 children: [ Icon(Icons.favorite,color: Colors.red,),Icon(Icons.thumb_down),Icon(Icons.mood_bad)], 
                )
              ],
            ),
          ),)
      ),
         
      ),
    );
  }
}
