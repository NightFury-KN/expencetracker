import 'package:expencetracker/screens/newexpence.dart';
import 'package:expencetracker/utils/icon_helper.dart';
import 'package:expencetracker/widgets/buildFilterButton.dart';
import 'package:expencetracker/models/expence.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double fontsize = 12;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

String selectedFilter = "Today";


class _HomescreenState extends State<Homescreen> {
  List<Expence> allExpenses = [
    Expence(
      title: "Groceries",
      amount: 2500,
      date: DateTime.now(),
      category: Cat.food,
    ),

    Expence(
      title: "Gym",
      amount: 5000,
      date: DateTime.now(),
      category: Cat.fitness,
    ),

    Expence(
      title: "Bus Ticket",
      amount: 120,
      date: DateTime.now().subtract(Duration(days: 2)),
      category: Cat.transport,
    ),
    Expence(
      title: "Netflix",
      amount: 1500,
      date: DateTime.now().subtract(Duration(days: 10)),
      category: Cat.entertainment,
    ),
    
  ];

  void _addExpense(Expence expense){
  setState((){
    allExpenses.add(expense);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Newexpence(onAddExpense: _addExpense)),
                  ),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
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
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      FilterButtons(
                        label: "Today",
                        selectedFilter: selectedFilter,
                        onTap: () {
                          setState(() {
                            selectedFilter = "Today";
                          });
                          print("Clicked button: " + selectedFilter);
                        },
                        fontsize: fontsize,
                      ),
                      FilterButtons(
                        label: "This Week",
                        selectedFilter: selectedFilter,
                        onTap: () {
                          setState(() {
                            selectedFilter = "This Week";
                          });
                          print("Clicked button: " + selectedFilter);
                        },
                        fontsize: fontsize,
                      ),
                      FilterButtons(
                        label: "This Month",
                        selectedFilter: selectedFilter,
                        onTap: () {
                          setState(() {
                            selectedFilter = "This Month";
                          });
                          print("Clicked button: " + selectedFilter);
                        },
                        fontsize: fontsize,
                      ),
                      FilterButtons(
                        label: "Calender",
                        selectedFilter: selectedFilter,
                        onTap: () {
                          setState(() {
                            selectedFilter = "Calender";
                          });
                          print("Clicked button: " + selectedFilter);
                        },
                        fontsize: fontsize,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: allExpenses.length,
                  itemBuilder: (context, index) {
                    final expense = allExpenses[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 3, 3, 3),
                      ),
                      child: ListTile(
                        leading: getCategoryIcon(expense.category),
                        title: Text(expense.title),
                        subtitle: Text(
                          "${expense.date.day}/${expense.date.month}/${expense.date.year}",
                        ),
                        trailing: Text(
                          "Rs. ${expense.amount.toStringAsFixed(2)}",
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
