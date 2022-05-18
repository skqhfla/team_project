import 'package:flutter/material.dart';

import 'addprofile.dart';
import 'model/animal.dart';
import 'model/animal_List.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('profile list'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProfile()));
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: _buildListCards(context),
          ),
        ));
  }

  List<Expanded> _buildListCards(BuildContext context) {
    List<Animal> animals = AnimalRepository.loadAnimals(Category.all);

    if (animals.isEmpty) {
      return const <Expanded>[];
    }

    return animals.map((animal) {
      return Expanded(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  clipBehavior: Clip.hardEdge,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      minHeight: 100,
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Image.network(
                      animal.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 50,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                animal.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                " / " +
                                    animal.age.toString() +
                                    "살 " +
                                    animal.sex,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            animal.live,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            animal.desc,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 15,
                                  ),
                                  onPressed: () {}),
                              Text(
                                animal.like.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.pink,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.restaurant_rounded,
                                    color: Colors.green,
                                    size: 15,
                                  ),
                                  onPressed: () {}),
                              Text(
                                animal.eat.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
