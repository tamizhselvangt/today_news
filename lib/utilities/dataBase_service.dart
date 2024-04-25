import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_today/Model/SavedArticles.dart';

const String SavedArticle_Collection = "SavedArticles";

class DataBaseService{

  final _fireStore = FirebaseFirestore.instance;

  late final CollectionReference _savedArticleRef;

  DataBaseService(){
    _savedArticleRef = _fireStore
     .collection(SavedArticle_Collection)
      .withConverter<SavedArticles>(
      fromFirestore: (snapshaots, _) => SavedArticles.fromJson(snapshaots.data()!,),
      toFirestore: (savedArticle, _) => savedArticle.toJason());
}

    Stream<QuerySnapshot> getSavedArticles(){
    return _savedArticleRef.snapshots();
    }

     void addArticle(SavedArticles article ) async{
         _savedArticleRef.add(article);
     }

  void updateArticles(String articleId, SavedArticles savedArticle){
    _savedArticleRef.doc(articleId).update(savedArticle.toJason());
  }

  void removeArticle(String articleId){
    _savedArticleRef.doc(articleId).delete();
  }

}


