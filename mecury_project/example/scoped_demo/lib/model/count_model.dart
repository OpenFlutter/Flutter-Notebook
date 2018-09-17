import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model{
  int _count = 0;
  get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  CountModel of(context) =>
      ScopedModel.of<CountModel>(context);
}