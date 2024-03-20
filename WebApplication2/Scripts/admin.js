let condition = true;
let condition2 = true;
function toggleRecipe() {
    document.querySelector('.suggested-recipes-container .circle-plus').classList.toggle('opened');

    const recipeDiv = document.querySelector('.suggested-recipes');
    if (condition) {
        recipeDiv.style.maxHeight = calculateMaxHeightOfRecipes("Recipe");
        condition = false;
    } else {
        recipeDiv.style.maxHeight = "0px";
        condition = true;
    }
}

function toggleComment() {
    document.querySelector('.user-comments-container .circle-plus').classList.toggle('opened');

    const commentDiv = document.querySelector('.user-comments');
    if (condition2) {
        commentDiv.style.maxHeight = calculateMaxHeightOfRecipes("Comment");
        condition2 = false;
    } else {
        commentDiv.style.maxHeight = "0px";
        condition2 = true;
    }
}

function calculateMaxHeightOfRecipes(commentOrRecipe) {
    let totalHeight = 0;
    let dom;

    switch (commentOrRecipe) {
        case "Recipe":
            dom = document.querySelectorAll('.calculate-height-js');
            break;
        case "Comment":
            dom = document.querySelectorAll('.calculate-height-js-comment');
            break;
    }

    dom.forEach((item) => {
        totalHeight += item.offsetHeight;
    });

    let abc = String(totalHeight) + "px";
    return abc
}

function openRecipePreview(clickedElement) {
    document.querySelector('.gray-background').style.display = "block";
    document.querySelector('.test3').style.display = "block";

    const myVarValue = clickedElement.getAttribute('myVar');

    document.querySelectorAll('.test').forEach((eachElement) => {
        if (eachElement.getAttribute('recipeId') == myVarValue) {
            eachElement.style.display = "grid";
        } else {
            eachElement.style.display = "none";
        }
    });
}

function openCommentPreview(clickedElement) {
    document.querySelector('.gray-background').style.display = "block";
    const test4 = document.querySelector('.test4');
    test4.style.display = "block";

    const myVarValue = clickedElement.getAttribute('mycomvar');

    document.querySelectorAll('.test5').forEach((eachElement) => {
        if (eachElement.getAttribute('commentid') == myVarValue) {
            eachElement.style.display = "grid";
        } else {
            eachElement.style.display = "none";
        }
    });
}

function closeRecipePreview() {
    document.querySelector('.gray-background').style.display = "none";
    document.querySelector('.test3').style.display = "none";
    document.querySelector('.test4').style.display = "none";
}

function stopPropagation(event) {
    // Prevent each-recipe div element click while clicking button
    event.stopPropagation();
}