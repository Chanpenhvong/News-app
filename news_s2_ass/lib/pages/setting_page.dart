import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.settings),
        ],
        backgroundColor: const Color.fromARGB(255, 60, 61, 61),
        title: Text("SETTINGS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 235, 232, 232),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(

          children: [
            _buildHeader("Account",),
            _buildSettingsItem(
              context,
              icon: Icons.account_circle,
              title: "Profile",
              onTap: () {
                // Navigate to profile settings
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.security,
              title: "Security",
              onTap: () {
                // Navigate to security settings
              },
            ),
            _buildDivider(),
            _buildHeader("Preferences"),
           ExpansionTile(
  initiallyExpanded: true,
  title: Text("Notification"),
  children: [
    ListTile(
      leading: Icon(Icons.notifications),
      title: Text("General Notifications"),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        // Add functionality for tapping General Notifications
        // For example, you can navigate to another screen or perform an action
      },
    ),
    ListTile(
      leading: Icon(Icons.email),
      title: Text("Email Notifications"),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        // Add functionality for tapping Email Notifications
        // For example, you can navigate to another screen or perform an action
      },
    ),
    ListTile(
      leading: Icon(Icons.sms),
      title: Text("SMS Notifications"),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        // Add functionality for tapping SMS Notifications
        // For example, you can navigate to another screen or perform an action
      },
    ),
  ],
),

             ExpansionTile(
              initiallyExpanded: true,
              title: Text("Language"),
              children: [
                ListTile(
                  leading: Text(
                    "ខ្មែរ",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text("ប្តូរទៅភាសាខ្មែរ"),
                  trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                  leading: Text(
                    "EN",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text("Change To English"),
                  trailing: Icon(Icons.navigate_next),
                ),
              ],
            ),
            
            _buildDivider(),
            _buildHeader("Support"),
            _buildSettingsItem(
              context,
              icon: Icons.help,
              title: "Help",
              onTap: () {
                // Navigate to help settings
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.info,
              title: "About",
              onTap: () {
                // Navigate to about settings
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 17, 17, 17),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  Widget _buildSettingsItem(BuildContext context, {required IconData icon, required String title, required Function onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 10, 10, 10)),
      title: Text(title, style: TextStyle(color: const Color.fromARGB(255, 17, 17, 17))),
      trailing: Icon(Icons.navigate_next, color: const Color.fromARGB(255, 14, 14, 14)),
      onTap: () => onTap(),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.white54);
  }
}