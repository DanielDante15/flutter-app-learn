class User {
  final int id;
  final String? nome;
  final String? email;
  final String? cpf;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.cpf,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      cpf: json['cpf'],
    );
  }
}
