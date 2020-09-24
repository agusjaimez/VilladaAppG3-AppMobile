class PrincipalData{
  String title;

  PrincipalData(this.title);

PrincipalData.fromJson(Map<String, dynamic> json){
  title = json['title'];
}
}