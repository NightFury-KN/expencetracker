import 'package:flutter/material.dart';



class FilterButtons extends StatelessWidget {
  
final String label;
 final String selectedFilter;
 final void Function() onTap;
 final double fontsize;



  const FilterButtons({
    super.key,
    required this.label,
    required this.selectedFilter,
    required this.onTap,
    required this.fontsize, 

    
  });
  @override
  Widget build(BuildContext context) {
    final isSelected = label == selectedFilter;
    return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ButtonStyle(
                            backgroundColor: isSelected? MaterialStateProperty.all(Colors.white):  MaterialStateProperty.all(Colors.black),
                             foregroundColor: isSelected? MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)):  MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize: fontsize)),
                          ),
                          child: Text(label),
                          
                        ),
                      );
  }
}