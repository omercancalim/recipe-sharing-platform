function adjustHeight(textbox) {
    textbox.style.height = "auto";
    textbox.style.height = (textbox.scrollHeight) + "px";
}

document.addEventListener("DOMContentLoaded", function () {

    for (let i = 1; i < 6; i++) {
        // Select the TextBox by its ClientID
        const textBox = document.getElementById(`TextBox${i}`);

        textBox.addEventListener("keydown", (e) => {
            if (e.key === "Enter") {
                e.preventDefault(); // Prevent the default behavior of the "Enter" key
            }
        });

        // Add the onkeyup event listener
        textBox.addEventListener("keyup", function () {
            adjustHeight(this);
        });

        textBox.addEventListener("blur", function () {
            if(textBox.value.trim() !== '')
                textBox.style.width = '100%';
        });
    }
});