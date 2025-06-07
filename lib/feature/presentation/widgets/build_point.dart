import 'package:flutter/material.dart';

class SessionTypeSelector extends StatefulWidget {
  @override
  _SessionTypeSelectorState createState() => _SessionTypeSelectorState();
}

class _SessionTypeSelectorState extends State<SessionTypeSelector> {
  String selectedOption = 'In Person';

  Widget buildOption({
    required String label,
    required IconData icon,
    required Color iconColor,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(label),
      trailing: Radio<String>(
        value: label,
        groupValue: selectedOption,
        onChanged: (value) {
          setState(() {
            selectedOption = value!;
          });
        },
        activeColor: Colors.blue,
      ),
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildOption(
          label: 'In Person',
          icon: Icons.people,
          iconColor: Colors.blue,
        ),
        buildOption(
          label: 'Video Call',
          icon: Icons.videocam,
          iconColor: Colors.green,
        ),
        buildOption(
          label: 'Phone Call',
          icon: Icons.phone,
          iconColor: Colors.red,
        ),
      ],
    );
  }
}
