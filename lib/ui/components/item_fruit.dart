import 'package:flutter/material.dart';

import '../../data/services/entities/fruit_response.dart';
import 'ripple_button.dart';

class ItemFruit extends StatelessWidget {
  const ItemFruit({
    Key? key,
    required this.fruit,
    required this.onTap,
  }) : super(key: key);

  final Fruit fruit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      border: Border.all(color: Colors.grey),
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fruit.name,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            "total: " + fruit.price.toString(),
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
