document.addEventListener("DOMContentLoaded", function() {
  // Select all song containers
  
  document.querySelectorAll('.song-container').forEach(function(container) {
    console.log(container); // Log each container to verify selection
    container.addEventListener('click', function() {
        console.log('Container clicked:', container); // Log when a container is clicked
      // Get the associated audio element
      var audioId = container.getAttribute('data-audio-id');
      var audio = document.getElementById(audioId);
      
      // Pause all other audios
      document.querySelectorAll('audio').forEach(function(a) {
        if (a !== audio) a.pause();
      });

      // Play the selected audio
      if (audio.paused) {
        audio.play();
      } else {
        audio.pause();
      }
    });
  });
});