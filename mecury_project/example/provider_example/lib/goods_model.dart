import 'package:flutter/material.dart' show ChangeNotifier;

class GoodsListProvider with ChangeNotifier {

  bool shouldRebuild = false;

  List<Goods> _goodsList =
      List.generate(10, (index) => Goods(false, 'Goods No. $index'));

  get goodsList => _goodsList;
  get total => _goodsList.length;

  collect(int index) {
    var good = _goodsList[index];
    _goodsList[index] = Goods(!good.isCollection, good.goodsName);
    notifyListeners();
  }

  addAll(){
    _goodsList.addAll(List.generate(10, (index)=>Goods(false, 'Goods No. $index')));
    shouldRebuild = true;
    notifyListeners();
  }

  rebuild(){
    shouldRebuild = false;
  }
}

class Goods {
  final bool isCollection;
  final String goodsName;

  Goods(this.isCollection, this.goodsName);
}
