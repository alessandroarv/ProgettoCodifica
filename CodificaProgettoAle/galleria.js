let indiceimg = 1;
showimgs(indiceimg);

function plusimgs(n) {
  showimgs(indiceimg += n);
}

function currentimg(n) {
  showimgs(indiceimg = n);
}

function showimgs(n) {
  let i;
  let img = document.getElementsByClassName("img");
  
  let dots = document.getElementsByClassName("dot");
  if (n > img.length) {indiceimg = 1}
  if (n < 1) {indiceimg = img.length}
  for (i = 0; i < img.length; i++) {
      img[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  img[indiceimg-1].style.display = "block";
  dots[indiceimg-1].className += " active";
}
