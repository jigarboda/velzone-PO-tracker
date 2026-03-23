const CACHE='vz-tracker-v7';

self.addEventListener('install',e=>{
  self.skipWaiting();
});

self.addEventListener('activate',e=>{
  e.waitUntil(
    caches.keys().then(keys=>Promise.all(keys.map(k=>caches.delete(k)))).then(()=>self.clients.claim())
  );
});

self.addEventListener('fetch',e=>{
  // Always network-first for everything
  e.respondWith(
    fetch(e.request).then(resp=>{
      return resp;
    }).catch(()=>caches.match(e.request))
  );
});
