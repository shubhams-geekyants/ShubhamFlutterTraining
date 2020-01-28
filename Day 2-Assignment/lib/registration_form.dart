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
    print('Name: ${fullName}\nEmail: ${email}\nPhone No.: ${phoneNo}\nAge: ${age}');
  }
}