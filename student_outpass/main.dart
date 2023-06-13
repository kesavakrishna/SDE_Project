import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Outpass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/secondPage': (context) => SecondPage(),
        '/outpassHistoryPage': (context) => OutpassHistoryPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _arrivalDateEditingController = TextEditingController();
  TextEditingController _reasonEditingController = TextEditingController();
  String _displayText = '';

  void _submitText() {
    setState(() {
      String fromDate = _dateEditingController.text;
      String tillDate = _arrivalDateEditingController.text;
      String reason = _reasonEditingController.text;
      _displayText =
          'From Date: $fromDate\nTill Date: $tillDate\nReason: $reason';
      Navigator.pushNamed(context, '/secondPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outpass Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'From Date',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dateEditingController,
              decoration: InputDecoration(
                hintText: 'Enter Date and Time for leave',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Till Date',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _arrivalDateEditingController,
              decoration: InputDecoration(
                hintText: 'Enter Arrival Date and Time',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Reason',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _reasonEditingController,
              decoration: InputDecoration(
                hintText: 'State Reason for Leave',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitText,
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            Text(
              _displayText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have successfully requested for outpass.',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/outpassHistoryPage');
              },
              child: Text('Outpass History'),
            ),
          ],
        ),
      ),
    );
  }
}

class OutpassHistoryPage extends StatelessWidget {
  // Dummy data for the outpass history
  final List<Map<String, String?>> outpassData = [
    {
      'fromDate': '2023-05-15',
      'tillDate': '2023-05-18',
      'reason': 'Family function',
      'issuedBy': 'John Doe',
      'status': 'Approved',
    },
    {
      'fromDate': '2023-05-20',
      'tillDate': '2023-05-23',
      'reason': 'Vacation',
      'issuedBy': 'Jane Smith',
      'status': 'Rejected',
    },
    // Add more outpass data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('From Date')),
            DataColumn(label: Text('Till Date')),
            DataColumn(label: Text('Reason')),
            DataColumn(label: Text('Issued By')),
            DataColumn(label: Text('Status')),
          ],
          rows: outpassData.map((data) {
            return DataRow(
              cells: [
                DataCell(Text(data['fromDate'] ?? '')),
                DataCell(Text(data['tillDate'] ?? '')),
                DataCell(Text(data['reason'] ?? '')),
                DataCell(Text(data['issuedBy'] ?? '')),
                DataCell(Text(data['status'] ?? '')),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
