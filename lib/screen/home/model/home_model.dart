class HomeModal {
  SearchModal modal =SearchModal();

  List<SearchModal>? searchList=[];

  HomeModal({this.searchList});

  factory HomeModal.mapToModal(Map m1)
  {
    List l1=[m1['Search']];
    return HomeModal(searchList: l1.map((e) => SearchModal.mapToModal(e)).toList());
  }
}

class SearchModal
{
  String? Title,Year,imdbID,Type,Poster;

  SearchModal({this.Title, this.Year, this.imdbID, this.Type, this.Poster});

  factory SearchModal.mapToModal(Map m1)
  {
    return SearchModal(Poster: m1['Poster'],Title: m1['Title'],imdbID: m1['imdbID'],Type: m1['Type'],Year: m1['Year']);
  }
}

