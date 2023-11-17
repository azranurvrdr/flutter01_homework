import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adding App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> people = [];
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void _addPerson() {
    final name = nameController.text;
    final age = ageController.text;

    if (name.isEmpty || age.isEmpty || !isNumeric(age)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Geçerli isim ve yaş bilgisi girin!'),
        ),
      );
    } else {
      setState(() {
        people.add(Person(name: name, age: int.parse(age)));
        nameController.clear();
        ageController.clear();
      });
    }
  }

  bool isNumeric(String value) {
    return value != null && int.tryParse(value) != null;
  }

  void _navigateToAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddingPage(people: people)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÜRK BAYRAĞI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _navigateToAddPage,
              child: Card(
                child: SizedBox(
                  child: Image(
                    image: AssetImage('images/bayrakkk.jpg'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('ÖZELLİKLER'),
                  ),
                  ListTile(
                    title: Text('1) Ekranda Türk bayrağı resmi bulunuyor.'),
                  ),
                  ListTile(
                    title: Text('2) Türk bayrağı bir hilal ve bir adet beş köşeli yıldızdan oluşur.'),
                  ),
                  ListTile(
                    title: Text('3) Bayrağın rengi kırmızıdır ve üzerindeki ay-yıldızın rengi beyazdır.'),
                  ),
                  ListTile(
                    title: Text('4) Türk bayrağı, 29 Mayıs 1936 da kabul edilmiştir.'),
                  ),
                  ListTile(
                    title: Text('5) Bayrak, Türkiyenin sınırları içinde ve dışında resmi olarak kullanılır.'),
                  ),
                  ListTile(
                    title: Text('6) Türk bayrağı, 20. yüzyılın en tanınmış bayraklarından biridir.'),
                  ),
                  ListTile(
                    title: Text('7) Bayrak, genellikle kamusal binalarda, okullarda ve resmi törenlerde görülür.'),
                  ),
                  ListTile(
                    title: Text('8) Bayrağın kabul edildiği 29 Mayıs, Türkiye de "Bayram" olarak kutlanır.'),
                  ),
                  ListTile(
                    title: Text('9) Bayrağın tasarımı, İstiklal Savaşı nın sembolizmini yansıtır.'),
                  ),
                  ListTile(
                    title: Text('10) Bayrak, Türkiye nin ulusal egemenliği ve bağımsızlığını sembolize eder.'),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddingPage extends StatefulWidget {
  final List<Person> people;

  AddingPage({required this.people});

  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  Future<bool> _onWillPop() async {
    if (widget.people.length >= 3) {
      return true; // Geri gitmeye izin ver
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('En az 3 kişi ekleyin.'),
        ),
      );
      return false; // Geri gitmeyi engelle
    }
  }

  void _addPerson() {
    final name = nameController.text;
    final age = ageController.text;

    if (name.isEmpty || age.isEmpty || !isNumeric(age)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Geçerli isim ve yaş bilgisi girin!'),
        ),
      );
    } else {
      setState(() {
        widget.people.add(Person(name: name, age: int.parse(age)));
        nameController.clear();
        ageController.clear();
      });
    }
  }

  bool isNumeric(String value) {
    return value != null && int.tryParse(value) != null;
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adding Page'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'İsim'),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(labelText: 'Yaş'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _addPerson,
                    child: Text('Ekle'),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if(widget.people.length >= 3) {
                        _navigateBack();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('En az 3 kişi ekleyin.'),
                          ),
                        );
                      }
                    },
                    child: Text('Geri Dön'),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.people.length,
                  itemBuilder: (context, index) {
                    final person = widget.people[index];
                    return ListTile(
                      title: Text('${person.name} ${person.age}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


