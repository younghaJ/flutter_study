// post_dto.dart

// 테이블 용
class PostDTOTable{
  int userId; // 유저 번호
  int id; // 글 번호
  String title;

  PostDTOTable({required this.userId, required this.id, required this.title});

  // 팩토리
  // 생성자를 통해서 객체를 만들려고 하는데
  // 처리가 번거로울 경우
  // 어떠한 타입을 받아서 클래스 내부에서 처리해서 객체를 생성해서
  // 리턴 해주기 위함

  factory PostDTOTable.fromJson(dynamic json) => PostDTOTable(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
  );

  // 팩토리 아님
  static List<PostDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
  }
}

// 상세 페이지Dragon
class PostDtoDetail{
  int userId; // 유저 번호
  int id; // 글 번호
  String title; //제목
  String body;  //내용

  PostDtoDetail(
      {required this.userId,
        required this.id,
        required this.title,
        required this.body});

}