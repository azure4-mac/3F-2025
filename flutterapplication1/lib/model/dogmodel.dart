class Dog {
  int id;
  String name;
  int idade;

  Dog({
    required this.id,
    required this.name,
    required this.idade,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'idade': idade,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, idade: $idade}';
  }
}
