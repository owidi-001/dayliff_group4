import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTabs extends StatelessWidget {
  const SettingsTabs(
      {Key? key,
      required this.text,
      required this.icon,
      this.press,
      this.isSwitch = false})
      : super(key: key);

  final String text;
  final IconData? icon;
  final VoidCallback? press;
  final bool isSwitch;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: press,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          isSwitch
              ? CupertinoSwitch(
                  value: true,
                  onChanged: (value) {
                    press!();
                  })
              : Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
        ],
      ),
    );
  }
}
