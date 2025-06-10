export function initSidebar() {
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

  backdrop?.addEventListener("click", () => {
    sidebar.classList.remove("active");
    backdrop.style.display = "none";
  });
}
