import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:   ProfileScreen(),
      theme: ThemeData.dark(),
    );
  }
}


class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tructive',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ready to Transform Your Fleet Operations?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tructive',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back To Tructive',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Please sign in with your account',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Text(
                        'I accept the terms and conditions',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: isChecked
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isChecked ? Colors.blue : Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tructive', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'Connect', Icons.link, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectScreen()));
            }),
            SizedBox(height: 20),
            _buildButton(context, 'History', Icons.history, Colors.green, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
            }),
            SizedBox(height: 20),
            _buildButton(context, 'Chat', Icons.chat, Colors.orange, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
            }),
            SizedBox(height: 20),
            _buildButton(context, 'Profile', Icons.person, Colors.purple, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// Dummy Screens for Navigation

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tructive', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DEVICES",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(100),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OBD ||",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    _buildDeviceItem("Sample"),
                    _buildDeviceItem("Sample"),
                    _buildDeviceItem("Sample"),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle select adaptor action
                    },
                    child: Text("Select Adaptor", style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceItem(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        name,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

class TripScreen extends StatefulWidget {
  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  bool tripStarted = false;
  int timer = 0; // Timer in seconds
  String timerText = "00:00:00";

  // Timer and data fields
  String acceleration = "0";
  String braking = "0";
  String excessiveIdling = "0";
  String speed = "0";
  String rpm = "0";
  String carCondition = "";

  void startTimer() {
    setState(() {
      tripStarted = true;
    });
    // Timer Logic
    Future.delayed(Duration(seconds: 1), () {
      if (tripStarted) {
        setState(() {
          timer++;
          int hours = timer ~/ 3600;
          int minutes = (timer % 3600) ~/ 60;
          int seconds = timer % 60;
          timerText = "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        });
        startTimer(); // Recursively call to continue the timer
      }
    });
  }

  void stopTimer() {
    setState(() {
      tripStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Details'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Timer display
            Text(
              "Timer: $timerText",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            // Card for trip info
            Card(
              elevation: 6,
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildInfoRow("Acceleration", acceleration),
                    buildInfoRow("Braking", braking),
                    buildInfoRow("Excessive Idling", excessiveIdling),
                    buildInfoRow("Speed", speed),
                    buildInfoRow("RPM", rpm),
                    buildInfoRow("Car Condition", carCondition),
                    SizedBox(height: 20),
                    // Warning button that navigates to warning screen
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WarningScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Warning', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Buttons
            ElevatedButton(
              onPressed: tripStarted ? stopTimer : startTimer,
              child: Text(tripStarted ? 'End Trip' : 'Start Trip'),
              style: ElevatedButton.styleFrom(
                backgroundColor: tripStarted ? Colors.red : Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation to different screens
          if (index == 0) {
            // Go to Home
          } else if (index == 1) {
            // Go to Chat
          } else if (index == 2) {
            // Go to Profile
          }
        },
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}

// WarningScreen - where warning details are displayed
class WarningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Warning Details"), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "This is the Warning Screen. Please proceed with caution.",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture Section
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://www.example.com/profile.jpg'), // Replace with user image URL
              ),
              SizedBox(height: 16),
              // Name and Username Section
              Text(
                'John Doe', // Replace with dynamic user name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                '@johndoe', // Replace with dynamic username
                style: TextStyle(fontSize: 18, color: Colors.white54),
              ),
              SizedBox(height: 40),
              // Terms of Use and Privacy Policy
              GestureDetector(
                onTap: () {
                  // Navigate to Terms of Use
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsOfUseScreen()),
                  );
                },
                child: Text(
                  'Terms of Use',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to Privacy Policy
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                  );
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(height: 40),
              // History Section
              GestureDetector(
                onTap: () {
                  // Navigate to History Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  );
                },
                child: Text(
                  'History',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(height: 40),
              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // Handle logout logic
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle logout
                            Navigator.pop(context); // Close the dialog
                            // Perform the logout action (e.g., clear session or navigate to login screen)
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("History Screen")), body: Center(child: Text("History Screen")));
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Chat Screen")), body: Center(child: Text("Chat Screen")));
  }
}

class TermsOfUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms of Use'), backgroundColor: Colors.black),
      body: Center(
        child: Text(
          'Terms of Use Content Here...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Policy'), backgroundColor: Colors.black),
      body: Center(
        child: Text(
          'Privacy Policy Content Here...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}