class SearchSuggestionModel{
  late String placeId;
  late String description;

  SearchSuggestionModel.fromJson(Map<String,dynamic> json){
    placeId = json['place_id'];
    description = json['description'];
  }

}