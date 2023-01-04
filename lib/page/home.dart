import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State <HomePage>{

final List<ListItem> _fruits = [
  ListItem(1, 'Apple'),
  ListItem(2, 'Banana'),
  ListItem(3, 'Papaya'),
];
late List<DropdownMenuItem<ListItem>> _dropdownMenuItems; 
late ListItem _selectedItem; 


@override
  void initState() {
    super.initState();
    _dropdownMenuItems = _buildDropdownMenuItems(_fruits);
    _selectedItem = _dropdownMenuItems[0].value!;
  }

List<DropdownMenuItem<ListItem>> _buildDropdownMenuItems(
    List<ListItem> fruits) {
  List<DropdownMenuItem<ListItem>> items = [];
  // สร้างดรอปดาวน์ เมนู
  for (ListItem listItem in fruits) {
    items.add(DropdownMenuItem(
      child: Text(listItem.name),
      value: listItem,
    ));
  }
  return items;
}
  


  @override 
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text("Class Input Widget"),
    ),
    body: SafeArea(
      child: ListView(
        children: [
          // Dropdown
          DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuItems, onChanged: (value) {
            setState(() { _selectedItem = value!;
            }); 
            },
            
            ),
            Text(_selectedItem.name),
          
          // RadioListTitle



          // CheckboxListTitle


        ],
      ),
    ),
  );
}

  
}

class ListItem {
  final String name;
  final int value;

  ListItem(this.value, this.name);
}