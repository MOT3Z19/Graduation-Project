import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/ComplaintController.dart';

// Assuming you already have Complaint and ComplaintController classes defined

class ComplaintListPage extends StatelessWidget {
  final ComlaintController complaintController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('Filter by Type: '),
                Obx(
                      () => DropdownButton<String>(
                    value: complaintController.selectedType.value,
                    onChanged: (value) {
                      complaintController.selectedType.value = value!;
                      complaintController.fetchComplaints(value);
                    },
                    items: [
                      DropdownMenuItem(
                        value: '',
                        child: Text('All'),
                      ),
                      DropdownMenuItem(
                        value: 'Type A',
                        child: Text('Type A'),
                      ),
                      DropdownMenuItem(
                        value: 'Type B',
                        child: Text('Type B'),
                      ),
                      // Add more dropdown items as needed
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (complaintController.complaints.isEmpty) {
                  return Center(
                    child: Text('No complaints found.'),
                  );
                }

                return ListView.builder(
                  itemCount: complaintController.complaints.length,
                  itemBuilder: (context, index) {
                    final complaint = complaintController.complaints[index];
                    return ListTile(
                      title: Text(complaint.title),
                      subtitle: Text(complaint.description),
                      trailing: Text(complaint.type),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

