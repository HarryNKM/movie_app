class HomeModal {
  List<SearchModal>? search = [];
  String? totalResults;
  String? response;
  HomeModal({
    this.search,
    this.totalResults,
    this.response,
  });

  factory HomeModal.mapToModal(Map m1) {
    List l1 = m1['Search'];
    return HomeModal(
      search: l1.map((e) => SearchModal.mapToModal(e)).toList(),
      totalResults: m1['totalResults'],
      response: m1['Response'],
    );
  }
}

class SearchModal {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  SearchModal({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  factory SearchModal.mapToModal(Map m1) {
    return SearchModal(
      title: m1['Title'],
      year: m1['Year'],
      imdbID: m1['imdbID'],
      type: m1['Type'],
      poster: m1['Poster'],
    );
  }
}
