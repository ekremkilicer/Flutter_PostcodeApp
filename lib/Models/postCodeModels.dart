import 'dart:convert';

import 'dart:convert';
import 'dart:math';

List<PostCode> PostCodeFromJson(String str) => List<PostCode>.from(
    json.decode(json.decode(str).map((x) => PostCode.fromJson(x))));

String PostCodeToJson(List<PostCode> data)=>
 json.encode(List<dynamic>.from(data.map((x)=>x.toJson)));
class PostCode {

  PostCode(
    {
      this.plaka,
      this.il,
      this.ilce,
      this.semt_bucak_belde,
      this.mahalle,
      this.pk,

    }
  );
  int? plaka;
  String? il;
  String? ilce;
  String? semt_bucak_belde;
  String? mahalle;
  String? pk;

  factory PostCode.fromJson(Map<String,dynamic> json)=> PostCode(
    plaka:json["plaka"],
    il:json["il"],
    ilce:json["ilce"],
    semt_bucak_belde:json["semt_bucak_belde"],
    mahalle: json["mahalle"],
    pk:json["pk"]
  );
  Map<String,dynamic>toJson()=>{
    "plaka":plaka,
    "il":il,
    "ilce":ilce,
    "semt_bucak_belde":semt_bucak_belde,
    "mahalle":mahalle,
    "pk":pk
  };

}
