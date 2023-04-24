import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';


final FirebaseFirestore _firestore=FirebaseFirestore.instance;
final CollectionReference _Collection=_firestore.collection("Employee");


class FirebaseCrud{

static Future<Response> addEmployee(
 { required   String name,
  required String position,
  required String contact}

)async{
  Response response =Response();
  DocumentReference documentReference=_Collection.doc();

  Map <String,dynamic> data=<String,dynamic>{
    "employeename":name,
    "position":position,
    "contact":contact
  };


var Result=await documentReference.set(data).whenComplete(() {
  response.code=200;
  response.message="Successfully added to the database.";
  
}).catchError((e){
  response.code=500;
  response.message=e;
});
  return response;
}



// read employees

static Stream<QuerySnapshot> readEmployees(){
  CollectionReference notesItemCollection = _Collection;
  return notesItemCollection.snapshots();
}

// Update employees
static Future<Response> updateEmployees({
  required String name,
  required String position,
  required String contact,
  required String docID,
})async{
  Response response =Response();
  DocumentReference documentReference=_Collection.doc(docID);

  Map<String,dynamic> data=<String,dynamic>{
    "employeename":name,
    "position":position,
    "contact":contact,

  };
  await documentReference.update(data).whenComplete(() {
    response.code=200;
    response.message="Succesfully Updated Employee";
    }).catchError((e){
      response.code=500;
      response.message=e;
    });
    return response;


    
}

static Future <Response> deleteEmployee({
  required String docID,

})
async{
  Response response = Response();
  DocumentReference docReference =_Collection.doc(docID);

  await docReference.delete().whenComplete(() {
    response.code=200;
    response.message="Succesfully Deleted Employee";
 }).catchError((e){
    response.code=500;
    response.code=e;
 });

  return response;
}
}