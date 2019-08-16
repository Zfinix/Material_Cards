import 'package:flutter/material.dart';
import 'package:material_cards/model/cardModel.dart';

class HomeController with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _searchText;
  String get searchText => _searchText;

  List<CardModel> _cardList = [];
  List<CardModel> get cardList => _cardList;

  CardModel _newCard;
  CardModel get newCard => _newCard;

  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void removeCard() {
    if (_cardList.length > 0) _cardList.removeAt(_currentIndex);
    notifyListeners();
  }

  void addCard() async {
    if (_newCard != null) {
      _cardList.add(_newCard);
    }
    _newCard = null;
    notifyListeners();
  }

  set setCurrentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  set isSearching(val) {
    _isSearching = val;
    notifyListeners();
  }

  set setNewCard(CardModel val) {
    print('update new card: ${val?.desc ?? 'null'}');
    _newCard = val;
    notifyListeners();
  }

  set searchText(val) {
    _searchText = val;
    notifyListeners();
  }
}
