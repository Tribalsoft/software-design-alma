export function initCarouselImages() {
  const images = document.querySelectorAll(".carousel-image");
  const prevBtn = document.querySelector(".carousel-btn.prev");
  const nextBtn = document.querySelector(".carousel-btn.next");
  const dots = document.querySelectorAll(".carousel-dot");

  // Salir si no hay imágenes o botones (evita errores en páginas sin carrusel)
  if (!images.length || !prevBtn || !nextBtn || !dots.length) return;

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
}
