import 'animal.dart';

class AnimalRepository {
  static List<Animal> loadAnimals(Category category) {
    const allAnimal = <Animal>[
      Animal(
        category: Category.dog,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '누룽지',
        age: 3,
        sex: '수컷',
        weight: 10,
        live: '장량동 삼구 3차 근처',
        desc: '육포를 좋아함',
        like: 26,
        eat: 20,
      ),
      Animal(
        category: Category.cat,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '감자',
        age: 3,
        sex: '수컷',
        weight: 10,
        live: '장량동 삼구 3차 근처',
        desc: '육포를 좋아함',
        like: 26,
        eat: 20,
      ),
      Animal(
        category: Category.dog,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '보리',
        age: 3,
        sex: '수컷',
        weight: 10,
        live: '장량동 삼구 3차 근처',
        desc: '육포를 좋아함',
        like: 26,
        eat: 20,
      ),
      Animal(
        category: Category.cat,
        image: 'https://handong.edu/site/handong/res/img/logo.png',
        name: '나비',
        age: 3,
        sex: '수컷',
        weight: 10,
        live: '장량동 삼구 3차 근처',
        desc: '육포를 좋아함',
        like: 26,
        eat: 20,
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
