import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_apps/data/controillers/fruit_controller.dart';
import 'package:fruit_apps/data/controillers/user_controller.dart';
import 'package:fruit_apps/data/services/entities/fruit_response.dart';
import 'package:fruit_apps/ui/components/ripple_button.dart';
import 'package:fruit_apps/ui/login_screen.dart';
import 'package:get/get.dart';

import 'components/item_fruit.dart';
import 'components/modal_duplicate_fruit.dart';

class HomeScreen extends StatefulWidget {
  static const route = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find();
  final FruitController fruitController = Get.put(FruitController());
  final RxString selectedImage = RxString("");

  @override
  void initState() {
    super.initState();
    fruitController.getFruit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fruit List",
        ),
        actions: [
          IconButton(
            onPressed: () {
              userController.logout().then((_) {
                Navigator.pushReplacementNamed(context, LoginScreen.route);
              });
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => fruitController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Scrollbar(
                        isAlwaysShown: true,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 24,
                          ),
                          itemCount: fruitController.fruits.length,
                          itemBuilder: (context, index) {
                            Fruit fruit = fruitController.fruits[index];

                            return ItemFruit(
                              fruit: fruit,
                              onTap: () {
                                selectedImage.value = fruitController
                                        .imageReference
                                        .containsKey(fruit.name)
                                    ? fruitController
                                        .imageReference[fruit.name]!
                                    : "";
                              },
                            );
                          },
                        ),
                      ),
              ),
            ),
            Container(height: 52),
            Center(
              child: Obx(
                () => CachedNetworkImage(
                  imageUrl: selectedImage.value.isEmpty
                      ? "https://justfruitsandexotics.com/wp-content/uploads/placeholder.jpg"
                      : selectedImage.value,
                  width: 240,
                  height: 240,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(42),
                    child: RippleButton(
                      onTap: () {
                        showDuplicateFruit(context);
                      },
                      text: "Show Duplicate Fruit",
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDuplicateFruit(BuildContext context) {
    Map<String, int> container = {};
    for (Fruit fruit in fruitController.fruits) {
      if (container.containsKey(fruit.name)) {
        container[fruit.name] = container[fruit.name]! + 1;
      } else {
        container[fruit.name] = 1;
      }
    }

    int biggerCount = 0;
    String fruitName = "";

    for (MapEntry entry in container.entries) {
      if (entry.value > biggerCount) {
        biggerCount = entry.value;
        fruitName = entry.key;
      }
    }

    showDialog(
      context: context,
      builder: (context) => ModalDuplicateFruit(
        entry: MapEntry(fruitName, biggerCount),
      ),
    );
  }
}
