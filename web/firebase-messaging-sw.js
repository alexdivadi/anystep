/* eslint-disable no-undef */
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: 'AIzaSyAh9KzbuXkOcGi_nDYvCjHfdP8DxlrkplE',
  authDomain: 'anystep-community-services.firebaseapp.com',
  projectId: 'anystep-community-services',
  storageBucket: 'anystep-community-services.firebasestorage.app',
  messagingSenderId: '970538144554',
  appId: '1:970538144554:web:10f21f826b37f1aaae0453',
  measurementId: 'G-KBCCPZ0DV3',
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  const notification = payload.notification || {};
  const title = notification.title || 'Anystep';
  const options = {
    body: notification.body || '',
    image: notification.image,
    data: payload.data || {},
  };
  self.registration.showNotification(title, options);
});

self.addEventListener('notificationclick', (event) => {
  const eventId = event.notification?.data?.event_id;
  const targetUrl = eventId ? `/events/${eventId}` : '/';
  event.notification.close();
  event.waitUntil(clients.openWindow(targetUrl));
});
