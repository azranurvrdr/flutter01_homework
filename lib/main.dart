import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  //TextFieldlerin kontrolcüleri
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  //List
  List<Map<String, dynamic>> userData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Navigate to the new page
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
                              children: [
                                TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'İsim',
                                    hintText: 'İsminizi girin',
                                  ),
                                ),
                                TextField(
                                  controller: _ageController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Yaş',
                                    hintText: 'Yaşınızı girin',
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      //Fieldların boş olup olmadığını kontrol ediyoruz
                                      if(_nameController.text.isEmpty || _ageController.text.isEmpty) {
                                        //Hata mesajı bastırıyoruz
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('!HATA!'),
                                                content: Text(
                                                  'Lütfen isim ve yaş bilgisini birlikte girin!'
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Tamam'),
                                                  ),
                                                ],
                                              );
                                            },
                                        );
                                      } else {
                                        //Alınan verileri listeye ekliyoruz
                                        userData.add({
                                          'name': _nameController.text,
                                          'age': int.parse(_ageController.text),
                                        });

                                        //Verileri kaydettikten sonra TextFieldı temizliyoruz.
                                        _nameController.clear();
                                        _ageController.clear();

                                        //Verileri ekrana bastırıyoruz.
                                        ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                          SnackBar(
                                              content: Text('Kişi başarıyla eklendi'),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text('EKLE'),
                                ),


                                  ElevatedButton(
                                    onPressed: () {
                                      if(userData.length >= 3){
                                        Navigator.pop(context);
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('!HATA!'),
                                                content: Text('Listeye en az 3 kişi eklemelisiniz!'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('Tamam'),
                                                  ),
                                                ],
                                              );
                                            },
                                        );
                                      }
                                    },
                                    child: Text('Geri Dön'),
                                ),

                                  ListView.builder(
                                    itemCount: userData.length,
                                    itemBuilder: (context, index) {
                                      final user = userData[index];
                                      //Her kişiyi Row olarak oluşturuyoruz.
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(user['name']),
                                          Text('Age: ${user['age']}'),
                                        ],
                                      );
                                    },
                                  ),


                              ],
                            ),
                          )
                        );
                    },
                  )
                );
              },
              child: Card(
                child: SizedBox(
                  child: Image(image: AssetImage('images/user-ikon.jpg')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}