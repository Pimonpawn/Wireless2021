import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:week4/calculate.dart';

void main() {
  runApp(MyApp(
    model: bookModel(),
  ));
}

class MyApp extends StatelessWidget {
  final bookModel model;
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<bookModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookStore',
        home: Listscreen(),
      ),
    );
  }
}

class Listscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Book Store'),
      ),
      body: ListView.builder(
          itemExtent: 80,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ScopedModelDescendant<bookModel>(
                builder: (context, child, model) {
              return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(itemList[index].image)),
                  title: Text(itemList[index].title),
                  subtitle: Text('\฿' + itemList[index].price.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    model.addBook(itemList[index]);
                    print('Add: ' + itemList[index].title);
                    print(model.calculateTotal());
                  });
            });
          }),
    );
  }
}

class Book {
  int price;
  int id;
  String title;
  String image;
  Book(
      {@required this.price,
      @required this.id,
      @required this.title,
      @required this.image});
}

List<Book> itemList = [
  Book(
      id: 1,
      title: 'Klara and the Sun',
      image: 'assets/images/id1.jpg',
      price: 300),
  Book(
      id: 2,
      title: 'Of Women and Salt',
      image: 'assets/images/id2.jpg',
      price: 250),
  Book(
      id: 3,
      title: 'The Four Winds',
      image: 'assets/images/id3.jpg',
      price: 299),
  Book(
      id: 4,
      title: 'How Beautiful We Were',
      image: 'assets/images/id4.jpg',
      price: 250),
  Book(
      id: 5,
      title: 'My Year Abroad: A Novel',
      image: 'assets/images/id5.jpg',
      price: 320),
  Book(
      id: 6,
      title: 'The Removed: A Novel',
      image: 'assets/images/id6.jpg',
      price: 120),
  Book(
      id: 7,
      title: 'Let Me Tell You What I Mean',
      image: 'assets/images/id7.jpg',
      price: 380),
  Book(
      id: 8,
      title: 'No One Is Talking About This',
      image: 'assets/images/id8.jpg',
      price: 230),
  Book(
      id: 9,
      title: 'The Lost Apothecary: A Novel',
      image: 'assets/images/id9.jpg',
      price: 210),
  Book(
      id: 10,
      title: 'The Wife Upstairs: A Novel',
      image: 'assets/images/id10.jpg',
      price: 120),
];
