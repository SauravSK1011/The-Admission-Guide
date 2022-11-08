// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';




class CollegeModel {
  late String IMG;

  late String Name;
  late String Established;
  late String Institute_Type;
  late String Location;
  late Map INSTITUTE_FEE;
  late Map PLACEMENTS;
  late Map RANKING;
  late Map HOSTEL_FEE;
  late Map CUTOFF;

  CollegeModel({
    required this.IMG,
    required this.Name,
    required this.Established,
    required this.Institute_Type,
    required this.Location,
    required this.INSTITUTE_FEE,
    required this.PLACEMENTS,
    required this.RANKING,
    required this.HOSTEL_FEE,
    required this.CUTOFF,
  });

  CollegeModel copyWith({
    String? IMG,
    String? Name,
    String? Established,
    String? Institute_Type,
    String? Location,
    Map? INSTITUTE_FEE,
    Map? PLACEMENTS,
    Map? RANKING,
    Map? HOSTEL_FEE,
    Map? CUTOFF,
  }) {
    return CollegeModel(
      IMG: IMG ?? this.IMG,
      Name: Name ?? this.Name,
      Established: Established ?? this.Established,
      Institute_Type: Institute_Type ?? this.Institute_Type,
      Location: Location ?? this.Location,
      INSTITUTE_FEE: INSTITUTE_FEE ?? this.INSTITUTE_FEE,
      PLACEMENTS: PLACEMENTS ?? this.PLACEMENTS,
      RANKING: RANKING ?? this.RANKING,
      HOSTEL_FEE: HOSTEL_FEE ?? this.HOSTEL_FEE,
      CUTOFF: CUTOFF ?? this.CUTOFF,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IMG': IMG,
      'Name': Name,
      'Established': Established,
      'Institute_Type': Institute_Type,
      'Location': Location,
      'INSTITUTE_FEE': INSTITUTE_FEE,
      'PLACEMENTS': PLACEMENTS,
      'RANKING': RANKING,
      'HOSTEL_FEE': HOSTEL_FEE,
      'CUTOFF': CUTOFF,
    };
  }

  // factory CollegeModel.fromJson(Map<String, dynamic> map) {
  //   return CollegeModel(
  //     IMG: late String.fromMap(map['IMG'] as Map<String,dynamic>),
  //     Name: late String.fromMap(map['Name'] as Map<String,dynamic>),
  //     Established: late String.fromMap(map['Established'] as Map<String,dynamic>),
  //     Institute_Type: late String.fromMap(map['Institute_Type'] as Map<String,dynamic>),
  //     Location: late String.fromMap(map['Location'] as Map<String,dynamic>),
  //     INSTITUTE_FEE: late Map.fromMap(map['INSTITUTE_FEE'] as Map<String,dynamic>),
  //     PLACEMENTS: late Map.fromMap(map['PLACEMENTS'] as Map<String,dynamic>),
  //     RANKING: late Map.fromMap(map['RANKING'] as Map<String,dynamic>),
  //     HOSTEL_FEE: late Map.fromMap(map['HOSTEL_FEE'] as Map<String,dynamic>),
  //     CUTOFF: late Map.fromMap(map['CUTOFF'] as Map<String,dynamic>),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory CollegeModel.fromJson(String source) => CollegeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CollegeModel(IMG: $IMG, Name: $Name, Established: $Established, Institute_Type: $Institute_Type, Location: $Location, INSTITUTE_FEE: $INSTITUTE_FEE, PLACEMENTS: $PLACEMENTS, RANKING: $RANKING, HOSTEL_FEE: $HOSTEL_FEE, CUTOFF: $CUTOFF)';
  }

  @override
  bool operator ==(covariant CollegeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.IMG == IMG &&
      other.Name == Name &&
      other.Established == Established &&
      other.Institute_Type == Institute_Type &&
      other.Location == Location &&
      other.INSTITUTE_FEE == INSTITUTE_FEE &&
      other.PLACEMENTS == PLACEMENTS &&
      other.RANKING == RANKING &&
      other.HOSTEL_FEE == HOSTEL_FEE &&
      other.CUTOFF == CUTOFF;
  }

  @override
  int get hashCode {
    return IMG.hashCode ^
      Name.hashCode ^
      Established.hashCode ^
      Institute_Type.hashCode ^
      Location.hashCode ^
      INSTITUTE_FEE.hashCode ^
      PLACEMENTS.hashCode ^
      RANKING.hashCode ^
      HOSTEL_FEE.hashCode ^
      CUTOFF.hashCode;
  }
}
