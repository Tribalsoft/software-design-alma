// Import básico de Rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", () => {
  // === MODO OSCURO ===
  const toggleButton = document.getElementById("theme-toggle");
  const themeToggleXl = document.getElementById("theme-toggle-xl");

  const applyTheme = (theme) => document.body.setAttribute('data-theme', theme);
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

  // === CAMBIO DE IDIOMA ===
  const languageButton = document.getElementById("internalization");
  const languageButtonXl = document.getElementById("internalization-xl");

  const changeLanguage = () => {
    const currentLocale = window.location.pathname.split("/")[1];
    const newLocale = currentLocale === "es" ? "en" : "es";
    const newPath = window.location.pathname.replace(/^\/(en|es)/, "/" + newLocale);
    window.location.href = newPath + window.location.search;
  };

  if (languageButton) languageButton.addEventListener("click", changeLanguage);
  if (languageButtonXl) languageButtonXl.addEventListener("click", changeLanguage);

  // === CHART.JS: Usuarios por mes ===
  const chartEl = document.getElementById('usuariosChart');
  if (chartEl) {
    const labels = JSON.parse(chartEl.dataset.labels || "[]");
    const values = JSON.parse(chartEl.dataset.values || "[]");

    const ctx = chartEl.getContext('2d');

    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Usuarios registrados',
          data: values,
          backgroundColor: 'rgba(54, 162, 235, 0.6)',
          borderColor: 'rgba(54, 162, 235, 1)',
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: { beginAtZero: true }
        }
      }
    });
  }
});
