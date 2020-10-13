class PrincipalData{
  String title;
  String body;


  PrincipalData(this.title, this.body);


PrincipalData.fromJson(Map<String, dynamic> json){
  title = json['name'];
  body = json['body'];
}
}