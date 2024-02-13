import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileDialog extends StatefulWidget {
  const UpdateProfileDialog({super.key});

  @override
  State<UpdateProfileDialog> createState() => _UpdateProfileDialogState();
}

class _UpdateProfileDialogState extends State<UpdateProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _user = AuthenticationRepository.instance.user;
    _name.text = _user?.name ?? "";
    _email.text = _user?.email ?? "";
    _phone.text = _user?.phoneNumber ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Full Names"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email address';
                    }

                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Email Address"),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _phone,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly,
                  //   LengthLimitingTextInputFormatter(12)
                  // ],
                  validator: (value) {
                    if (value!.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    if (!RegExp(r'^(07|01|2541|2547)\d{8}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Phone number"),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )),
      ),
      title: const Text('Profile update'),
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
                context.read<AuthBloc>().add(
                      UpdateProfile(
                        data: ProfileData(
                            name: _name.text,
                            phoneNumber: _phone.text,
                            email: _email.text),
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            child: const Text("Save"))
      ],
    );
  }
}
