class SubCat {
  final String subCatname;
  final String subCatID;
  final bool subStatus;
  final String catID;

  SubCat({this.subCatID, this.subCatname, this.subStatus , this.catID});

  Map<String, dynamic> toMap() {
    return {
      'subCatID': subCatID,
      'subCatname': subCatname,
      'catsubStatus': subStatus,
      'catId': catID,
    };
  }

  static SubCat fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
// , String documentId
    return SubCat(
      subCatname: map['subCatname'],
      subCatID: map['subCatID'],
      catID: map['catId'],

      subStatus: map['subStatus'],
    );
  }
}
