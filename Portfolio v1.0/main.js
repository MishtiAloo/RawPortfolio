window.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector(".nav-container");
  document.body.style.paddingTop = nav.offsetHeight + "px";
});

window.addEventListener("load", () => {
  const container = document.querySelector(".project-filter-container");
  if (!container) return;

  const slider = container.querySelector(".project-filter-slider");
  const allChildDivs = Array.from(container.querySelectorAll(":scope > div"));
  const filters = allChildDivs.filter(
    (el) => !el.classList.contains("project-filter-slider")
  );

  const sliderTags = ["All", "Web dev", "Android", "Desktop", "Other"];
  const sliderTagsNorm = sliderTags.map((t) => t.toLowerCase());

  function moveSliderTo(filterEl) {
    if (!slider || !container || !filterEl) return;

    const containerRect = container.getBoundingClientRect();
    const rect = filterEl.getBoundingClientRect();

    slider.style.width = rect.width + 20 + "px";
    slider.style.height = rect.height + 10 + "px";
    slider.style.left = rect.left - containerRect.left - 10 + "px";
    slider.style.top = rect.top - containerRect.top - 7 + "px";
  }

  function filterProjects(selectedTag) {
    const selNorm = (selectedTag || "").toLowerCase();
    const projects = Array.from(
      document.querySelectorAll(".project-container")
    );

    projects.forEach((proj) => {
      const span = proj.querySelector(".project-tag span");
      const tagsText = span ? span.textContent : "";
      const projectTags = tagsText
        .split(",")
        .map((t) => t.trim())
        .filter(Boolean)
        .map((t) => t.toLowerCase());

      let show = false;
      if (selNorm === "all" || selNorm === "") {
        show = true;
      } else if (selNorm === "other") {
        const hasKnown = projectTags.some((t) => sliderTagsNorm.includes(t));
        show = !hasKnown;
      } else {
        show = projectTags.includes(selNorm);
      }

      proj.style.display = show ? "" : "none";
    });
  }

  filters.forEach((filter) => {
    const label =
      filter.querySelector(".animated-links")?.textContent?.trim() || "";
    filter.addEventListener("click", () => {
      moveSliderTo(filter);
      filterProjects(label);

      filters.forEach((f) => f.classList.remove("active"));
      filter.classList.add("active");
    });
  });

  // initialize to "All" filter
  const defaultFilter =
    filters.find(
      (f) =>
        (f.querySelector(".animated-links")?.textContent || "")
          .trim()
          .toLowerCase() === "all"
    ) || filters[0];

  if (defaultFilter) {
    const defaultLabel =
      defaultFilter.querySelector(".animated-links")?.textContent?.trim() ||
      "All";
    moveSliderTo(defaultFilter);
    filterProjects(defaultLabel);
    defaultFilter.classList.add("active");
  }
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

document.getElementById("contactForm").addEventListener("submit", function (e) {
  e.preventDefault();

  // Collect form values
  const params = {
    from_name: document.getElementById("txtName").value,
    from_email: document.getElementById("txtEmail").value,
    message: document.getElementById("txtMessage").value,
  };

  // Send with EmailJS
  emailjs.send("service_kajldpn", "template_xeoio0g", params).then(
    function (response) {
      alert("Message sent successfully!");
      document.getElementById("contactForm").reset();
    },
    function (error) {
      alert("Failed to send message. Try again later.");
      console.error("EmailJS error:", error);
    }
  );
});


const roles = [
    "Web Developer",
    "M/L Enthusiast",
    "Android Developer",
    "Hardware Developer"
];

let index = 0;
const roleSpan = document.getElementById("role");

function showRole() {
    roleSpan.style.opacity = 0;
    setTimeout(() => {
        roleSpan.textContent = roles[index];
        roleSpan.style.transform = "translateX(100%)"; 
        roleSpan.style.opacity = 1;

        // animate sliding in
        roleSpan.animate(
            [
                { transform: "translateX(100%)", opacity: 0 },
                { transform: "translateX(0)", opacity: 1 }
            ],
            { duration: 600, easing: "ease-out", fill: "forwards" }
        );

        index = (index + 1) % roles.length;
    }, 300);
}

showRole();
setInterval(showRole, 3000);
