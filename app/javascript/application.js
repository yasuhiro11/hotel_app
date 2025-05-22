// app/javascript/application.js

// 1. Rails UJS（= link_to …, method: :delete を動かすための仕組み）を読み込む
import Rails from "@rails/ujs"
Rails.start()

// 2. Turbo（ページ遷移周り）
import "@hotwired/turbo-rails"

// 3. Stimulus コントローラ群
import "controllers"

// 4. プロファイルドロップダウン（あなたが書いたコード）
const initProfileDropdown = () => {
  const icon = document.getElementById("profile-icon")
  const menu = document.getElementById("dropdown-menu")
  if (!icon || !menu) return

  icon.addEventListener("click", (e) => {
    e.stopPropagation()
    const isOpen = menu.classList.toggle("show")
    icon.setAttribute("aria-expanded", isOpen)
  })

  document.addEventListener("click", () => {
    menu.classList.remove("show")
    icon.setAttribute("aria-expanded", "false")
  })
}

document.addEventListener("DOMContentLoaded", initProfileDropdown)
document.addEventListener("turbo:load",       initProfileDropdown)
