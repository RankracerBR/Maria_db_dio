let currentIndex = 0;

const imageDisplay = document.getElementById("image-display"); 
const arrowLeft = document.getElementById("arrow-left");
const arrowRight = document.getElementById("arrow-right");

function showImage(){
    imageDisplay.src = images[currentIndex];
}

arrowLeft.addEventListener("click", () => {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    showImage();
});

arrowRight.addEventListener("click", () => {
    currentIndex = (currentIndex + 1) % images.length;
    showImage();
});

showImage();
