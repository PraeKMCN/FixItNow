const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.setAdminRole = functions.auth.user().onCreate((user) => {
  // Set custom claim for admin role
  return admin.auth().setCustomUserClaims(user.uid, { admin: true });
});
