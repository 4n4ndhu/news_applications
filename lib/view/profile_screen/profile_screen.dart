import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
            SizedBox(height: 20),

            // Name
            Text(
              'Anandhu S',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Anandhu@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the edit profile screen
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Settings and Log Out Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Navigate to settings screen
                    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                  },
                  icon: Icon(Icons.settings),
                  color: Colors.grey[600],
                  iconSize: 30,
                ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: () {
                    // Perform logout action
                    // Example: Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: Icon(Icons.logout),
                  color: Colors.grey[600],
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
