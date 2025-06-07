export function initDarkMode() {
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
}
