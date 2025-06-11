import 'package:flutter/material.dart';


double fontsize = 13;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning, Jon",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 249, 249),
                fontSize: 25,
              ),
            ),
            Text(
              "Track your expenses, start your day right",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
      ),

      body: Container(
        margin:EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: null,
                        
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                             textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontsize)),
                             foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 154, 178, 179))
                          ),
                          child: const Text("Today"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: null,
                      
                          style: ButtonStyle(
                            
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontsize)),
                             foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 154, 178, 179))
                          ),
                          child: const Text("This Week"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: null,
                        
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontsize)),
                             foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 154, 178, 179))
                          ),
                          child: const Text("This Month"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:5),
                        child: ElevatedButton(
                          onPressed: null,
                        
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize:fontsize )),
                             foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 154, 178, 179))
                          ),
                          child: const Text("Calender"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
