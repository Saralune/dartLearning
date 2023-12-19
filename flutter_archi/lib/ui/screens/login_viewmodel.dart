class LoginViewModel {
  bool _isLoading = false;
  String? _errorMessage = "c'est du caca d'erreur !";

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
}
