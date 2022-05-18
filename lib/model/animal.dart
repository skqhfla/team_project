enum Category { all, cat, dog}

class Animal {
  const Animal({
    required this.category,
    required this.image,
    required this.name,
    required this.age,
    required this.sex,
    required this.like,
    required this.eat,
    required this.live,
    required this.Desc,
  });

  final Category category;
  final String image;
  final String name;
  final int age;
  final String sex;
  final int like;
  final int eat;
  final String live;
  final String Desc;
}