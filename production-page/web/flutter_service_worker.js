'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "91f98bc89b5160cab17c6c554fe76ac6",
"/main.dart.js": "3cc81c7afbb8713604cdbf0a6126aa76",
"/assets/LICENSE": "f319d23332bcd98790a5d163dd7614e0",
"/assets/AssetManifest.json": "00a0cf226c227e5072f53112f145c7e6",
"/assets/FontManifest.json": "66490056dcedcc098e9f1062352c86aa",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d21f791b837673851dd14f7c132ef32e",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bdd8d75eb9e6832ccd3117e06c51f0d3",
"/assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "3ca122272cfac33efb09d0717efde2fa",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/images/img_sample_1.png": "9913e498b13b5148e16f68aaa4292ae7",
"/assets/assets/fonts/Lato-Thin.ttf": "eb1635403cd764912ca1e0af78735797",
"/assets/assets/fonts/Lato-Regular.ttf": "3b9b99039cc0a98dd50c3cbfac57ccb2"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
