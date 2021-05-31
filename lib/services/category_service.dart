import 'package:sqlite_project/Models/category.dart';
import 'package:sqlite_project/database/repository.dart';

class CategoryService{

  late Repository _repository;

  CategoryService(){
    _repository = Repository();
  }

  // Create data
  saveCategory(Category category) async{
    
    return await _repository.insertData('categories', category.categoryMap());
  }

  //read category

  readCategory() async {
    return await _repository.readData('categories');
  }

 //Read data from table by id
  readCategoryId(categoryId) async {
    return await _repository.readDataById('categories' , categoryId);
  }

 //update data
  updateCategory(Category category) async {
    return await _repository.updateData('categories',category.categoryMap());
  }

}