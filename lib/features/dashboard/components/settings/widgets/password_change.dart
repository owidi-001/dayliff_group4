import 'package:flutter/material.dart';

class PasswordChangeForm extends StatefulWidget {
  const PasswordChangeForm({super.key});

  @override
  State<PasswordChangeForm> createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _currentPassword,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(hintText: "Current Password"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _newPassword,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'New password is required';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(hintText: "New Password"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _confirmPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    }

                    if (_newPassword.text != _confirmPassword.text) {
                      return 'Password mismatch';
                    }

                    return null;
                  },
                  decoration:
                      const InputDecoration(hintText: "Confirm Password"),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )),
      ),
      title: const Text('Change Password'),
      actions: <Widget>[
        InkWell(
          child: const Text('Cancel'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // context.read<AuthBloc>().add(
                //       UpdateProfile(
                //         data: ProfileData(
                //             name: _name.text,
                //             phoneNumber: _phone.text,
                //             email: _email.text),
                //       ),
                //     );
                Navigator.of(context).pop();
              }
            },
            child: const Text("Change"))
      ],
    );
  }
}
