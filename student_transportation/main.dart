import 'package:flutter/material.dart';

void main() {
  runApp(AvailableTransportsApp());
}

class AvailableTransportsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Available Transports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AvailableTransportsScreen(),
    );
  }
}

class AvailableTransportsScreen extends StatefulWidget {
  @override
  _AvailableTransportsScreenState createState() =>
      _AvailableTransportsScreenState();
}

class _AvailableTransportsScreenState extends State<AvailableTransportsScreen> {
  String searchQuery = '';

  void navigateToSearchResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(searchQuery),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Transports'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search for nearest metro station',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              navigateToSearchResults();
            },
            child: Text('Search'),
          ),
          Expanded(
            child: Container(
              // Here you can display the search results or any other content
              // based on the search query.
              child: Center(
                child: Text(
                  'Search query: $searchQuery',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  final String searchQuery;

  SearchResultsScreen(this.searchQuery);

  void navigateToBookNowPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookNowScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('From')),
            DataColumn(label: Text('To')),
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Availability')),
            DataColumn(label: Text('Book')),
          ],
          rows: <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Text('01/06/2023')),
              DataCell(Text('Mahindra University')),
              DataCell(Text('Miyapur Metro Station')),
              DataCell(Text('06:00 PM')),
              DataCell(Text('\₹600')),
              DataCell(Text('1/4')),
              DataCell(
                ElevatedButton(
                  onPressed: () {
                    navigateToBookNowPage(context);
                  },
                  child: Text('Book Now'),
                ),
              ),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('02/06/2023')),
              DataCell(Text('Mahindra University')),
              DataCell(Text('Miyapur Metro Station')),
              DataCell(Text('06:00 PM')),
              DataCell(Text('\₹600')),
              DataCell(Text('3/4')),
              DataCell(
                ElevatedButton(
                  onPressed: () {
                    navigateToBookNowPage(context);
                  },
                  child: Text('Book Now'),
                ),
              ),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text('03/06/2023')),
              DataCell(Text('Mahindra University')),
              DataCell(Text('Miyapur Metro Station')),
              DataCell(Text('03:00 PM')),
              DataCell(Text('\₹500')),
              DataCell(Text('Full')),
              DataCell(
                Text('Book Now', style: TextStyle(color: Colors.grey)),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class BookNowScreen extends StatelessWidget {
  void showCancellationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Cancelled'),
          content: Text('Your request has been cancelled.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showConfirmationPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Expecting you to be at the location before time.\n'
              'Waiting time of around 5 mins.\n'
              'It’s not our responsibility if the vehicle leaves after the waiting time.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Agree on all the conditions',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showConfirmationPage(context);
                  },
                  child: Text('Confirm'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    showCancellationPopup(context);
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Confirmed',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32.0),
            Text(
              'From: Mahindra University',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'To: Miyapur Metro',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Date: 23/05/2023',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Time: 06:00 P.M',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Price: ₹600',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Driver Details',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32.0),
            Text(
              'Driver’s Name: John Doe',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Vehicle No: TS01AS1234',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Phone No: 1234567890',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
