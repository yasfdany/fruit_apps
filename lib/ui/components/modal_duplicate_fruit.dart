import 'package:flutter/material.dart';

import 'ripple_button.dart';

class ModalDuplicateFruit extends StatelessWidget {
  const ModalDuplicateFruit({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final MapEntry entry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: const Text(
                  "Duplicate Fruit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "Most duplicate fruit in the list is ${entry.key} with total of ${entry.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RippleButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "close",
                    textColor: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
