class Address {
  final int id;
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? numCasa;
  final String cliente;
  final double? latitude;
  final double? longitude;

  Address({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.numCasa,
    required this.cliente,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      numCasa: json['num_casa'],
      cliente: json['cliente'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
