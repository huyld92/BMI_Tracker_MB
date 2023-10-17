// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';

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
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://scontent.fsgn8-4.fna.fbcdn.net/v/t1.6435-9/149694643_1773509462819136_6906009321502091505_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pzzakZfvVk0AX_bIEpR&_nc_ht=scontent.fsgn8-4.fna&oh=00_AfBH1FJ-dh7Skk9paUOaku3QXY6_HvUqZXIxNTEEZ1wNtw&oe=654C4A28',
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
                  prefixicon: const Icon(Icons.search),
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
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const RecipesRow(),
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
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const RecipesRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
