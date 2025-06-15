import 'package:flutter/material.dart';

class Newexpence extends StatefulWidget {
 const  Newexpence({super.key});

  @override
  State<Newexpence> createState() => _NewexpenceState();
}

class _NewexpenceState extends State<Newexpence> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title:  Align(
          alignment: Alignment.centerLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add new Expense",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text("Enter the details of your expense to help you track your spending",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
        ),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                ),
                
              )
            ],
          ),
        ),
        
      
   );
  }
}