import 'package:expencetracker/widgets/buildFilterButton.dart';
import 'package:flutter/material.dart';


double fontsize = 12;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});


  @override
  State<Homescreen> createState() => _HomescreenState();
}
String selectedFilter = "Today";
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
                      FilterButtons(label: "Today", 
                      selectedFilter: selectedFilter, 
                      onTap: (){
                        setState(() {
                          selectedFilter = "Today";
                        });
                        print("Clicked button: " + selectedFilter);
                      }, 
                      fontsize: fontsize
                      ),
                     FilterButtons(label: "This Week", 
                      selectedFilter: selectedFilter, 
                      onTap: (){
                        setState(() {
                          selectedFilter = "This Week";
                        });
                        print("Clicked button: " + selectedFilter);
                      }, 
                      fontsize: fontsize
                      ),
                     FilterButtons(label: "This Month", 
                      selectedFilter: selectedFilter, 
                      onTap: (){
                        setState(() {
                          selectedFilter = "This Month";
                        });
                        print("Clicked button: " + selectedFilter);
                      }, 
                      fontsize: fontsize
                      ),
                      FilterButtons(label: "Calender", 
                      selectedFilter: selectedFilter, 
                      onTap: (){
                        setState(() {
                          selectedFilter = "Calender";
                        });
                        print("Clicked button: " + selectedFilter);
                      }, 
                      fontsize: fontsize
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
