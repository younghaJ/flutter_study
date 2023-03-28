class PostDTOTable{
  int id;
  String name;
  String username;
  String email;

  PostDTOTable({required this.id, required this.name, required this.username, required this.email});
  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  static List<PostDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
  }
}

class PostDtoDetail{
  int id;
  String name;
  String username;
  String email;

  PostDtoDetail(
      {required this.id,
        required this.name,
        required this.username,
        required this.email});
}