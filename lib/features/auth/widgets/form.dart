import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.hint,
      required this.onTap,
      this.isLoading = false,
      this.trailing});

  final String hint;
  final Function() onTap;
  final bool isLoading;
  final Widget? trailing;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint),
          trailing != null
              ? trailing!
              : isLoading
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                  : const Icon(FontAwesomeIcons.arrowRight)
        ],
      ),
    );
  }
}

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon(
      {super.key,
      required this.hint,
      required this.onTap,
      required this.icon,
      this.isLoading = false});

  final String hint;
  final Widget icon;
  final Function() onTap;
  final bool isLoading;

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
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint),
          if (isLoading) const CircularProgressIndicator()
        ],
      ),
    );
  }
}

class PrimaryOutlined extends StatelessWidget {
  const PrimaryOutlined(
      {super.key,
      required this.hint,
      required this.onTap,
      this.isLoading = false});

  final String hint;

  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint),
          if (isLoading) const CircularProgressIndicator()
        ],
      ),
    );
  }
}
