'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "efeebe2aa87c51fcf7637223157bf770",
"version.json": "ee9d1719ea4cc82820027965a4cc5ef9",
"index.html": "88825420e4afaaa07e579f556251f9f9",
"/": "88825420e4afaaa07e579f556251f9f9",
"main.dart.js": "919a38e66e5876e3995f190e24c733ac",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "4989b3df79015208c6e679f533be617d",
"icons/Icon-192.png": "35ff1ac89bdb3b8302b31f76f33a54ee",
"icons/Icon-maskable-192.png": "35ff1ac89bdb3b8302b31f76f33a54ee",
"icons/Icon-maskable-512.png": "a5c23efd0b27dbabcda8e594bb851b75",
"icons/Icon-512.png": "a5c23efd0b27dbabcda8e594bb851b75",
"manifest.json": "61ecaad64a33aa435b77b7a6d00349ed",
".git/config": "74f3990eb4d167934bf2cb593b398644",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/35/368a22da2464ee2e01108e076c3a9cf4cd57b1": "8f208e3b258da3abd8debb9dfc60972f",
".git/objects/58/4006a190b0ef695f2569cc44539aead1b1c082": "1058639d8071ca8aa6ed3d58722bcfd5",
".git/objects/60/0afe50c1c4a113ad824b0d3761122241f76e26": "285e15fa8f5f4a5e367e25563eea33d7",
".git/objects/34/fd07596ff7561050fbfa22bd1d8ab382ed4a76": "f2ea451d1eb0af1505b101a539a4cf97",
".git/objects/5f/b11512fc4f062c56fb2cc41899a19eb656bdc8": "cf1b8fcd7130e2adb48189505dd4b05e",
".git/objects/02/cea0769df8807873de88aa955e70fc50708a02": "0e308b4ff4a85f008e00577fe820aa2d",
".git/objects/a4/134996eea676f0ca692ba904d1ca84c346e7ae": "57c9aa713d9c05633ff72fa38e08277f",
".git/objects/ac/e4b3ee987d281d08e3dc163d23a3fea85a2988": "a34bd943a53adb55094c186fabbade73",
".git/objects/ad/74ff828f4ebfd4a002f988b272ea502ac045ac": "9499e3dc4b850df1cc90967174e2cefd",
".git/objects/ad/e6b7ece6432374f056da69366c7dbf229de719": "a77103245e6440bc8f6b8259b8d349f8",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/a2/a5312b5cef8a7731ac42bd8a556308f21227d6": "4d335cb1a7e06066d1e04b9851e7b9a9",
".git/objects/bd/a273e67e1ec45639bfdeba696fed430bdb512c": "b20ea74965e717b41684412d5df05f63",
".git/objects/c0/c58145b7313d7546b8a06d7316f1f28722ee98": "0daf0f430dac96cb3aab727706a09ad1",
".git/objects/ee/0e319c5539dbb17d9167d3b7194b5e1a963b42": "b8904b0dc33f998f23b01fa587059178",
".git/objects/fd/df5fa1fb67b532b29cb9946e0ee6d0c7e8aff1": "14aeb2def6adcaf5f51117f90804087e",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/49361bf0d0a60b9482626da15ae0a182cb4c57": "3603afe1a41182639e2562363fb48d51",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/ec/9976904b98e065230484f4bb043ea14ad70001": "2414ffbcc6d66bd4cd01de16ffbd8edb",
".git/objects/4e/ef706ca0f7ce93b4f68dcc109b4b10e1af4e2c": "ea6b60423d92ea09465f11d23fd72702",
".git/objects/11/156f7a10a40cb6555a85d05300bce344ddf0fa": "80c6da4af84d9ced5597ba36f47854a4",
".git/objects/7c/a549751335e1261404e6e9a79bf53256927284": "be2d8c60dbaaa12b7eed2326ba80e828",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/19/6a26392133a8d85bd4395d5b2063c6d80379d1": "aea64a675b4e89b1535a704fce33a417",
".git/objects/2a/4a690990049a6eefbf5d8c8c96b95921d47a47": "13e252565143e07919769fc5fa7ef9ce",
".git/objects/6b/cf8a0aef5c92b8c113dbfb1c1fb2abb0cdf844": "8989126f984537c70276db9f7c5f8a0b",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/09/482b6b9f1adea5ca7aed6d50e5d85e7f783cfc": "cfcdab0875c3f4ed2ebf483bf68b5370",
".git/objects/31/303793aca35df5838da71ad754310ddfaed50b": "d6897e6f02b15fbcdb0ef355918e332d",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/30/adb57b61089939616436eeb2d23cba1fa99a2b": "d5545eb39a63ca2d3d24a5f17015a6a4",
".git/objects/6c/b592d3bce1b30bf7c699eb0e31406a5e9a3a58": "9fa0d97cefe293009f3f5c427a2695e4",
".git/objects/52/961bfc82eea155070bfc5decdd443115a726d2": "b1282213e8655413b245620eee920e94",
".git/objects/52/af2ef0ea45dff6b71ab95d52392419e4eae4c7": "a13e8fdc615104d7482198d340233936",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/bd858903d60237595bf00d0aed8fbc7099798b": "892ddaacd87789cef70aa83ab2afcb36",
".git/objects/b8/b4ca9ea587201dfc0aec6baf69de9ca4d35fa8": "0197b37f14bdaf49e3fec6bad818f863",
".git/objects/dc/9f4fd67a6e05d852ae7d9a0406e1b24e41c405": "7abd6a43f85057a8d1e425a2f1c3606e",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/de/97459696493521f54bb2e03ca0988ec8c0c257": "4ad186af21b2665046389890d554acd5",
".git/objects/a6/1c8782c98a110cc2ef4f24aa56cd2337d356de": "0292d46ee184d5d2643a5fd1276dd0c2",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/ef/b7d8d4890945a7259bc4e308b61d58c489a40a": "0c62fc1b56f3020d68a3f0d6f689c316",
".git/objects/c3/72250c5a07deba427503961e11ffc94a6c9a83": "e9bddd76fb6799c0977c8dc9a69f03ae",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e0/f35c091ac0aac15268e118c97681c6d1179403": "1b4a9a7294fafd3720592f24fcd4c53c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/70/a3b3cfcb1bbcce1fa85a38a9332b6e6e371706": "43de2665fcf2b07e67725a1224a61a86",
".git/objects/23/49c5adb17a36643e40639ab5094cf2274ff5e2": "f07f4234dc6a90009c17f860fd05f348",
".git/objects/49/ee81841b0e03203d9af77dd9449b0053c03c43": "c1560a64f4de3d750fb9eeef4ad2b71e",
".git/objects/14/9e6e7e3f7f41f6743ec8b41a775201b69a4191": "40e6b42ddbc19aa007de1b1a6eaad6f7",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "9ed10a49ba4566e0f55bb1139a6e0818",
".git/logs/refs/heads/gh-pages": "9ed10a49ba4566e0f55bb1139a6e0818",
".git/logs/refs/remotes/origin/gh-pages": "af64fa500ff2af43853439c6014bb2ab",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "0e97b345cf4dfa2633c484908bb8aa06",
".git/refs/remotes/origin/gh-pages": "0e97b345cf4dfa2633c484908bb8aa06",
".git/index": "5630b36a9ca84376d31a3f69dfef27e6",
".git/COMMIT_EDITMSG": "f41191bb585c1ce8dcdea2d25fbaea8a",
"assets/AssetManifest.json": "769c38a4078b9d4a737cbbf94dee7316",
"assets/NOTICES": "d6e3f2cb65474a69f57b4885d0a456fc",
"assets/FontManifest.json": "cda665d8caa3062bd627a4450d3a4ad0",
"assets/AssetManifest.bin.json": "d2cab3f89f318ace40c25584530b0a8d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/loader.json": "8ff845385f734b72adcf58e739fe2fab",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "8a25232be31ff109966a0f721e7a7a92",
"assets/fonts/MaterialIcons-Regular.otf": "56095f7aad4ad584fc070358eb8b2cb8",
"assets/assets/images/jobsy.png": "7942b72a3d0d8c2b8754a3e7e34d4b93",
"assets/assets/images/yammi.png": "e0ed2a2bbd596a3cbb07d3e77a596118",
"assets/assets/images/podstream.png": "b0c85e7aaa97dfb5bfa040c85d63e6cf",
"assets/assets/images/enduro.png": "33d9910cc80faf293275edd8ed5f71f4",
"assets/assets/images/worldmap.png": "a162d5634d8deed0af89c1c538fb5030",
"assets/assets/json/lottie.json": "2010d009026b719540e4715b51604712",
"assets/assets/icons/github.svg": "11206aac9debacddcb4b7b3d5e3899d5",
"assets/assets/icons/linkedin.svg": "f8e0ec85b1ec46595dff58b8b8757d92",
"assets/assets/icons/play.png": "c46ea9cb88b4944cb33838b0b1a4f20c",
"assets/assets/fonts/NotoColorEmoji.ttf": "4fe7efc8158db92f5ad9047375808342",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
