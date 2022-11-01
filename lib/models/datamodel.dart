class data {
  bool postFlagg = false;
  var dataa;
  var nbs;
  var nbt;
  var nbd;
  var article;
  var niveau;

  data(String s, String t) {
    article = s;
    niveau = t;
  }
  dynamic setnbs(String a) {
    this.nbs = a;
  }

  dynamic setnbd(String a) {
    this.nbd = a;
  }

  dynamic setnbt(String a) {
    this.nbt = a;
  }

  gtnbs() {
    return this.nbs.toString();
  }

  gtnbt() {
    return this.nbt.toString();
  }

  gtnbd() {
    return this.nbd.toString();
  }

  setflg() {
    this.postFlagg = true;
  }
}
