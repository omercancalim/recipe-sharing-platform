const commentButton = document.querySelector('.comment-icon');

commentButton.addEventListener('click', () => {
    const commentBox = document.querySelector('.main-comment-box-container');
    commentBox.classList.add('make-it-visible-but-grid');
});


const stars = document.querySelectorAll('.stars i');

stars.forEach((star, index1) => {
    star.addEventListener('click', () => {

        switch (index1) {
            case 0:
                document.getElementById("RadioButton1").checked = true;
                break;
            case 1:
                document.getElementById("RadioButton2").checked = true;
                break;
            case 2:
                document.getElementById("RadioButton3").checked = true;
                break;
            case 3:
                document.getElementById("RadioButton4").checked = true;
                break;
            case 4:
                document.getElementById("RadioButton5").checked = true;
                break;
        }

        /*
        console.log(document.getElementById("RadioButton1").checked === true);
        console.log(document.getElementById("RadioButton2").checked === true);
        console.log(document.getElementById("RadioButton3").checked === true);
        console.log(document.getElementById("RadioButton4").checked === true);
        console.log(document.getElementById("RadioButton5").checked === true);
        */

        console.log(index1)
        stars.forEach((star, index2) => {
            index1 >= index2 ? star.classList.add('active') : star.classList.remove('active');
        });
    });
});

stars.forEach((star, index1) => {
    star.addEventListener('mouseover', () => {
        stars.forEach((star, index2) => {
            index1 >= index2 ? star.classList.add('horev') : star.classList.remove('horev');
        });
    });

    star.addEventListener('mouseout', () => {
        stars.forEach((star, index2) => {
            index1 >= index2 ? star.classList.remove('horev') : star.classList.remove('horev');
        });
    });
});

const applyButton = document.getElementById('<%= buttonApply.ClientID %>');
document.querySelector('.myTooltip').classList.add('makeTooltipHidden');

function deneme() {
    if (!(document.getElementById("RadioButton1").checked ||
        document.getElementById("RadioButton2").checked ||
        document.getElementById("RadioButton3").checked ||
        document.getElementById("RadioButton4").checked ||
        document.getElementById("RadioButton5").checked))
    {
        document.querySelector('.myTooltip').classList.remove('makeTooltipHidden');

        setTimeout(function () {
            document.querySelector('.myTooltip').classList.add('makeTooltipHidden');
        }, 3000);
        return false;
    }
}

function handleMouseOver() {
    
}