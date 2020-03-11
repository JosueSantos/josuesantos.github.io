/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("https://storage.googleapis.com/workbox-cdn/releases/3.2.0/workbox-sw.js");

workbox.skipWaiting();
workbox.clientsClaim();

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "index.html",
    "revision": "f47fd3625c62e632a89ef575d3eeed23"
  },
  {
    "url": "fantasmito.html",
    "revision": "3635e77adcd54c1c122cb7fc77cbc3e7"
  },
  {
    "url": "css/efeito.css",
    "revision": "13f0303b01321b080de03e692635738b"
  },
  {
    "url": "css/grayscale.css",
    "revision": "13f0456b01469b080de03e692635738b"
  },
].concat(self.__precacheManifest || []);
workbox.precaching.suppressWarnings();
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});

workbox.routing.registerRoute(/\.(?:js)$/, workbox.strategies.networkFirst({ cacheName: "js cache", plugins: [] }), 'GET');