/*

// 1- Bir fonksiyonu asenkron yapmak için ne yapmalısınız?
// Fonksiyonun başına `async` eklemeniz gerekir

async void asyncFonksiyonu() {
  // ...
}

// 2- Bir Future nesnesinin sonucunu almak için iki yöntem nedir?
// ** `await` ifadesi kullanarak

Future<String> isimAl() {
  return Future.delayed(Duration(seconds: 1), () => "Azra");
}

void main() {
  String isim = await isimAl();
  print(isim);
}

// ** `then()` metodunu kullanarak

Future<String> isimAl2() {
  return Future.delayed(Duration(seconds: 1), () => "Azra");
}

void main() {
  isimAl2().then((isim) {
    print(isim);
  });
}

// 3- Await ifadesi ne işe yaramaktadır?
// asenkron bir işlemin sonucunu beklememizi sağlar.

async void asyncFonksiyonu() {
  String isim = await isimAl();
  print(isim);
}

// 4- Bir asenkron fonksiyonun içinde await ifadesi kullanmadan Future nesnesinin sonucunu alabilir misiniz?
// Hayır, `await` ifadesi asenkron bir işlemin sonucunu beklememizi sağlayan özel bir ifadedir


// 5- Bir kod bloğunda dinamik olarak hatayı yakalamak için, kod bloğunu hangi kod blok yapısı içine almalıyız?
// `try/catch` kod blok yapısı içine almamız gerekir

void main() {
  try {
    // ...
  } catch (e) {
    // Hata yakalanır
    print(e);
  }
}

// 6- Dart dilinde "Cascade notation" nedir?

// bir nesnenin özelliklerine ve metodlarına tek bir satırda erişmemizi sağlayan bir yapıdır

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return "Person(name: $name, age: $age)";
  }
}

void main() {
  Person person = Person("Azra", 20);

  // Cascade notation olmadan

    person.name = "Melek";
  person.age = 45;

  print(person); // Person(name: Melek, age: 45)

  // Cascade notation ile

  person
    ..name = "Melek"
    ..age = 45;

  print(person); // Person(name: Melek, age: 45)
}

// 7- Dart dilinde liste içerisine, başka bir listenin elemanları direkt olarak eklenmek istendiğinde ne yapılabilir?
// `addAll()` metodunu kullanabiliriz

List<int> liste1 = [1, 2, 3];
List<int> liste2 = [4, 5, 6];

liste1.addAll(liste2);  //liste1'e liste2'nin elemanları eklendi

print(liste1); // [1, 2, 3, 4, 5, 6]

 */