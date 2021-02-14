import 'package:scoped_model/scoped_model.dart';
import 'package:week4/main.dart';

class bookModel extends Model {
  List<Book> cart = [];
  double totalvalue = 0;
  int get total => cart.length;

  void addBook(item) {
    cart.add(item);
  }

  String calculateTotal() {
    totalvalue = 0;
    cart.forEach((f) {
      totalvalue += f.price;
    });
    return 'Total value: ' + totalvalue.toString() + ' \฿';
  }
}
