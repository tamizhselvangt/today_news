import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_today/Model/SavedArticles.dart';
import 'package:firebase_auth/firebase_auth.dart';


const String SavedArticle_Collection = "SavedArticles";

class DataBaseService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  late final CollectionReference _savedArticleRef;

  DataBaseService(){
    _savedArticleRef = _fireStore
     .collection(SavedArticle_Collection)
      .withConverter<SavedArticles>(
      fromFirestore: (snapshaots, _) => SavedArticles.fromJson(snapshaots.data()!,),
      toFirestore: (savedArticle, _) => savedArticle.toJson());
}

    Stream<QuerySnapshot?> getSavedArticles(){
    return _savedArticleRef.where('uid', isEqualTo: _auth.currentUser!.uid).snapshots();
    }

    Future<void> addArticle(SavedArticles article ) async{
          User? user = _auth.currentUser;
          if(user != null){
         _savedArticleRef.add(article);
          }else{

          }
     }

  void updateArticles(String articleId, SavedArticles savedArticle){
    _savedArticleRef.doc(articleId).update(savedArticle.toJson());
  }

  void removeArticle(String articleId){
    _savedArticleRef.doc(articleId).delete();
  }

}


