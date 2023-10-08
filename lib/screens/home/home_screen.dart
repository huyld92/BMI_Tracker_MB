// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_health_menu/widgets/custom_text_form_field.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'What would you like\nto cook today?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://res.cloudinary.com/dh2srrs6l/image/upload/v1696748077/msab7kdm9zpuzqew12jq.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  prefixicon: Icon(Icons.search),
                  hintTxt: 'Search an ingredient or a recipe',
                ),
                const SizedBox(
                  height: 15,
                ),
                const PersonalInfo(
                  height: 183,
                  weight: 85,
                  age: 23,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BMIContainer(topText: '18.4', bottomText: 'BMI'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BMIContainer(
                            topText: 'Minimum Calories', bottomText: '1300'),
                        BMIContainer(
                            topText: 'Maximum Caliries', bottomText: '1800'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New recipes',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 15,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                RecipesRow(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular recipes',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 15,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                RecipesRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipesRow extends StatelessWidget {
  const RecipesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
          width: double.infinity,
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfDLQkEi-UgkZ30hfBkp0gAhlsasZLBqvL4A&usqp=CAU'),
                                ),
                              ),
                            ),
                            Text(
                              'Cucumber Gazpacho',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Icon(Icons.timelapse),
                                const SizedBox(width: 7),
                                Text('10 minutes')
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.people),
                                const SizedBox(width: 7),
                                Text('3 servings')
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.local_fire_department),
                                const SizedBox(width: 7),
                                Text('374 kcal')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              );
            },
          )),
    );
  }
}
