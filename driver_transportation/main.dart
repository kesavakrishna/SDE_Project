import 'package:flutter/material.dart';

void main() => runApp(TransportApp());

class TransportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransportFormPage(),
    );
  }
}

class TransportFormPage extends StatelessWidget {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Application'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: fromController,
              ),
              SizedBox(height: 6),
              Text(
                'To',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: toController,
              ),
              SizedBox(height: 6),
              Text(
                'Date',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: dateController,
              ),
              SizedBox(height: 6),
              Text(
                'Time',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: timeController,
              ),
              SizedBox(height: 6),
              Text(
                'Seats',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: seatsController,
              ),
              SizedBox(height: 6),
              Text(
                'Price',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              TextField(
                controller: priceController,
              ),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
              ),
              SizedBox(height: 16), // Add some additional spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Customer Details',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Phone No')),
                  DataColumn(label: Text('From')),
                  DataColumn(label: Text('To')),
                  DataColumn(label: Text('Price')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('2023-06-02')),
                    DataCell(Text('John Doe')),
                    DataCell(Text('1234567890')),
                    DataCell(Text('City A')),
                    DataCell(Text('City B')),
                    DataCell(Text('\$50')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2023-06-03')),
                    DataCell(Text('Jane Smith')),
                    DataCell(Text('9876543210')),
                    DataCell(Text('City C')),
                    DataCell(Text('City D')),
                    DataCell(Text('\$75')),
                  ]),
                  // Add more rows as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
