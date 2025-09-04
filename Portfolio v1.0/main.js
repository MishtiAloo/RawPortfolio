window.addEventListener("DOMContentLoaded", () => {
    const nav = document.querySelector(".nav-container");
    document.body.style.paddingTop = nav.offsetHeight + "px";
});

const filters = document.querySelectorAll(".project-filter-container > div");
const slider = document.querySelector(".project-filter-slider");
const container = document.querySelector(".project-filter-container");

filters.forEach((filter) => {
    filter.addEventListener("click", () => {
        const containerRect = container.getBoundingClientRect();
        const rect = filter.getBoundingClientRect();

        slider.style.width = rect.width + 20 + "px";
        slider.style.height = rect.height + 10 + "px";
        slider.style.left = rect.left - containerRect.left - 10 + "px";
        slider.style.top = rect.top - containerRect.top - 7 + "px";
    });
});

const trigger = document.getElementById("nav-project");
const dropdown = document.getElementById("nav-project-dropdown");

let hideTimeout;

function showDropdown() {
    clearTimeout(hideTimeout);

    const rect = trigger.getBoundingClientRect();
    dropdown.style.position = "fixed";
    dropdown.style.top = `${rect.bottom}px`;
    dropdown.style.left = `${rect.left}px`;
    dropdown.style.display = "flex";

    requestAnimationFrame(() => {
        dropdown.style.opacity = "1";
        dropdown.style.transform = "translateY(0)";
        dropdown.style.pointerEvents = "auto";
    });
}

function hideDropdown() {
    hideTimeout = setTimeout(() => {
        dropdown.style.opacity = "0";
        dropdown.style.transform = "translateY(10px)";
        dropdown.style.pointerEvents = "none";

        setTimeout(() => {
            dropdown.style.display = "none";
        }, 300);
    }, 200);
}

// Attach to BOTH trigger and dropdown
[trigger, dropdown].forEach((el) => {
    el.addEventListener("mouseenter", showDropdown);
    el.addEventListener("mouseleave", hideDropdown);
});

const navToggle = document.querySelector(".nav-toggle");
const sideMenu = document.getElementById("sideMenu");
const menuOverlay = document.getElementById("menuOverlay");
const sliderClose = document.querySelector("#nav-slider-close");

navToggle.addEventListener("click", () => {
    sideMenu.classList.toggle("active");
    menuOverlay.classList.toggle("active");
    document.body.classList.add("menu-open");
});

menuOverlay.addEventListener("click", () => {
    sideMenu.classList.remove("active");
    menuOverlay.classList.remove("active");
    document.body.classList.remove("menu-open");
});

sliderClose.addEventListener("click", () => {
    sideMenu.classList.remove("active");
    menuOverlay.classList.remove("active");
    document.body.classList.remove("menu-open");
});

// Select all elements you want to animate
const slideElements = document.querySelectorAll(".slide-in");

const observer = new IntersectionObserver(
    (entries, observer) => {
        entries.forEach((entry) => {
            if (entry.isIntersecting) {
                entry.target.classList.add("show"); // add animation class
                observer.unobserve(entry.target); // animate once (optional)
            }
        });
    },
    {
        threshold: 0.2, // trigger when 20% is visible
    }
);

slideElements.forEach((el) => observer.observe(el));


document.getElementById("contactForm").addEventListener("submit", function(e) {
    e.preventDefault();

    // Collect form values
    const params = {
        from_name: document.getElementById("txtName").value,
        from_email: document.getElementById("txtEmail").value,
        message: document.getElementById("txtMessage").value
    };

    // Send with EmailJS
    emailjs.send("service_kajldpn", "template_xeoio0g", params)
    .then(function(response) {
        alert("Message sent successfully!");
    document.getElementById("contactForm").reset();
    }, function(error) {
        alert("Failed to send message. Try again later.");
    console.error("EmailJS error:", error);
    });
});

