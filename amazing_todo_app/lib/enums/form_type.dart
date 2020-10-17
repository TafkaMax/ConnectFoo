enum FormType { register, login }

String getFormTypeString(form) {
  return form == FormType.login
      ? FormType.login.toString().split('.').last
      : FormType.register.toString().split('.').last;
}

FormType getFormType(form) {
  return form == FormType.login ? FormType.register : FormType.login;
}
