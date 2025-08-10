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
