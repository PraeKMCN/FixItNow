const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotificationOnProfileUpdate = functions.firestore
    .document('profile/{userId}')
    .onUpdate((change, context) => {
        const newData = change.after.data();
        const previousData = change.before.data();

        // Check if specific fields have been updated (e.g., 'name', 'email', 'phone')
        if (newData.name !== previousData.name || 
            newData.email !== previousData.email || 
            newData.phone !== previousData.phone) {
            
            // Get user token from Firestore or other data source
            const userToken = 'USER_FCM_TOKEN';

            // Construct payload for notification
            const payload = {
                notification: {
                    title: 'ข้อมูลส่วนตัวถูกอัปเดต',
                    body: 'ข้อมูลส่วนตัวของคุณถูกอัปเดตในระบบ',
                    // สามารถเพิ่มข้อมูลอื่นๆ เพื่อแสดงในการแจ้งเตือนได้
                }
            };

            // Send notification
            return admin.messaging().sendToDevice(userToken, payload);
        }

        return null;
    });
