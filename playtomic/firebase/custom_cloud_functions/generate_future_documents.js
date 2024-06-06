const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const db = admin.firestore();

exports.generateFutureDocuments = functions.pubsub
  .schedule("every day 00:00")
  .onRun(async (context) => {
    const today = new Date();
    const newDate = new Date();
    newDate.setDate(today.getDate() + 7);

    // Format the new date to Firestore Timestamp
    const formattedDate = admin.firestore.Timestamp.fromDate(newDate);

    try {
      // Get all courts
      const courtsSnapshot = await db.collection("court").get();
      if (courtsSnapshot.empty) {
        console.log("No courts found.");
        return null;
      }

      const batch = db.batch();
      courtsSnapshot.forEach((courtDoc) => {
        const courtRef = courtDoc.ref;

        // Add new available date for each court
        const newDateDocRef = db.collection("availableDates").doc();
        batch.set(newDateDocRef, {
          date: formattedDate,
          courtRef: courtRef,
        });

        for (let hour = 10; hour < 14; hour++) {
          const timeSlot = `${hour}:00`;
          const endTimeSlot = `${hour + 1}:00`;
          const availableTimeDocRef = db.collection("availableTimes").doc();

          batch.set(availableTimeDocRef, {
            time: timeSlot,
            endTime: endTimeSlot,
            taken: false,
            dateReference: newDateDocRef.id, // Store date reference as string
            dateRef: newDateDocRef,
          });
        }
      });

      await batch.commit();
      console.log("Scheduled function completed successfully.");
      return null;
    } catch (error) {
      console.error("Error creating new date and time slots: ", error);
      return null;
    }
  });
