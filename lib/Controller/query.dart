import 'package:cloud_firestore/cloud_firestore.dart';

var id;
var dataaa;

class Post {
  getpost(String uid) {
    return FirebaseFirestore.instance
        .collection("Users")
        .where("uid", isEqualTo: uid)
        .get();
  }
}

class Nbstock {
  getnbstock(String article, String niveau) {
    return FirebaseFirestore.instance
        .collection(article)
        .where("Niveau", isEqualTo: niveau)
        .get();
  }
}

class Update {
  var reviews2;
  var idd;

  getnid(String article, String niveau) {
    return FirebaseFirestore.instance
        .collection(article)
        .where("Niveau", isEqualTo: niveau)
        .get();
  }

  updatee(var id, var dataas, var dataatt, var dataad, var article) {
    int s = dataas;
    int t = dataatt;
    int d = dataad;
    print("tawa");
    print(s);
    print(t);
    print(d);
    print("wfee");
    FirebaseFirestore.instance.collection(article).doc(id.toString()).update({
      "Nombre en stock": ((s) - 1),
      "Nombre en attente": ((t) - 1),
      "Nombre distribuer": ((d) + 1)
    });
  }

  updateee(var ff1, var article) {
    Update().getnid(article, ff1.toString()).then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        reviews2 = docs.docs[0].data();
        idd = docs.docs[0].id;
        int d = reviews2["Nombre distribuer"];
        int t = reviews2["Nombre en attente"];
        int s = reviews2["Nombre en stock"];
        print("tawa");
        print(s);
        print(t);
        print(d);
        print(idd);
        print("wfee");

        FirebaseFirestore.instance
            .collection(article)
            .doc(idd.toString())
            .update({
          "Nombre en stock": ((s) - 1),
          "Nombre en attente": ((t) - 1),
          "Nombre distribuer": ((d) + 1)
        });
      }
    });
  }
}
