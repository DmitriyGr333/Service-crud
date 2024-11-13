// Получает все продукты
function getAllProducts() {
  return fetch("http://localhost:3000/product")
    .then(response => response.json())
}

// Получает все продажи продуктов
function getAllProductSales() {
  return fetch("http://localhost:3000/product_sale")
    .then(response => response.json())
}

// Создает новый продукт
function createProduct(productObj) {
  return fetch('http://localhost:3000/product', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(productObj),
  })
    .then(response => response.json())
}

// Обновляет продукт по ID
function updateProduct(id, donationCount) {
  return fetch(`http://localhost:3000/product/${id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ 
        donations: donationCount
      }),
    })
    .then(response => {
      if (response.ok) {
        return response.json()
      } else {
        throw new Error("Ой! Что-то не так.") // Обработка ошибок
      }
    })
}

// Удаляет продукт по ID
function deleteProduct(id) {
  return fetch(`http://localhost:3000/product/${id}`, {
    method: 'DELETE',
  })
  .then(response => response.json())
}
