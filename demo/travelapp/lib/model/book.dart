class Book {
  final String title;
  final String author;

  Book({this.title, this.author});

  factory Book.fromJSON(Map data){
//    print(data.runtimeType);
    return Book(
      title: data['title'],
      author: data['author']
    );
  }

}