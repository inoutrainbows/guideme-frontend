import 'package:flutter/material.dart';
import 'emergencycontactScreen2.dart';
import 'main.dart'; // Import your home page file here

class SittingsScreen extends StatelessWidget {
  const SittingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to the home page when the back button is pressed
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const homeScreen()), // Replace homeScreen with your home page widget
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: null,
          title: const Text("Settings", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black),
                  ),
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.contact_phone),
                      ),
                      const Text("        Contact"),
                      IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EmergencyContactScreen2()),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(
                  width: 300,
                  child: FilterContainer(
                    icon: Icons.language,
                    text: 'Language',
                    options: ['Arabic', 'English'],
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(
                  width: 300,
                  child: FilterContainer(
                    icon: Icons.warning,
                    text: 'Warning Type',
                    options: ['Vibration', 'Voice'],
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

class FilterContainer extends StatefulWidget {
  final IconData icon;
  final String text;
  final List<String> options;

  const FilterContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.options,
  });

  @override
  _FilterContainerState createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  bool showOptions = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showOptions = !showOptions;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon),
                const SizedBox(width: 10.0),
                Text(widget.text),
                Icon(showOptions ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ],
            ),
            if (showOptions)
              Column(
                children: widget.options
                    .map((option) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(option),
                ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
