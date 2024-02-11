class UserModel {
  String name;
  String email;
  String phone;
  String cpf;
  String password;

  //Criando contrutor para a classe UserModel
  UserModel({
    required this.phone,
    required this.cpf,
    required this.email,
    required this.name,
    required this.password,
  });
}
