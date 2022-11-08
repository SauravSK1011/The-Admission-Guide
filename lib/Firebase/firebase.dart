import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_admission_guide/Model/college.dart';

class Firebase {
  static getdata() {
    final CollectionReference listcollages =
        FirebaseFirestore.instance.collection("Colleges");

        
    return listcollages;
  }
  

  static List<CollegeModel> getdata2()   {
        List<CollegeModel> listofcollage=[];

     FirebaseFirestore.instance
        .collection("Colleges")
        .get()
        .then((snapshort) => snapshort.docs.forEach((element) {
              // print(element.);
              listofcollage.add(CollegeModel(IMG: element["IMG"],
                CUTOFF: element["CUTOFF"],
                Established: element["Established"].toString(),
                Name: element["Name"],
                Location: element["Location"],
                INSTITUTE_FEE: element["INSTITUTE FEE"],
                PLACEMENTS: element["PLACEMENTS"],
                RANKING: element["RANKING"],
                HOSTEL_FEE: element["HOSTEL FEE"],
                Institute_Type: element["Institute Type"],
              ));
            })).catchError((err)=>print(err));

            return listofcollage;
  }
}
