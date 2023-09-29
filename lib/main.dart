import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Feed'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? VerticalImageList()
                : HorizontalImageGrid();
          },
        ),
      ),
    );
  }
}

class VerticalImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text("Sufyan"),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  color: Colors.black,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HorizontalImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? 1
              : 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Sufyan"),
                  Image.network(
                    'https://via.placeholder.com/150', // Replace with the actual image URL
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
