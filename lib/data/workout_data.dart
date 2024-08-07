import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:hive_flutter/hive_flutter.dart';



class excersizeDatabase {
  late final Box _excersizeBox = Hive.box<ExcersizeContent>('excersizeBox');
   

  
    
     
  



  void createInitialData(){
     excersizeContent = [];
     return;
  }

  void loadData() async{
    // Retrieve the data from the box and cast it to List<Workouts>
    var storedWorkouts = _excersizeBox.get("EXCERSIZEBOX") as List<dynamic>;

    // Ensure the dynamic list is properly cast to List<Workouts>
    excersizeContent = storedWorkouts.cast<ExcersizeContent>();
  }
  void updateDataBase(listvalue) {
    _excersizeBox.put("EXCERSIZEBOX", listvalue);
  }


}