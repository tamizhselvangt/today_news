
class SavedArticles{

  String title;
  String description;
  String urlToImage;
  String url;
  String publishedAt;
  String source;

  SavedArticles({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.source
  });


  SavedArticles.fromJson(Map<String, Object?> json) : this(
    title: json['title'] as String,
    description: json['description'] as String,
    urlToImage: json['urlToImage'] as String,
    url: json['url'] as String,
    publishedAt: json['publishedAt'] as String,
    source: json['source'] as String,
  );

  SavedArticles copyWith({
    String? title,
    String? description,
    String? urlToImage,
    String? url,
    String? publishedAt,
    String? source
  }){
    return SavedArticles(
        title: title ?? this.title,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        url: url ?? this.url,
        publishedAt: publishedAt ?? this.publishedAt,
        source: source ?? this.source
    );
  }


Map<String, Object?> toJason(){
    return{
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'url': url,
      'publishedAt': publishedAt,
      'source': source
    };
}


}