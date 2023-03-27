// post_dto.dart

// 테이블 용
class PostDtoTable{
  int userId; // 유저 번호
  int id; // 글 번호
  String title;

  PostDtoTable({required this.userId, required this.id, required this.title});
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