const ratingImages = document.querySelectorAll('.image-rating-js');
const recipeRate = document.querySelectorAll('.recipe-info-rate-js');

ratingImages.forEach((image, index) => {
    const rate = parseInt(parseFloat(recipeRate[index].innerHTML) * 10);
    const selectImage = parseInt(rate / 5) * 5;
    image.src = `../Images/rating-${selectImage}.png`;
});

