import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DynamicContainerList()));
}

class DynamicContainerList extends StatefulWidget {
  @override
  _DynamicContainerListState createState() => _DynamicContainerListState();
}

class _DynamicContainerListState extends State<DynamicContainerList> {
  List<Map<String, dynamic>> containers = [];

  void _addContainer() {
    setState(() {
      containers.add({
        'id': DateTime.now().toString(), // Um identificador único
        'color': Colors.primaries[containers.length % Colors.primaries.length], // Cores variadas
      });
    });
  }

  void _removeContainer(String id) {
    setState(() {
      containers.removeWhere((element) => element['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista Dinâmica de Containers")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: containers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: containers[index]['color'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Container ${index + 1}", style: TextStyle(color: Colors.white)),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () => _removeContainer(containers[index]['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addContainer,
              child: Text("Adicionar Container"),
            ),
          ),
        ],
      ),
    );
  }
}
