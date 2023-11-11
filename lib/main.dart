import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Hilda
  final List<Person> people = [];
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void _addPerson(){
    final name = nameController.text;
    final age = ageController.text;

    if(name.isEmpty || age.isEmpty || !isNumeric(age)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Geçerli bir isim ve yaş girin!'),
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

  void _NavigateToNewPage(){
    if(people.length >= 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPage(people: people)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('3 kişi ekleyin'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('TÜRK BAYRAĞI'),
      ),
      body: Center (
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                          title: Text(
                              'Adding Page',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        body: Center(
                          child: Column(
                            //Hilda
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
                              ElevatedButton(
                                  onPressed: _addPerson,
                                  child: Text('Ekle'),
                              ),
                              ElevatedButton(
                                onPressed: _NavigateToNewPage,
                                child: Text('Geri Dön'),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: people.length,
                                      itemBuilder: (context, index) {
                                        final person = people[index];
                                        return ListTile(
                                          title: Text('${person.name} ${person.age}'),
                                        );
                                      },
                                  ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                )
                );
              },


            child: Card(
              child: SizedBox(
                child: Image(image:
                AssetImage('images/bayrakkk.jpg'),
                ),
              ),
            ),
              ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('OZELLİKLER'),
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
      )
    );


}
}
