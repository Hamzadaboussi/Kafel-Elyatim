class enfant {
  String? nomP;
  String? cin;
  String? gouvernorat;
  String? delegation;
  String? nomE;
  String? age;
  String? niveau;
  String? qrll;
  String? qrff;
  String? qrsc;
  enfant(String n, String c, String g, String d, String ne, String a, String ni,
      String q1, String q2, String q3) {
    nomP = n;
    cin = c;
    gouvernorat = g;
    delegation = d;
    nomE = ne;
    age = a;
    niveau = ni;
    qrll = q1;
    qrff = q2;
    qrsc = q3;
  }

  void setnomE(String? a) {
    nomE = a;
  }

  void setage(String? a) {
    age = a;
  }

  void setniveau(String? a) {
    niveau = a;
  }

  void setqrll(String? a) {
    qrll = a;
  }

  void setqrff(String? a) {
    qrff = a;
  }

  void setqrsc(String? a) {
    qrsc = a;
  }
}
