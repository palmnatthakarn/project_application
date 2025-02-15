import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class DormDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final details = args?['details'] as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(args?['title'] ?? 'รายละเอียดหอพัก'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (args?['image'] != null)
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  args!['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: Icon(Icons.error, size: 50, color: Colors.white),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args?['title'] ?? 'ไม่พบชื่อหอพัก',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    args?['subtitle'] ?? 'ไม่พบรายละเอียด',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                  Divider(height: 24),
                  _buildInfoItem(
                    icon: Icons.attach_money,
                    title: 'ราคา',
                    content: details?['price'] ?? 'ไม่ระบุ',
                  ),
                  SizedBox(height: 14),
                  _buildInfoItem(
                    icon: Icons.hotel,
                    title: 'ประเภทห้อง',
                    content: (details?['roomTypes'] as List?)?.join(' ') ??
                        'ไม่ระบุ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    String? content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                content ?? 'ไม่ระบุ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
