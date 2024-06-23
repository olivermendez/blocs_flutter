import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.push(location);
      },
    );
  }
}
