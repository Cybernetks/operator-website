(() => {
  const choices = ['system', 'light', 'dark'];
  let preference = 'system';
  try { const saved = localStorage.getItem('operator-theme'); if (choices.includes(saved)) preference = saved; } catch {}
  const apply = () => {
    if (preference === 'system') delete document.documentElement.dataset.theme;
    else document.documentElement.dataset.theme = preference;
    const button = document.querySelector('.theme');
    if (button) {
      button.hidden = false;
      button.textContent = `Theme: ${preference[0].toUpperCase()}${preference.slice(1)}`;
      button.setAttribute('aria-label', `Colour theme: ${preference}. Switch to ${choices[(choices.indexOf(preference) + 1) % choices.length]}.`);
    }
  };
  apply();
  document.addEventListener('DOMContentLoaded', () => {
    apply();
    document.querySelector('.theme').addEventListener('click', () => {
      preference = choices[(choices.indexOf(preference) + 1) % choices.length];
      try { localStorage.setItem('operator-theme', preference); } catch {}
      apply();
    });
  });
})();
