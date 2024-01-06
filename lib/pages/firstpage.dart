import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> gender = ["ชาย", "หญิง", "LGBT+"];

  List<ListItem> prefix = [
    ListItem("boy", "เด็กชาย"),
    ListItem("girl", "เด็กหญิง"),
    ListItem("Mr.", "นาย"),
    ListItem("Miss", "นางสาว"),
    ListItem("Mrs.", "นาง"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItem = [];
  ListItem? _selectedPrefix;

  String _selectedItem = "ชาย";

  List<DropdownMenuItem<ListItem>> biuldDropdownMenuItem(
      List<ListItem> prefix) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem pf in prefix) {
      items.add(DropdownMenuItem(
        value: pf,
        child: Text(pf.name),
      ));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItem = biuldDropdownMenuItem(prefix);
    _selectedPrefix = _dropdownMenuItem[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab7 Dropdown"),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selectedItem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
            value: _selectedPrefix,
            items: _dropdownMenuItem,
            onChanged: (value) {
              setState(() {
                _selectedPrefix = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
