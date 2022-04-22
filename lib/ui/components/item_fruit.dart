import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_apps/data/controillers/fruit_controller.dart';
import 'package:get/get.dart';

import '../../data/services/entities/fruit_response.dart';
import 'ripple_button.dart';

class ItemFruit extends StatelessWidget {
  ItemFruit({
    Key? key,
    required this.fruit,
    required this.onTap,
  }) : super(key: key);

  final Fruit fruit;
  final VoidCallback onTap;
  final FruitController fruitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      radius: 4,
      shadow: BoxShadow(
        offset: const Offset(0, 12),
        color: Colors.black.withOpacity(0.06),
        blurRadius: 12,
      ),
      enableShadow: true,
      color: Colors.white,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: (fruitController.imageReference[fruit.name] ?? "")
                          .isEmpty
                      ? "https://justfruitsandexotics.com/wp-content/uploads/placeholder.jpg"
                      : fruitController.imageReference[fruit.name]!,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  fruit.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          Text(
            "total : Rp." + fruit.price.toString(),
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
