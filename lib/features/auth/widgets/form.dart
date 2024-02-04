import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.hint, required this.onTap});

  final String hint;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(StaticColors.primary),
        foregroundColor: MaterialStatePropertyAll(StaticColors.onPrimary),
        fixedSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(hint),
    );
  }
}

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon(
      {super.key, required this.hint, required this.onTap, required this.icon});

  final String hint;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(StaticColors.primary),
        foregroundColor: MaterialStatePropertyAll(StaticColors.onPrimary),
        fixedSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onTap,
      icon: icon,
      label: Text(hint),
    );
  }
}

class PrimaryOutlined extends StatelessWidget {
  const PrimaryOutlined({super.key, required this.hint, required this.onTap});

  final String hint;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        // backgroundColor: MaterialStatePropertyAll(StaticColors.primary),
        foregroundColor: MaterialStatePropertyAll(StaticColors.primary),
        fixedSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: StaticColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(hint),
    );
  }
}
