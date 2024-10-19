import 'package:flutter/material.dart';
import 'package:uni/models/unis_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Uni> _favoriteUnis = [];

  List<Uni> get favoriteUnis => _favoriteUnis;

  void addFavorite(Uni uni) {
    if (!_favoriteUnis.contains(uni)) {
      _favoriteUnis.add(uni);
      notifyListeners();
    }
  }

  void removeFavorite(Uni uni) {
    _favoriteUnis.remove(uni);
    notifyListeners();
  }

  bool isFavorite(Uni uni) {
    return _favoriteUnis.contains(uni);
  }
}
