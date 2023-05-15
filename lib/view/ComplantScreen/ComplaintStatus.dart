import 'package:flutter/material.dart';


// controller/complaint_controller.dart

// controller/complaint_controller.dart

class ComplaintController {
  // List of complaints
  List<Complaint> _complaints = [];

  // Method to add a complaint
  void addComplaint(Complaint complaint) {
    _complaints.add(complaint);
  }

  // Method to update the status of a complaint
  void updateComplaintStatus(String complaintId, String status) {
    for (var complaint in _complaints) {
      if (complaint.complaintId == complaintId) {
        complaint.status = status;
        break;
      }
    }
  }

  // Method to get the status of a complaint by complaintId
  String getComplaintStatus(String complaintId) {
    for (var complaint in _complaints) {
      if (complaint.complaintId == complaintId) {
        return complaint.status;
      }
    }
    return 'Complaint not found';
  }

  // Method to get a complaint by complaintId
  Complaint? getComplaintById(String complaintId) {
    for (var complaint in _complaints) {
      if (complaint.complaintId == complaintId) {
        return complaint;
      }
    }
    return null;
  }
}


// model/complaint.dart
class Complaint {
  final String complaintId;
  final String name;
  final String contactInfo;
  final String complaintDetails;
  late final String status;

  Complaint({
    required this.complaintId,
    required this.name,
    required this.contactInfo,
    required this.complaintDetails,
    required this.status,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaintId: json['complaintId'] as String,
      name: json['name'] as String,
      contactInfo: json['contactInfo'] as String,
      complaintDetails: json['complaintDetails'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'complaintId': complaintId,
      'name': name,
      'contactInfo': contactInfo,
      'complaintDetails': complaintDetails,
      'status': status,
    };
  }
}

class ComplaintStatus extends StatelessWidget {
  final String complaintId;

  ComplaintStatus({required this.complaintId});

  @override
  Widget build(BuildContext context) {
    ComplaintController _complaintController = ComplaintController();
    Complaint? _complaint = _complaintController.getComplaintById(complaintId);



    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Status'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _complaint == null
            ? Center(child: Text('Complaint not found'))
            : Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complaint ID: ${_complaint.complaintId}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Name: ${_complaint.name}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Contact Information: ${_complaint.contactInfo}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Complaint Details: ${_complaint.complaintDetails}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Status: ${_complaint.status}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: _complaint.status == 'Pending'
                        ? Colors.orange
                        : _complaint.status == 'Resolved'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
