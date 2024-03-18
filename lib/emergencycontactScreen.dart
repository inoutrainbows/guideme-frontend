import 'package:flutter/material.dart';
import 'main.dart';

class EmergencyContactScreen extends StatefulWidget {
  const EmergencyContactScreen({super.key});

  @override
  _EmergencyContactScreenState createState() =>
      _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background1.jpg'), // Background image path
              fit: BoxFit.cover,
            ),
          ),
          child: AppBar(
            title: const Text('Emergency Contact'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'), // Background image path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 10.0), // Adjust padding to center the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contact Name',
                  border: OutlineInputBorder(),
                  filled: true, // Add this line
                  fillColor: Colors.white, // Add this line
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  filled: true, // Add this line
                  fillColor: Colors.white, // Add this line
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                  ),
                  child: const Text('Add'),
                ),
              ),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          onPressed: () {
            // Navigate to HomeScreen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const homeScreen(),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black, // Changed from 'primary' to 'foregroundColor'
          ),
          child: const Text(
            'Skip',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
