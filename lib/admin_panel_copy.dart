// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  final List<Map<String, String>> data = [
    {
      'groupname': 'Warrior 1',
      'leader_id': '21k-3210',
      'group_member_1': '21k-3322',
      'group_member_2': '22k2212',
      'group_member_3': '23k4312',
    },
    {
      'groupname': 'Warrior 2',
      'leader_id': '21k-1234',
      'group_member_1': '21k-5678',
      'group_member_2': '22k9876',
      'group_member_3': '23k5432',
    },
    {
      'groupname': 'Warrior 3',
      'leader_id': '21k-4324',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    {
      'groupname': 'Warrior 3',
      'leader_id': '21k-4321',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    {
      'groupname': 'Warrior 4',
      'leader_id': '21k-4232',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    {
      'groupname': 'Warrior 5',
      'leader_id': '21k-4784',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    {
      'groupname': 'Warrior 6',
      'leader_id': '21k-4632',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    {
      'groupname': 'Warrior 7',
      'leader_id': '21k-4364',
      'group_member_1': '21k-8765',
      'group_member_2': '22k1234',
      'group_member_3': '23k9876',
    },
    // Add more data here
  ];

  final TextStyle smallTextStyle = TextStyle(fontSize: 9);

  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredData = [];

  final TextEditingController updateLeaderIdController =
      TextEditingController();
  final TextEditingController updateGroupNameController =
      TextEditingController();
  final TextEditingController updateGroupMember1Controller =
      TextEditingController();
  final TextEditingController updateGroupMember2Controller =
      TextEditingController();
  final TextEditingController updateGroupMember3Controller =
      TextEditingController();

  bool searching = false; // Track searching mode

  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  void _showUpdateDialog(int dataIndex) {
    updateLeaderIdController.text = filteredData[dataIndex]['leader_id']!;
    updateGroupNameController.text = filteredData[dataIndex]['groupname']!;
    updateGroupMember1Controller.text =
        filteredData[dataIndex]['group_member_1']!;
    updateGroupMember2Controller.text =
        filteredData[dataIndex]['group_member_2']!;
    updateGroupMember3Controller.text =
        filteredData[dataIndex]['group_member_3']!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Entry', style: smallTextStyle),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: updateGroupNameController,
                  decoration: InputDecoration(
                    labelText: 'Group Name',
                    labelStyle: smallTextStyle,
                  ),
                ),
                TextField(
                  controller: updateLeaderIdController,
                  decoration: InputDecoration(
                    labelText: 'Leader ID',
                    labelStyle: smallTextStyle,
                  ),
                ),
                TextField(
                  controller: updateGroupMember1Controller,
                  decoration: InputDecoration(
                    labelText: 'Group Member 1',
                    labelStyle: smallTextStyle,
                  ),
                ),
                TextField(
                  controller: updateGroupMember2Controller,
                  decoration: InputDecoration(
                    labelText: 'Group Member 2',
                    labelStyle: smallTextStyle,
                  ),
                ),
                TextField(
                  controller: updateGroupMember3Controller,
                  decoration: InputDecoration(
                    labelText: 'Group Member 3',
                    labelStyle: smallTextStyle,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: smallTextStyle),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Update', style: smallTextStyle),
              onPressed: () {
                setState(() {
                  // Update the data in the original list with the new values
                  final originalIndex = data.indexOf(filteredData[dataIndex]);
                  data[originalIndex]['groupname'] =
                      updateGroupNameController.text;
                  data[originalIndex]['leader_id'] =
                      updateLeaderIdController.text;
                  data[originalIndex]['group_member_1'] =
                      updateGroupMember1Controller.text;
                  data[originalIndex]['group_member_2'] =
                      updateGroupMember2Controller.text;
                  data[originalIndex]['group_member_3'] =
                      updateGroupMember3Controller.text;

                  // Update the filtered data as well
                  filteredData[dataIndex] = {
                    'groupname': updateGroupNameController.text,
                    'leader_id': updateLeaderIdController.text,
                    'group_member_1': updateGroupMember1Controller.text,
                    'group_member_2': updateGroupMember2Controller.text,
                    'group_member_3': updateGroupMember3Controller.text,
                  };
                });

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data updated successfully.',
                        style: smallTextStyle),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void filterData(String searchText) {
    setState(() {
      filteredData = data.where((item) {
        final leaderId = item['leader_id']!.toLowerCase();
        final groupName = item['groupname']!.toLowerCase();
        return leaderId.contains(searchText.toLowerCase()) ||
            groupName.contains(searchText.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin panel'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          if (searching) // Show the back arrow only when searching
            IconButton(
              icon: Icon(Icons.arrow_back), // Back arrow icon
              onPressed: () {
                // Clear the search and go back to the grid view
                setState(() {
                  searchController.clear();
                  filterData('');
                  searching = false; // Exit searching mode
                });
              },
            ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                searching = true; // Enter searching mode
              });
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Search'),
                    content: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Search by Leader ID or Group Name',
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Search'),
                        onPressed: () {
                          filterData(searchController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredData.length + 1, // Add 1 for the header row
        itemBuilder: (context, index) {
          if (index == 0) {
            // Header Row
            return Container(
              color: Colors.green,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text('GroupName',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8)),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text('Leader ID',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text('Group Member 1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text('Group Member 2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text('Group Member 3',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text('Op',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9)),
                    ),
                  ),
                ],
              ),
            );
          } else {
            final dataIndex = index - 1;
            return Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(' ${filteredData[dataIndex]['groupname']}',
                          style: smallTextStyle),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text(' ${filteredData[dataIndex]['leader_id']}',
                          style: smallTextStyle),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text(
                          ' ${filteredData[dataIndex]['group_member_1']}',
                          style: smallTextStyle),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text(
                          ' ${filteredData[dataIndex]['group_member_2']}',
                          style: smallTextStyle),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.black),
                  Expanded(
                    child: Center(
                      child: Text(
                          ' ${filteredData[dataIndex]['group_member_3']}',
                          style: smallTextStyle),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showUpdateDialog(
                              data.indexOf(filteredData[dataIndex]));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    Text('Delete Entry', style: smallTextStyle),
                                content: Text(
                                    'Are you sure you want to delete this entry?',
                                    style: smallTextStyle),
                                actions: <Widget>[
                                  TextButton(
                                    child:
                                        Text('Cancel', style: smallTextStyle),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Delete',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 9)),
                                    onPressed: () {
                                      data.remove(filteredData[dataIndex]);
                                      filterData(searchController.text);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Data deleted successfully.',
                                              style: smallTextStyle),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
