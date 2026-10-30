class ArticleModel {
  String ? author;
  String ? urlToImage;
  String ? date;
  String ? description;
  String ? content;


  ArticleModel({
    this.author,
    this.urlToImage,
    this.date,
    this.description,
    this.content
  });

  ArticleModel.fromJson(Map<String,dynamic> json){
    author = json['author'];
    urlToImage = json['urlToImage'];
    date = json["publishedAt"];
    description = json['description'];
    content = json['content'];
  }
}