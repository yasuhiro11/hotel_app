// app/javascript/application.js

import "@hotwired/turbo-rails"
import "controllers"

const initProfileDropdown = () => {
  const icon = document.getElementById("profile-icon");       // 1. id で取得
  const menu = document.getElementById("dropdown-menu");
  if (!icon || !menu) return;

  // クリックで show クラスをトグル + aria-expanded を更新
  icon.addEventListener("click", (e) => {
    e.stopPropagation();
    const isOpen = menu.classList.toggle("show");
    icon.setAttribute("aria-expanded", isOpen);
  });

  // 他所をクリックしたら閉じる + aria-expanded="false"
  document.addEventListener("click", () => {
    menu.classList.remove("show");
    icon.setAttribute("aria-expanded", "false");
  });
};

// Turbo 付きページ遷移にも対応
document.addEventListener("DOMContentLoaded", initProfileDropdown);
document.addEventListener("turbo:load",       initProfileDropdown);
