import 'package:flutter/material.dart';
import 'package:flutter_application_1/service.dart';

class Gets extends StatelessWidget {
  final String token;
  final ApiGet apiGet = ApiGet();

  Gets({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiGet.getdetails(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading profile"));
          }
          if (snapshot.hasData) {
            final data = snapshot.data as Map<String, dynamic>;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name: ${data['name']}"),
                  Text("Email: ${data['email']}"),
                ],
              ),
            );
          }

          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}