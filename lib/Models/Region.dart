class Region {
  final String regionName;

  Region({
    this.regionName,
  });

  Map<String, dynamic> toMap() {
    return {
      'regionName': regionName,
    };
  }

  static Region fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
// , String documentId
    return Region(
      regionName: map['regionName'],
    );
  }
}
