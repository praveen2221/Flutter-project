import 'package:flutter/material.dart';

class MyChip extends StatefulWidget {
  @override
  _MyChipState createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  List<String> _chipLabels = ['Red', 'Blue', 'Green', 'Yellow', 'Purple'];
  List<String> _selectedChips = [];

  void _toggleChip(String chipLabel) {
    setState(() {
      if (_selectedChips.contains(chipLabel)) {
        _selectedChips.remove(chipLabel);
      } else {
        _selectedChips.add(chipLabel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Chips Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0,
              children: _chipLabels.map((String label) {
                return InputChip(
                  label: Text(label),
                  selected: _selectedChips.contains(label),
                  selectedColor: Colors.blue,
                  onSelected: (bool selected) {
                    _toggleChip(label);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('Selected Chips: ${_selectedChips.join(", ")}'),
           
          ],
        ),
      ),
    );
  }
}
