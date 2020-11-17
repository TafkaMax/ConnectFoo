self.addEventListener('install', function(event) {
    console.log('Sw event', event); 
});

self.addEventListener('activate', function (event) {
    console.log('SW activate', event);
});

self.addEventListener('fetch', function(event) {
    console.log('SW fetch', event);
    event.respondWith(
        fetch(event.request).then(response => {
            console.log('fetch response', response)
            return response;
        })
    );
});