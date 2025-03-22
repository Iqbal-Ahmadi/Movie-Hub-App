class GenreModel{
  int? id;
  String? name;
  GenreModel({required this.id, required this.name});

  GenreModel.tojson(Map<String,dynamic> json){
    id = json['id'];
    name  = json['name'];
    // return GenreModel(id: json['id'], name: json['name']);
  }
  
  @override
  String toString() {
    return {'id': id, 'name': name}.toString();
  }
}