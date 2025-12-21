class TextFieldErrorCheck {
  // এই function শুধু error message return করবে
  // যদি valid হয় → null return করবে
  String? validate(String value, String fieldName) {
    if (value.isEmpty) {
      switch (fieldName) {
        case "email":
          return "Please enter email";
        case "firstname":
          return "Please enter First Name";
        case "lastname":
          return "Please enter Last Name";
        case "number":
          return "Please enter Number";
        case "password":
          return "Please enter Password";
        default:
          return null;
      }
    }
    // email check
    if (fieldName == "email" && !value.contains("@")) {
      return "Enter a valid email";
    }



    return null; // valid হলে null
  }
}




