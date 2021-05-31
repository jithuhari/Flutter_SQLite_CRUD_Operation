import 'package:flutter/material.dart';
import 'package:sqlite_project/Models/category.dart';
import 'package:sqlite_project/services/category_service.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  List<Category> _CategoryList = <Category>[];

  var category;

  var _editCategoryNameController = TextEditingController();
  var _editCategoryDescriptionController = TextEditingController();


  @override
  void initState(){
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    _CategoryList = <Category>[];
    var categories = await _categoryService.readCategory();
    categories.forEach((category){
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id = category['id'];
        _CategoryList.add(categoryModel);
      });
    });
  }


  _editCategory(BuildContext context , categoryId) async{
    category = await _categoryService.readCategoryId(categoryId);
    setState(() {
      _editCategoryNameController.text = category[0]['name']??'No Name';
      _editCategoryDescriptionController.text = category[0]['description']??'No Description';


    });
    _editshowForm(context);
  }


//insert dialoge box
  _showForm(BuildContext context){
    return showDialog(
      context: context, 
      barrierDismissible: true, 
      builder: (param){
        return AlertDialog(
          actions: [
            FlatButton(
              color: Colors.red,
              onPressed: ()=>Navigator.pop(context), child: Text('cancel')),
            FlatButton(
              color: Colors.blue,
              onPressed: () async{
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                var result = await _categoryService.saveCategory(_category);
                print(result);
              }, child: Text('Save'))
          ],
          title: Text('List'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller:_categoryNameController ,
                  decoration:InputDecoration(
                    hintText: 'Write the list',
                    labelText: 'List'
                  ) ,),
                
                TextField(
                  controller: _categoryDescriptionController,
                  decoration:InputDecoration(
                    hintText: 'Write the Discription',
                    labelText: 'Discription'
                  ) ,)  
              ],
            ),
          ),
        );
    } );
  }


// update dialogue box

 _editshowForm(BuildContext context){
    return showDialog(
      context: context, 
      barrierDismissible: true, 
      builder: (param){
        return AlertDialog(
          actions: [
            FlatButton(
              color: Colors.red,
              onPressed: ()=>Navigator.pop(context), child: Text('cancel')),
            FlatButton(
              color: Colors.blue,
              onPressed: () async{
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                var result = await _categoryService.saveCategory(_category);
                print(result);
              }, child: Text('update'))
          ],
          title: Text('Edit List'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller:_editCategoryNameController ,
                  decoration:InputDecoration(
                    hintText: 'Write the list',
                    labelText: 'List'
                  ) ,),
                
                TextField(
                  controller: _editCategoryDescriptionController,
                  decoration:InputDecoration(
                    hintText: 'Write the Discription',
                    labelText: 'Discription'
                  ) ,)  
              ],
            ),
          ),
        );
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('List'),
      ),
      body:ListView.builder(
        itemCount:_CategoryList.length ,
        itemBuilder: (context , index){

          return Card(
            child:ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(_CategoryList[index].name),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.delete))

              ],),
              subtitle: Text(_CategoryList[index].description),
              leading: IconButton(
              onPressed: (){
                 _editCategory(context, _CategoryList[index].id);
                //print(_CategoryList[index].id);
              },
              icon: Icon(Icons.edit)),
            ) ,);

      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showForm(context);
        },
        child: Icon(Icons.add),
      ),
      
    );
  }
}