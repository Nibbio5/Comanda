import 'package:comanda/screens/food_drinks_screen.dart';
import 'package:flutter/material.dart';

class TableGrid extends StatefulWidget {
  const TableGrid({super.key});

  @override
  State<TableGrid> createState() => _TableGridState();
}

class _TableGridState extends State<TableGrid> {
  int? _selectedTableIndex;
  bool _isExpandedInside = false;
  bool _isExpandedOutside = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleziona un Tavolo'),
        actions: [
          if (_selectedTableIndex != null)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Naviga verso un altro screen quando il pulsante viene premuto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodAndDrinks()),
                );
              },
            ),
        ],
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Tavoli Interni'),
            initiallyExpanded: _isExpandedInside,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpandedInside = expanded;
              });
            },
            children:
                _buildTableGrid(5, 'D', 0, startFrom: 0), // 10 tavoli interni
          ),
          ExpansionTile(
            title: const Text('Tavoli Esterni'),
            initiallyExpanded: _isExpandedOutside,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpandedOutside = expanded;
              });
            },
            children:
                _buildTableGrid(10, 'F', 5, startFrom: 0), // 8 tavoli esterni
          ),
          ExpansionTile(
            title: const Text('Dietro caffè'),
            initiallyExpanded: _isExpandedOutside,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpandedOutside = expanded;
              });
            },
            children: _buildTableGrid(3, 'D Caffè', 15,
                startFrom: 0), // 8 tavoli esterni
          ),
          ExpansionTile(
            title: const Text('Dietro Palestra'),
            initiallyExpanded: _isExpandedOutside,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpandedOutside = expanded;
              });
            },
            children: _buildTableGrid(3, 'D Palestra', 18,
                startFrom: 0), // 8 tavoli esterni
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTableGrid(int count, String section, int offset,
      {int startFrom = 0}) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Numero di colonne
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: count,
          itemBuilder: (context, index) {
            int tableIndex = startFrom + index + offset;
            bool isSelected = _selectedTableIndex == tableIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTableIndex = tableIndex;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[200],
                  border: Border.all(
                    color: isSelected ? Colors.blueAccent : Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '$section ${tableIndex + 1 - offset}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}
