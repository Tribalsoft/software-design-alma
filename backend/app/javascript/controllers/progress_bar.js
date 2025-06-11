document.addEventListener("turbo:load", () => {
  const triggerProgress = () => {
    if (Turbo?.navigator?.delegate?.adapter?.progressBar) {
      Turbo.navigator.delegate.adapter.progressBar.setValue(0);
      Turbo.navigator.delegate.adapter.progressBar.show();
    }
  };

  document.addEventListener("turbo:submit-start", triggerProgress);
  document.addEventListener("turbo:submit-end", () => {
    if (Turbo?.navigator?.delegate?.adapter?.progressBar) {
      Turbo.navigator.delegate.adapter.progressBar.setValue(1);
      Turbo.navigator.delegate.adapter.progressBar.hide();
    }
  });

  document.querySelectorAll(".quantity-button, .remove-button").forEach(button => {
    button.addEventListener("click", triggerProgress);
  });
});
