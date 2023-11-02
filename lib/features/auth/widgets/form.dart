import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.hint, required this.onTap});

  final String hint;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).primaryColorDark),
        foregroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
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
