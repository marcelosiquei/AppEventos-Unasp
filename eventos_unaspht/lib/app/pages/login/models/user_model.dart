import 'package:eventos_unaspht/app/pages/login/signup/enums/category_enum.dart';

class UserModel {
  String nome;
  String email;
  String senha;
  String genero;
  CategoryEnum mainCategory;
  CategoryEnum secondaryCategory;
  double ra;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    email = json['email'];
    genero = json['genre'];
    mainCategory = json['mainCategory'];
    secondaryCategory = json['secondaryCategory'];
    ra = json['ra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['genero'] = this.genero;
    data['mainCategory'] = this.mainCategory.index;
    data['secondaryCategory'] = this.secondaryCategory != null ? this.secondaryCategory.index : null;
    data['ra'] = this.ra;
    return data;
  }
}
