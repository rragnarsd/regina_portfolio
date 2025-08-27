// web/flutter_bootstrap.js

{{flutter_js}}
{{flutter_build_config}}

// Show loader initially
const loaderContainer = document.getElementById("flutter-loader");
loaderContainer.style.display = "flex";

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    // Engine entrypoint loaded, keep showing loader
    const appRunner = await engineInitializer.initializeEngine();
    
    // Run the app
    await appRunner.runApp();
    
    // Hide loader after app is running with smooth transition
    if (document.body.contains(loaderContainer)) {
      loaderContainer.style.transition = 'opacity 0.5s ease-out';
      loaderContainer.style.opacity = '0';
      
      setTimeout(() => {
        if (document.body.contains(loaderContainer)) {
          document.body.removeChild(loaderContainer);
        }
      }, 500);
    }
  }
});