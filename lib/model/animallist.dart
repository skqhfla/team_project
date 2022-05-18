import 'animal.dart';

class AnimalList {
  static List<Animal> loadAnimals(Category category) {
    const allAnimal = <Animal>[
      Animal(
        category: Category.dog,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '누룽지',
        age: 3,
        sex: '수컷',
        like: 56,
        eat: 20,
        live: '장량동 삼구 3차 근처',
        Desc: '육포 좋아함',
      ),
      Animal(
        category: Category.cat,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '감자',
        age: 3,
        sex: '수컷',
        like: 56,
        eat: 20,
        live: '장량동 삼구 3차 근처',
        Desc: '육포 좋아함',
      ),
      Animal(
        category: Category.dog,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '보리',
        age: 6,
        sex: '수컷',
        like: 56,
        eat: 20,
        live: '장량동 삼구 3차 근처',
        Desc: '육포 좋아함',
      ),
      Animal(
        category: Category.cat,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '나비',
        age: 3,
        sex: '수컷',
        like: 56,
        eat: 20,
        live: '장량동 삼구 3차 근처',
        Desc: '육포 좋아함',
      ),
    ];
    if (category == Category.all) {
      return allAnimal;
    } else {
      return allAnimal.where((Animal a) {
        return a.category == category;
      }).toList();
    }
  }
}