enum Category { all, dog, cat}

class Animal {
  const Animal({
    required this.category,
    required this.image,
    required this.name,
    required this.age,
    required this.sex,
    required this.weight,
    required this.live,
    required this.desc,
    required this.like,
    required this.eat,
  });

  final Category category;
  final String image;
  final String name;
  final int age;
  final String sex;
  final int weight;
  final String live;
  final String desc;
  final int like;
  final int eat;

// String get assetName => '$id-0.jpg';
// String get assetPackage => 'shrine_images';

// @override
// String toString() => "$name (id=$id)";
}
