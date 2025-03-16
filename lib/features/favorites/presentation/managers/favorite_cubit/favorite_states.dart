abstract class FavoriteStates {}

class FavoriteInitial extends FavoriteStates {}

// ==========================

class AddFavoriteLoading extends FavoriteStates {}

class AddFavoriteSuccess extends FavoriteStates {}

class AddFavoriteFailure extends FavoriteStates {
  final String errorMessage;

  AddFavoriteFailure({required this.errorMessage});
}

// ==========================
// ==========================

class GetFavoritesLoading extends FavoriteStates {}

class GetFavoritesSuccess extends FavoriteStates {}

class GetFavoritesFailure extends FavoriteStates {
  final String errorMessage;

  GetFavoritesFailure({required this.errorMessage});
}

// ==========================
// ==========================

class IsFavoriteLoading extends FavoriteStates {}

class IsFavoriteSuccess extends FavoriteStates {}

class IsFavoriteFailure extends FavoriteStates {
  final String errorMessage;

  IsFavoriteFailure({required this.errorMessage});
}

// ==========================
// ==========================

class RemoveFavoriteLoading extends FavoriteStates {}

class RemoveFavoriteSuccess extends FavoriteStates {}

class RemoveFavoriteFailure extends FavoriteStates {
  final String errorMessage;

  RemoveFavoriteFailure({required this.errorMessage});
}

// ==========================
