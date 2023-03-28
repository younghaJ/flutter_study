class MovieDTOTable{
  int rank;
  int auiCnt;
  String movieNm;
  String openDt;

  MovieDTOTable({required this.rank, required this.auiCnt, required this.movieNm, required this.openDt});
  factory MovieDTOTable.fromJson(dynamic json) => MovieDTOTable(
    rank: json["rank"],
    auiCnt: json["auiCnt"],
    movieNm: json["movieNm"],
    openDt: json["openDt"],
  );

  static List<MovieDTOTable> fromJsonList(List jsonList){
    return jsonList.map((json) => MovieDTOTable.fromJson(json)).toList();
  }
}

class MovieDtoDetail{
  int rank;
  int auiCnt;
  String movieNm;
  String openDt;

  MovieDtoDetail(
      {required this.rank,
        required this.auiCnt,
        required this.movieNm,
        required this.openDt});
}