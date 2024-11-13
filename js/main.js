// элементы формы и списка товара
const productForm = document.querySelector('.products-form');
const productList = document.querySelector('.products-list'); 
const manufacturerFilter = document.getElementById('manufacturerFilter'); 
const sortSelect = document.getElementById('sortSelect'); 

// Добавление обработчиков событий
productForm.addEventListener('submit', handleProductFormSubmit);
productList.addEventListener('click', handleProductListClick); 
manufacturerFilter.addEventListener('change', filterProductsByManufacturer); 
sortSelect.addEventListener('change', sortProductsByPrice);

// Показать форму добавления нового продукта при нажатии на кнопку
document.getElementById('addNewProductButton').onclick = function() {
    document.querySelector('.form-container').style.display = 'flex'; 
    document.querySelector('.scroll-to-products-container').style.display = 'flex';
};

// Скрыть формы при нажатии на кнопку отмены
document.getElementById('cancelButton').onclick = function() {
    document.querySelector('.form-container').style.display = 'none'; 
    document.querySelector('.edit-form-container').style.display = 'none'; 
    document.querySelector('.scroll-to-products-container').style.display = 'none'; 
};

// Обработчик формы
function handleProductFormSubmit(event) {
    event.preventDefault(); 
}

// Функция добавления нового продукта
function addClick() {
    const productObj = {
        title: document.getElementById('title').value.trim(),
        main_image_path: document.getElementById('main_image_path').value.trim(),
        description: document.getElementById('description').value.trim(),
        cost: parseFloat(document.getElementById('cost').value.trim()),
        is_active: document.getElementById('isActive').checked,
        manufacturer: document.getElementById('manufacturer').value
    };

    // Проверка на заполненность необходимых полей
    if (productObj.title === "" || productObj.main_image_path === "" || isNaN(productObj.cost) || productObj.cost <= 0) {
        alert("Пожалуйста, заполните все поля корректно."); 
        return;
    }

    // Вызов функции для создания продукта и последующий рендер
    createProduct(productObj)
        .then(newProductObj => {
            renderOneProduct(newProductObj);
            alert('Товар успешно добавлен!'); 
            console.log('Успешно!:', newProductObj);
        })
        .catch(error => {
            console.error("Ошибка при добавлении продукта:", error); 
        });

    document.getElementById('productForm').reset(); // Сброс формы
}

// Функция вывода одного продукта
function renderOneProduct(productObj) {
    const card = document.createElement("div"); 
    card.className = "product"; 
    card.dataset.id = productObj.id; 
    card.dataset.manufacturer = productObj.manufacturer; 

    // Добавление классов для отображения статуса активности продукта
    if (productObj.is_active === false) {
        card.classList.add('inactive');
    }

    // Заполнение HTML содержимым продукта
    card.innerHTML = `
        <div class="product-item ${productObj.is_active ? '' : 'inactive'}">
            <img class="image" src="${productObj.main_image_path}" name="image">
            <div class="product-title" name="title">${productObj.title}</div>
            <label class="id" id="productId">Артикул: ${productObj.id}</label>
            <div class="product-description" name="description">${productObj.description || 'Описание отсутствует.'}</div>
            <div class="product-cost" name="cost">Цена: <span>${productObj.cost}</span> рублей.</div>
            <div>
                <button class="button edit-button" id="scrollTopButton">Изменить</button>
                <button class="button delete-button">Удалить</button>
                <button class="button history-button">История</button>
            </div>
        </div>`;

    // Добавить карточку продукта в список
    document.getElementById("productsListBox").append(card);
}

// Функция вывода всех продуктов
function renderAllProducts(productData) {
    productData.forEach(renderOneProduct); 
}

// Обработчик кликов по списку продуктов
function handleProductListClick(event) {
    // Удаление продукта
    if (event.target.matches(".delete-button")) {
        const button = event.target;
        const card = button.closest(".product"); 
        const id = card.dataset.id; 
        if (confirm("Вы действительно хотите удалить?")) { 
            deleteProduct(id)
                .then(data => {
                    card.remove(); 
                    console.log('Успешно:', data); 
                })
                .catch(error => {
                    console.error('Ошибка:', error); 
                });
        }
    } 
    // Редактирование продукта
    else if (event.target.matches(".edit-button")) {
        const button = event.target;
        const card = button.closest(".product");
        const id = card.dataset.id; 
        const productData = {
            id: id,
            title: card.querySelector('.product-title').textContent,
            main_image_path: card.querySelector('.image').src,
            description: card.querySelector('.product-description').textContent,
            cost: parseFloat(card.querySelector('.product-cost span').textContent),
            is_active: !card.classList.contains('inactive'), 
            manufacturer: card.dataset.manufacturer
        };
        openEditForm(productData); 
    } 
    // Просмотр истории продукта
    else if (event.target.matches(".history-button")) {
        const button = event.target;
        const card = button.closest(".product");
        const id = card.dataset.id; 
        viewProductHistory(id); 
    }
}

// Функция инициализации
function initialize() {
    getAllProducts() 
        .then(productArray => {
            renderAllProducts(productArray) 
        })
        .catch(errors => {
            alert("Ой! Что-то не так.");
        });
}
initialize(); 

// Функция сортировки продуктов по цене
function sortProductsByPrice() {
    const sortBy = sortSelect.value; 
    const products = Array.from(document.querySelectorAll('.product')); 

    // Сортировка продуктов по цене
    products.sort((a, b) => {
        const priceA = parseFloat(a.querySelector('.product-cost span').textContent);
        const priceB = parseFloat(b.querySelector('.product-cost span').textContent);
        return sortBy === 'asc' ? priceA - priceB : priceB - priceA;
    });

    const productsListBox = document.getElementById("productsListBox");
    productsListBox.innerHTML = ''; // Очистка списка продуктов

    products.forEach(product => {
        productsListBox.appendChild(product); // Добавление отсортированных продуктов обратно в список
    });
}

// Функция фильтрации продуктов по производителю
function filterProductsByManufacturer() {
    const selectedManufacturer = manufacturerFilter.value; 
    const allProducts = Array.from(document.querySelectorAll('.product')); 
    
    // Скрытие или отображение продуктов в зависимости от выбранного фильтра
    allProducts.forEach(product => {
        const productManufacturer = product.dataset.manufacturer;
        if (selectedManufacturer === "" || productManufacturer === selectedManufacturer) {
            product.style.display = ''; 
        } else {
            product.style.display = 'none'; 
        }
    });
}

// Селектор для поиска продуктов
const searchInput = document.getElementById('searchInput');
searchInput.addEventListener('input', filterProductsBySearch); 

// Функция поиска продуктов
function filterProductsBySearch() {
    const searchTerm = searchInput.value.toLowerCase(); 
    const allProducts = Array.from(document.querySelectorAll('.product')); 

    allProducts.forEach(product => {
        const productTitle = product.querySelector('.product-title').textContent.toLowerCase();
        const productDescription = product.querySelector('.product-description') ? product.querySelector('.product-description').textContent.toLowerCase() : "";

        // Проверка наличия поискового термина в заголовке или описании
        if (productTitle.includes(searchTerm) || productDescription.includes(searchTerm)) {
            product.style.display = ''; 
        } else {
            product.style.display = 'none'; 
        }
    });
}

// функция загрузки производителей из файла JSON
async function loadManufacturers() {
    try {
        const response = await fetch('/db.json');
        if (!response.ok) throw new Error('Ошибка загрузки данных');
        const data = await response.json(); 
        populateSelectForAdd(data.manufacturer);
        populateSelectForEdit(data.manufacturer);
        populateSelectForFilter(data.manufacturer);
    } catch (error) {
        console.error('Ошибка:', error); 
    }
}

// Функция заполнения добавления нового продукта
function populateSelectForAdd(manufacturers) {
    const select = document.getElementById('manufacturer'); 
    // Создание опций для каждого производителя
    manufacturers.forEach(manufacturer => {
        const option = document.createElement('option'); 
        option.value = manufacturer.id; 
        option.textContent = manufacturer.name; 
        select.appendChild(option); 
    });
}

// Функция заполнения для редактирования продукта
function populateSelectForEdit(manufacturers) {
    const select = document.getElementById('edit-manufacturer'); 
    manufacturers.forEach(manufacturer => {
        const option = document.createElement('option'); 
        option.value = manufacturer.id; 
        option.textContent = manufacturer.name; 
        select.appendChild(option); 
    });
}

// Функция заполнения для фильтрации продуктов по производителю
function populateSelectForFilter(manufacturers) {
    const select = document.getElementById('manufacturerFilter'); 
    manufacturers.forEach(manufacturer => {
        const option = document.createElement('option'); 
        option.value = manufacturer.id; 
        option.textContent = manufacturer.name; 
        select.appendChild(option); 
    });
}

// Функция открытия формы редактирования
function openEditForm(productData) {
    // Заполнение полей формы данными продукта
    document.getElementById('edit-title').value = productData.title;
    document.getElementById('edit-main_image_path').value = productData.main_image_path;
    document.getElementById('edit-description').value = productData.description;
    document.getElementById('edit-cost').value = productData.cost;
    document.getElementById('edit-isActive').checked = productData.is_active;
    document.getElementById('edit-manufacturer').value = productData.manufacturer;
    document.getElementById('edit-productId').textContent = productData.id; 
    document.getElementById('edit-form-id').style.display = 'flex';

    // Прокрутка к верху страницы
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// Функция редактирования продукта
function editClick(){
    const productId = document.getElementById('edit-productId').value; // Получение id продукта из формы

    if (productId) { // Проверка существования id
        // Вызов функции обновления продукта
        updateProduct(productId, {
            title: document.getElementById('edit-title').value.trim(),
            main_image_path: document.getElementById('edit-main_image_path').value.trim(),
            description: document.getElementById('edit-description').value.trim(),
            cost: parseFloat(document.getElementById('edit-cost').value.trim()),
            is_active: document.getElementById('edit-isActive').checked,
            manufacturer: document.getElementById('edit-manufacturer').value
        })
        .then(updatedProductObj => {
            updateProductCard(updatedProductObj); 
            alert('Товар успешно изменен!'); 
            console.log('Успешно!', updatedProductObj); 
            document.getElementById('edit-form-id').style.display = 'none'; 
        })
        .catch(error => {
            console.error("Ошибка при изменении продукта:", error);
        });
    }

    document.getElementById('edit-productId').value = ''; 
}

// Функция обновления карточки продукта
function updateProductCard(updatedProductObj) {
    const card = document.querySelector(`.product[data-id='${updatedProductObj.id}']`); 
    // Обновление информации в карточке продукта
    card.querySelector('.product-title').textContent = updatedProductObj.title;
    card.querySelector('.image').src = updatedProductObj.main_image_path;
    card.querySelector('.product-description').textContent = updatedProductObj.description;
    card.querySelector('.product-cost span').textContent = updatedProductObj.cost;
    card.dataset.manufacturer = updatedProductObj.manufacturer; 
}

//функция обновления продукта на сервере
async function updateProduct(id, productObj) {
    const response = await fetch(`http://localhost:3000/product/${id}`, {
        method: 'PATCH', 
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(productObj), 
    });

    if (!response.ok) {
        throw new Error('Ошибка при изменении продукта'); 
    }
    return await response.json(); 
}

// Загрузка производителей при загрузке страницы
window.onload = loadManufacturers; 

// Кнопка прокрутки к верху страницы
const scrollTopBtn = document.getElementById("scrollTopBtn");

// Отображение кнопки прокрутки в зависимости от положения прокрутки
window.onscroll = function () {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        scrollTopBtn.style.display = "block"; 
    } else {
        scrollTopBtn.style.display = "none"; 
    }
};

// Прокрутка к верху страницы при нажатии на кнопку
scrollTopBtn.onclick = function () {
    window.scrollTo({
        top: 0,
        behavior: "smooth" 
    });
};
