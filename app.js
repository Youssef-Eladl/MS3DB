// Event listener for DOM content loaded
document.addEventListener('DOMContentLoaded', function() {
  // Login form handling
  const loginForm = document.getElementById('loginForm');
  if (loginForm) {
    loginForm.addEventListener('submit', function(event) {
      event.preventDefault();
      // Authentication logic
      const username = document.getElementById('username').value;
      const password = document.getElementById('password').value;
      if (username === 'admin' && password === 'admin123') {
        window.location.href = 'admin-dashboard.html';
      } else if (username === 'customer' && password === 'cust123') {
        window.location.href = 'customer-dashboard.html';
      } else {
        document.getElementById('feedback').innerText = 'Unsuccessful login attempt.';
      }
    });
  }

  // Top navigation scroll behavior
  let lastScroll = 0;
  const topNav = document.getElementById('topNav');

  if (topNav) {
    window.addEventListener('scroll', () => {
      const currentScroll = window.pageYOffset;

      if (currentScroll <= 0) {
        // Ensure top-nav is visible when at the very top
        topNav.classList.remove('hidden');
        return;
      }

      if (currentScroll > lastScroll) {
        // Scrolling down - hide top-nav
        topNav.classList.add('hidden');
      } else {
        // Scrolling up
        if (currentScroll < lastScroll && currentScroll <= 50) {
          // Show top-nav only if near the top of the page
          topNav.classList.remove('hidden');
        }
      }

      lastScroll = currentScroll;
    });
  }

  // Slideshow Functionality
  let slideIndex = 0;
  const slides = document.querySelectorAll('.slide');

  function showSlides() {
    slides.forEach((slide) => {
      slide.style.display = 'none';
    });
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1; }
    slides[slideIndex - 1].style.display = 'block';
    setTimeout(showSlides, 6000); // Change image every 6 seconds
  }

  showSlides();
});

// User type selection handling
function setUserType(type) {
  try {
    localStorage.setItem('userType', type);
    // Redirect based on user type
    if (type === 'admin') {
      window.location.href = 'admin-dashboard.html';
    } else {
      window.location.href = 'customer-dashboard.html';
    }
  } catch (error) {
    console.error('Error setting user type:', error);
  }
}