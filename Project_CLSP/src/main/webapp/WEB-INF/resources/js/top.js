const $topBtn = document.querySelector(".moveTopBtn");

// 버튼 클릭 시 맨 위로 이동
$topBtn.onclick = () => {
  window.scrollTo({ top: 0, behavior: "smooth" });  
}

const $bottomBtn = document.querySelector(".moveBottomBtn");

let mybutton = document.getElementById("myBtn");
window.onscroll = function() {scrollFuncion()};

function scrollFuncion(){
  if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20){
    mybutton.style.display = "block";
  } else{
    mybutton.style.display = "none";
  }
}