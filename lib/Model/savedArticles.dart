

class SavedArticles{
  String uid;
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
    required this.source,
    required this.uid,
  });

  Map<String, Object?> toJson(){
    return{
      'uid': uid,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'url': url,
      'publishedAt': publishedAt,
      'source': source
    };
  }

  SavedArticles.fromJson(Map<String, Object?> json) : this(
    title: json['title'] as String,
    description: json['description'] as String,
    urlToImage: json['urlToImage'] as String,
    url: json['url'] as String,
    publishedAt: json['publishedAt'] as String,
    source: json['source'] as String,
    uid: json['uid'] as String,
  );

  SavedArticles copyWith({
    String? title,
    String? description,
    String? urlToImage,
    String? url,
    String? publishedAt,
    String? source,
    String? uid,
  }){
    return SavedArticles(
        title: title ?? this.title,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        url: url ?? this.url,
        publishedAt: publishedAt ?? this.publishedAt,
        source: source ?? this.source,
        uid: uid ?? this.uid,
    );
  }

}