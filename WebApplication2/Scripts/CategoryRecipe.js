categories =
    [
        { categoryName: "Soup", categoryId: 1 },
        { categoryName: "Vegetable", categoryId: 2 },
        { categoryName: "Meat", categoryId: 3 },
        { categoryName: "Pasta", categoryId: 4 },
        { categoryName: "Chicken", categoryId: 5 },
        { categoryName: "Drink", categoryId: 6 },
        { categoryName: "Dessert", categoryId: 7 },
        { categoryName: "Seafood", categoryId: 8 },
    ];

function findPageName() {
    var urlParams = new URLSearchParams(window.location.search);
    var categoryName = urlParams.get('CategoryName');
    return categoryName;
};

function findElementOfPage() {
    document.querySelectorAll(".categories-left-vertical-tab-name")
        .forEach((item) => {

            if (findPageName() === item.innerHTML) {
                item.classList.add('anan');
            }
        });
};

findElementOfPage();