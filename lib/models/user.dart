class Usuario {
  final int id;
  final String nome;
  final String email;
  final String empresa;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.empresa,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Usuario && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      empresa: json['empresa'],
    );
  }
}
