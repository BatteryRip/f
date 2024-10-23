class User {
  final String username;
  final String email;
  final String password;
  final String avatarUrl;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.avatarUrl,
  });
}

class UserRepository {
  List<User> _users = [
    User(
      username: 'admin',
      email: 'user1@example.com',
      password: 'admin',
      avatarUrl: 'https://upload.wikimedia.org/wikipedia/ru/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png', // Замените на реальный URL
    ),
    User(
      username: 'user2',
      email: 'user2@example.com',
      password: 'password2',
      avatarUrl: 'https://upload.wikimedia.org/wikipedia/ru/1/1d/%D0%91%D0%B5%D0%B7%D0%BC%D1%8F%D1%82%D0%B5%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C.png', // Замените на реальный URL
    ),
  ];

  User? authenticate(String username, String password) {
    for (var user in _users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }

  void addUser (User user) {
    _users.add(user);
  }

  void createUser (String username, String email, String password, String avatarUrl) {
    var newUser  = User(
      username: username,
      email: email,
      password: password,
      avatarUrl: avatarUrl,
    );
    addUser (newUser );
  }
}

String? currentUser = null;