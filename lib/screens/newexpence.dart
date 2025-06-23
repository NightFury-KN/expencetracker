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
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Title")),
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

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text("Expence Amount")),
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

            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                label: Text("Date"),
                suffixIcon: Icon(Icons.calendar_today),
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

            DropdownButtonFormField(
              decoration: const InputDecoration(label: Text("Category")),
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
    );
  }
}
