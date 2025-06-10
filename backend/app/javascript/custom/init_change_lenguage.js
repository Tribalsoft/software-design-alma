export function initChangeLanguage() {
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
}
