const admin = require("firebase-admin/app");
admin.initializeApp();

const generateFutureDocuments = require("./generate_future_documents.js");
exports.generateFutureDocuments =
  generateFutureDocuments.generateFutureDocuments;
