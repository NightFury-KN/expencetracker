import 'dart:ffi';

import 'package:expencetracker/models/expence.dart';
import 'package:flutter/material.dart';

class Newexpence extends StatefulWidget {
  final void Function(Expence) onAddExpense;
  const Newexpence({super.key, required this.onAddExpense});
  @override
  State<Newexpence> createState() => _NewexpenceState();
}

class _NewexpenceState extends State<Newexpence> {
  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  String _title = '';
  double _amount = 0;
  DateTime _date = DateTime.now();
  Cat _category = Cat.other;
  static const fieldSpacing = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add new Expense",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "Enter the details of your expense to help you track your spending",
                style: TextStyle(fontSize: 15, color: Colors.grey),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formGlobalKey,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                    gapPadding: 10,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              fieldSpacing,
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Expence Amount"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                    gapPadding: 10,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value == null || value.isEmpty) {
                  } else {
                    _amount = double.parse(value);
                  }
                },
              ),
               fieldSpacing,
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  label: Text("Date"),
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                    gapPadding: 10,
                  ),
                ),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      _dateController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },

                onSaved: (value) {
                  _date = _selectedDate!;
                },
              ),

               fieldSpacing,

              DropdownButtonFormField(
                elevation: 16,
                dropdownColor:Colors.black,
                icon: Icon(Icons.keyboard_arrow_down_sharp, color: const Color.fromARGB(255, 15, 75, 116),),
                decoration: InputDecoration(
                  
                  label: Text("Category"),
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    gapPadding: 10,
                    
                  ),
                ),
                items:
                    Cat.values.map((p) {
                      return DropdownMenuItem(value: p, child: Text(p.name));
                    }).toList(),
                onChanged: (value) {
                  print(value);
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
              ),
               fieldSpacing,
              FilledButton(
                onPressed: () {
                  if (_formGlobalKey.currentState!.validate()) {
                    _formGlobalKey.currentState!.save();

                    widget.onAddExpense(
                      Expence(
                        title: _title,
                        amount: _amount,
                        date: _date,
                        category: _category,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
