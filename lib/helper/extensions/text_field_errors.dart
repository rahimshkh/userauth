import '../constants/custom_strings.dart';

extension FieldValidation on String{
  emailValidation(){
    if(isEmpty){
      return AppStrings.kEmptyEmail;
    }
    else if(!contains("@")){
      return AppStrings.kInvalidEmail;
    }
    else{
      return null;
    }
  }

  passwordValidation(){
    if(isEmpty){
      return AppStrings.kEmptyPassword;
    }
    else if(length<6){
      return AppStrings.kShortPassword;
    }else{
      return null;
    }
  }

  nameValidation(){
    if(isEmpty){
      return AppStrings.kEmptyNameField;
    }
    else{
      return null;
    }
  }
}