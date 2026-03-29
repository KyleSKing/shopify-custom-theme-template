/**
 * Shopify Custom Theme - Global JavaScript
 * Version: 1.0.0
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
  console.log('Shopify Custom Theme - JavaScript loaded');
  
  // Initialize all components
  initMobileMenu();
  initProductImages();
  initCartUpdates();
  initFormValidation();
  initLazyLoading();
  initAccessibility();
});

/**
 * Mobile Menu Toggle
 */
function initMobileMenu() {
  const menuToggle = document.querySelector('[data-menu-toggle]');
  const menuClose = document.querySelector('[data-menu-close]');
  const mobileMenu = document.querySelector('[data-mobile-menu]');
  const body = document.body;

  if (!menuToggle || !mobileMenu) return;

  menuToggle.addEventListener('click', function(e) {
    e.preventDefault();
    mobileMenu.classList.add('active');
    body.classList.add('menu-open');
    setAriaExpanded(this, true);
  });

  if (menuClose) {
    menuClose.addEventListener('click', function(e) {
      e.preventDefault();
      closeMobileMenu();
    });
  }

  // Close menu when clicking outside
  document.addEventListener('click', function(e) {
    if (mobileMenu.classList.contains('active') && 
        !mobileMenu.contains(e.target) && 
        !menuToggle.contains(e.target)) {
      closeMobileMenu();
    }
  });

  // Close menu with Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && mobileMenu.classList.contains('active')) {
      closeMobileMenu();
    }
  });

  function closeMobileMenu() {
    mobileMenu.classList.remove('active');
    body.classList.remove('menu-open');
    setAriaExpanded(menuToggle, false);
  }

  function setAriaExpanded(element, expanded) {
    if (element) {
      element.setAttribute('aria-expanded', expanded);
    }
  }
}

/**
 * Product Image Gallery
 */
function initProductImages() {
  const productImages = document.querySelectorAll('[data-product-image]');
  const thumbnailImages = document.querySelectorAll('[data-thumbnail]');
  const zoomContainer = document.querySelector('[data-zoom-container]');

  if (productImages.length === 0) return;

  // Thumbnail click handler
  thumbnailImages.forEach(thumb => {
    thumb.addEventListener('click', function(e) {
      e.preventDefault();
      const imageUrl = this.getAttribute('data-image-src') || this.getAttribute('src');
      const mainImage = this.closest('.product-gallery').querySelector('[data-product-image]');
      
      if (mainImage) {
        // Update main image
        mainImage.src = imageUrl;
        mainImage.setAttribute('srcset', '');
        
        // Update active thumbnail
        thumbnailImages.forEach(t => t.classList.remove('active'));
        this.classList.add('active');
        
        // Update aria attributes
        thumbnailImages.forEach(t => t.setAttribute('aria-current', 'false'));
        this.setAttribute('aria-current', 'true');
      }
    });
  });

  // Image zoom (if enabled)
  if (zoomContainer && 'zoom' in window) {
    new window.zoom(zoomContainer, {
      margin: 20,
      scrollOffset: 40
    });
  }
}

/**
 * Cart Updates
 */
function initCartUpdates() {
  const cartForms = document.querySelectorAll('[data-cart-form]');
  
  cartForms.forEach(form => {
    form.addEventListener('submit', async function(e) {
      e.preventDefault();
      
      const submitButton = this.querySelector('[type="submit"]');
      const originalText = submitButton.textContent;
      
      // Show loading state
      submitButton.textContent = 'Adding...';
      submitButton.disabled = true;
      
      try {
        const formData = new FormData(this);
        const response = await fetch('/cart/add.js', {
          method: 'POST',
          body: formData,
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          }
        });
        
        const data = await response.json();
        
        if (response.ok) {
          // Success - update cart count
          updateCartCount();
          showNotification('Product added to cart successfully!', 'success');
        } else {
          // Error
          showNotification(data.description || 'Failed to add product to cart', 'error');
        }
      } catch (error) {
        console.error('Cart update error:', error);
        showNotification('Network error. Please try again.', 'error');
      } finally {
        // Reset button
        submitButton.textContent = originalText;
        submitButton.disabled = false;
      }
    });
  });

  // Update cart count
  async function updateCartCount() {
    try {
      const response = await fetch('/cart.js');
      const cart = await response.json();
      
      const countElements = document.querySelectorAll('[data-cart-count]');
      countElements.forEach(el => {
        el.textContent = cart.item_count;
      });
    } catch (error) {
      console.error('Failed to update cart count:', error);
    }
  }
}

/**
 * Form Validation
 */
function initFormValidation() {
  const forms = document.querySelectorAll('[data-validate]');
  
  forms.forEach(form => {
    form.addEventListener('submit', function(e) {
      if (!validateForm(this)) {
        e.preventDefault();
      }
    });
    
    // Real-time validation
    const inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
    inputs.forEach(input => {
      input.addEventListener('blur', function() {
        validateField(this);
      });
    });
  });

  function validateForm(form) {
    let isValid = true;
    const requiredFields = form.querySelectorAll('[required]');
    
    requiredFields.forEach(field => {
      if (!validateField(field)) {
        isValid = false;
      }
    });
    
    return isValid;
  }

  function validateField(field) {
    const value = field.value.trim();
    const errorElement = field.nextElementSibling?.classList.contains('error-message') 
      ? field.nextElementSibling 
      : createErrorMessage(field);
    
    // Clear previous errors
    field.classList.remove('error');
    errorElement.textContent = '';
    
    if (field.hasAttribute('required') && !value) {
      field.classList.add('error');
      errorElement.textContent = 'This field is required';
      return false;
    }
    
    if (field.type === 'email' && value) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(value)) {
        field.classList.add('error');
        errorElement.textContent = 'Please enter a valid email address';
        return false;
      }
    }
    
    return true;
  }

  function createErrorMessage(field) {
    const errorElement = document.createElement('div');
    errorElement.className = 'error-message';
    errorElement.setAttribute('role', 'alert');
    field.parentNode.insertBefore(errorElement, field.nextSibling);
    return errorElement;
  }
}

/**
 * Lazy Loading for Images
 */
function initLazyLoading() {
  if ('IntersectionObserver' in window) {
    const lazyImages = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.getAttribute('data-src');
          img.removeAttribute('data-src');
          img.classList.add('loaded');
          observer.unobserve(img);
        }
      });
    });
    
    lazyImages.forEach(img => imageObserver.observe(img));
  } else {
    // Fallback for older browsers
    const lazyImages = document.querySelectorAll('img[data-src]');
    lazyImages.forEach(img => {
      img.src = img.getAttribute('data-src');
      img.removeAttribute('data-src');
    });
  }
}

/**
 * Accessibility Enhancements
 */
function initAccessibility() {
  // Add focus styles for keyboard navigation
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Tab') {
      document.body.classList.add('keyboard-navigation');
    }
  });

  document.addEventListener('mousedown', function() {
    document.body.classList.remove('keyboard-navigation');
  });

  // Skip to content link
  const skipLink = document.querySelector('[data-skip-to-content]');
  if (skipLink) {
    skipLink.addEventListener('click', function(e) {
      e.preventDefault();
      const targetId = this.getAttribute('href');
      const target = document.querySelector(targetId);
      
      if (target) {
        target.setAttribute('tabindex', '-1');
        target.focus();
        
        // Remove tabindex after focus
        setTimeout(() => target.removeAttribute('tabindex'), 1000);
      }
    });
  }

  // Announce dynamic content changes
  function announce(message, priority = 'polite') {
    const announcement = document.getElementById('a11y-announcement') || createAnnouncementElement();
    announcement.setAttribute('aria-live', priority);
    announcement.textContent = message;
    
    // Clear message after announcement
    setTimeout(() => {
      announcement.textContent = '';
    }, 1000);
  }

  function createAnnouncementElement() {
    const div = document.createElement('div');
    div.id = 'a11y-announcement';
    div.setAttribute('aria-live', 'polite');
    div.setAttribute('aria-atomic', 'true');
    div.classList.add('sr-only');
    document.body.appendChild(div);
    return div;
  }

  // Expose announce function globally
  window.announce = announce;
}

/**
 * Utility: Show Notification
 */
function showNotification(message, type = 'info') {
  // Create notification element
  const notification = document.createElement('div');
  notification.className = `notification notification--${type}`;
  notification.setAttribute('role', 'alert');
  notification.innerHTML = `
    <div class="notification__content">${message}</div>
    <button class="notification__close" aria-label="Close notification">×</button>
  `;

  // Add to DOM
  document.body.appendChild(notification);

  // Show with animation
  setTimeout(() => notification.classList.add('show'), 10);

  // Close button
  const closeBtn = notification.querySelector('.notification__close');
  closeBtn.addEventListener('click', () => {
    notification.classList.remove('show');
    setTimeout(() => notification.remove(), 300);
  });

  // Auto-remove after 5 seconds
  setTimeout(() => {
    if (notification.parentNode) {
      notification.classList.remove('show');
      setTimeout(() => notification.remove(), 300);
    }
  }, 5000);
}

/**
 * Debounce function for performance
 */
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

/**
 * Throttle function for performance
 */
function throttle(func, limit) {
  let inThrottle;
  return function(...args) {
    if (!inThrottle) {
      func.apply(this, args);
      inThrottle = true;
      setTimeout(() => inThrottle = false, limit);
    }
  };
}

// Expose utilities globally
window.debounce = debounce;
window.throttle = throttle;