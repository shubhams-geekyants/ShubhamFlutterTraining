class RegistrationForm{
  String fullName, email, phoneNo;
  int age;
  RegistrationForm(String fullName, String email, String phoneNo, int age) {
    this.fullName = fullName;
    this.email = email;
    this.phoneNo = phoneNo;
    this.age = age;
  }
  void printDetail(){
    print('Name\t\t\t\tEmail\t\t\t\tPhone No.\t\tAge');
    print('${fullName}\t\t\t\t${email}\t\t\t\t${phoneNo}\t\t${age}');
  }
}