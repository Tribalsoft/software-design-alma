// Import básico de Rails
import "@hotwired/turbo-rails";
import "controllers";

import { initSidebar } from "custom/init_sidebar";
import { initDarkMode } from "custom/init_dark_mode";
import { initChangeLanguage } from "custom/init_change_lenguage";
import { initChartJsUsersLastMonth } from "custom/init_chart_js_users_last_month";
import { initCarouselImages } from "custom/init_carousel_images";

document.addEventListener("turbo:load", () => {
  //* === Iconos ===
  try {
    if (window.feather) feather.replace();
  } catch (e) {
    console.warn("Feather error:", e);
  }

  //* === Sidebar ===
  try {
    initSidebar();
  } catch (e) {
    console.warn("Sidebar error:", e);
  }

  //* === MODO OSCURO ===
  try {
    initDarkMode();
  } catch (e) {
    console.warn("Sidebar error:", e);
  }

  //* === CAMBIO DE IDIOMA ===
  try {
    initChangeLanguage();
  } catch (e) {
    console.warn("Change language error:", e);
  }

  //* === CHART.JS: Usuarios por mes ===
  try {
    initChartJsUsersLastMonth();
  } catch (e) {
    console.warn("Chart.js error:", e);
  }

  // * === CAROUSEL DE IMÁGENES ===
  try {
    initCarouselImages();
  } catch (e) {
    console.warn("Carousel error:", e);
  }
});
