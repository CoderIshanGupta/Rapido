import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Ride> _rides = []; // All rides
  List<Ride> _searchResults = []; // Search results

  // Simulate fetching rides
  void _loadRides() {
    // You can replace this with an API call or Firebase query
    setState(() {
      _rides = [
        Ride(name: 'Ride 1', description: 'Description 1'),
        Ride(name: 'Ride 2', description: 'Description 2'),
        Ride(name: 'Ride 3', description: 'Description 3'),
      ];
    });
  }

  // Search rides based on query
  void _searchRides(String query) {
    setState(() {
      _searchResults = _rides
          .where((ride) =>
              ride.name.toLowerCase().contains(query.toLowerCase()) ||
              ride.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadRides(); // Load rides when screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Rides')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for rides...',
                suffixIcon: _isSearching
                    ? CircularProgressIndicator()
                    : Icon(Icons.search),
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  setState(() {
                    _searchResults.clear(); // Clear search results if empty
                  });
                } else {
                  setState(() {
                    _isSearching = true;
                  });
                  _searchRides(query); // Search rides based on the query
                }
              },
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty && !_isSearching
                ? Center(child: Text('No rides found.'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final ride = _searchResults[index];
                      return ListTile(
                        title: Text(ride.name),
                        subtitle: Text(ride.description),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Ride {
  final String name;
  final String description;

  Ride({required this.name, required this.description});
}