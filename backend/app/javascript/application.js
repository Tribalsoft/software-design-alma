// Import básico de Rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", () => {
  feather.replace();

  //* === MODO OSCURO: Iconos de cambio de tema ===
  const sidebar = document.getElementById("sidebar");
  const toggleBtn = document.getElementById("sidebarToggle");
  const backdrop = document.getElementById("backdrop");

  if (toggleBtn) {
    toggleBtn.addEventListener("click", () => {
      sidebar.classList.toggle("active");
      backdrop.style.display = sidebar.classList.contains("active")
        ? "block"
        : "none";
    });
  }

  backdrop.addEventListener("click", () => {
    sidebar.classList.remove("active");
    backdrop.style.display = "none";
  });

  //* === MODO OSCURO ===
  const toggleButton = document.getElementById("theme-toggle");
  const themeToggleXl = document.getElementById("theme-toggle-xl");

  const applyTheme = (theme) => document.body.setAttribute("data-theme", theme);
  const savedTheme = localStorage.getItem("theme") || "light";
  applyTheme(savedTheme);

  const toggleTheme = () => {
    const currentTheme = localStorage.getItem("theme") || "light";
    const newTheme = currentTheme === "light" ? "dark" : "light";
    localStorage.setItem("theme", newTheme);
    applyTheme(newTheme);
  };

  if (toggleButton) toggleButton.addEventListener("click", toggleTheme);
  if (themeToggleXl) themeToggleXl.addEventListener("click", toggleTheme);

  //* === CAMBIO DE IDIOMA ===
  const languageButton = document.getElementById("internalization");
  const languageButtonXl = document.getElementById("internalization-xl");

  const changeLanguage = () => {
    const currentLocale = window.location.pathname.split("/")[1];
    const newLocale = currentLocale === "es" ? "en" : "es";
    const newPath = window.location.pathname.replace(
      /^\/(en|es)/,
      "/" + newLocale
    );
    window.location.href = newPath + window.location.search;
  };

  if (languageButton) languageButton.addEventListener("click", changeLanguage);
  if (languageButtonXl)
    languageButtonXl.addEventListener("click", changeLanguage);

  //* === CHART.JS: Usuarios por mes ===
  const chartEl = document.getElementById("usuariosChart");
  if (chartEl) {
    const labels = JSON.parse(chartEl.dataset.labels || "[]");
    const values = JSON.parse(chartEl.dataset.values || "[]");

    const ctx = chartEl.getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: "Usuarios registrados",
            data: values,
            backgroundColor: "rgba(54, 162, 235, 0.6)",
            borderColor: "rgba(54, 162, 235, 1)",
            barThickness: 5,
          },
        ],
      },
      options: {
        plugins: {
          legend: { display: false },
          tooltip: {
            enabled: false, // Desactiva el tooltip por defecto
            external: function (context) {
              // Crear el div si no existe
              let tooltipEl = document.getElementById("chartjs-tooltip");
              if (!tooltipEl) {
                tooltipEl = document.createElement("div");
                tooltipEl.id = "chartjs-tooltip";
                tooltipEl.style.position = "absolute";
                tooltipEl.style.background = "white";
                tooltipEl.style.borderRadius = "4px";
                tooltipEl.style.padding = "6px 8px";
                tooltipEl.style.fontSize = "0.875rem";
                tooltipEl.style.color = "#333";
                tooltipEl.style.whiteSpace = "nowrap";
                tooltipEl.style.pointerEvents = "none";
                tooltipEl.style.boxShadow = "0 1px 30px rgba(0, 0, 0, 0.1)";
                tooltipEl.style.zIndex = "9999";
                tooltipEl.style.transition = "opacity 0.2s ease";
                tooltipEl.style.opacity = "0";
                document.body.appendChild(tooltipEl);
              }

              const tooltipModel = context.tooltip;

              // Ocultar si no hay tooltip
              if (!tooltipModel || tooltipModel.opacity === 0) {
                tooltipEl.style.opacity = "0";
                return;
              }

              const label = tooltipModel.dataPoints?.[0]?.label || "";
              const value = tooltipModel.dataPoints?.[0]?.formattedValue || "";

              tooltipEl.innerHTML = `
                <div style="text-align: center;">
                  <div style="font-weight: bold;">${label}</div>
                  <br>
                  <div style="display: flex; align-items: center; justify-content: center; gap: 6px;">
                    <span style="
                      display: inline-block;
                      width: 8px;
                      height: 8px;
                      border-radius: 50%;
                      background-color: blue;">
                    </span>
                    <span class="fw-bold text-dark">${value}</span>
                  </div>
                </div>
                `;

              // Posicionar el tooltip encima del punto
              const canvasRect = context.chart.canvas.getBoundingClientRect();
              const tooltipWidth = tooltipEl.offsetWidth;

              tooltipEl.style.left = `${
                canvasRect.left +
                window.pageXOffset +
                tooltipModel.caretX -
                tooltipWidth / 2
              }px`;
              tooltipEl.style.top = `${
                canvasRect.top + window.pageYOffset + tooltipModel.caretY - 40
              }px`; // 40px arriba del punto
              tooltipEl.style.opacity = "1";
            },
          },
        },
        scales: {
          x: {
            display: false, // Oculta los nombres de los meses
          },
          y: {
            display: false, // Oculta el eje Y
          },
        },
      },
    });
  }

  // * === CAROUSEL DE IMÁGENES ===
  const images = document.querySelectorAll(".carousel-image");
  const prevBtn = document.querySelector(".carousel-btn.prev");
  const nextBtn = document.querySelector(".carousel-btn.next");
  const dots = document.querySelectorAll(".carousel-dot");

  let currentIndex = 0;
  let intervalId;

  const updateImages = () => {
    images.forEach((img, index) => {
      img.classList.toggle("active", index === currentIndex);
    });

    dots.forEach((dot, index) => {
      dot.classList.toggle("active", index === currentIndex);
    });
  };

  const goTo = (index) => {
    currentIndex = index;
    updateImages();
  };

  const next = () => {
    currentIndex = (currentIndex + 1) % images.length;
    updateImages();
  };

  const prev = () => {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    updateImages();
  };

  nextBtn.addEventListener("click", next);
  prevBtn.addEventListener("click", prev);

  dots.forEach((dot) => {
    dot.addEventListener("click", () => {
      goTo(parseInt(dot.dataset.index));
    });
  });

  intervalId = setInterval(next, 3000);

  updateImages();
});
