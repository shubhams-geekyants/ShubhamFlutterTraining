import 'package:university_management/student.dart';

void main(List<String> arguments) {
  try {
    var newStudent = Student(
        age: 21,
        name: 'Shubham Srivastava',
        email: 'shubham9918sri@gmail.com',
        phoneNo: '9170647101',
        city: 'Greater Noida',
        country: 'India',
        postalCode: '272302',
        state: 'Uttar Pradesh'
    );
    print(newStudent.details);
    newStudent.update(age: 20);
    print(newStudent.details);
    newStudent.update(email: 'shubham9170sri@gmail.com', postalCode: '201306');
    print(newStudent.details);
  }catch (e){
    print(e);
  }
}
