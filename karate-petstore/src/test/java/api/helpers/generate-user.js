function fn() {
  var suffix = java.util.UUID.randomUUID().toString().substring(0, 8);
  var timestamp = java.lang.System.currentTimeMillis();

  var user = {
    id: 0,
    username: 'qa_user_' + suffix,
    firstName: 'Ana',
    lastName: 'QA',
    email: 'ana.qa.' + suffix + '@petstore.test',
    password: 'SecurePass123!',
    phone: '300' + ('' + timestamp).substring(7),
    userStatus: 1
  };

  return {
    createPayload: user,
    username: user.username,
    firstName: user.firstName,
    lastName: user.lastName,
    email: user.email,
    password: user.password,
    phone: user.phone,
    userStatus: user.userStatus,
    updatedFirstName: 'Maria',
    updatedLastName: 'Actualizada',
    updatedEmail: 'maria.actualizada.' + suffix + '@petstore.test'
  };
}
