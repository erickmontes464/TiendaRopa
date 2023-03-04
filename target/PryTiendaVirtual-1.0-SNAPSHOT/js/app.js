window.onload = function changeImg(){	
    const images = document.getElementsByClassName("gallery__img"); 
    const progressBar = document.getElementById("progress-bar");
    const fill = document.getElementById("fill");
    let percentage = 0;
    let index = 0;

const updateProgressBar = () => {
  percentage++;
  fill.style.width = `${percentage}%`;

  if (percentage === 100) {
    percentage = 0;
    images[index].style.flex = 1;

    index = (index + 1) % images.length;
    images[index].style.flex = 6;
  }
};
images[index].style.flex = 6;
setInterval(updateProgressBar, 25);
};
function updatesubcate() {
    var cate = document.getElementById("cate");
    var subcate = document.getElementById("subcate");
    
    // Obtiene la opción seleccionada del primer select
    var selectcate = cate.options[cate.selectedIndex].value;
    
    // Vacía el segundo select
    subcate.innerHTML = "";
    
    if(selectcate ==="CAT01"){
        addOption(subcate, "SUBCAT02", "POLOS | HOMBRE");
        addOption(subcate, "SUBCAT03", "PANTALONES | HOMBRE");
        addOption(subcate, "SUBCAT05", "CASACAS Y ABRIGOS | HOMBRE");
        addOption(subcate, "SUBCAT07", "ZAPATILLAS | HOMBRE");
        addOption(subcate, "SUBCAT08", "ZAPATOS | HOMBRE");
    }else{
        
        if(selectcate ==="CAT02"){
            addOption(subcate, "SUBCAT01", "ZAPATOS Y BOTAS | MUJER");
            addOption(subcate, "SUBCAT04", "POLOS Y BLUSAS | MUJER");
            addOption(subcate, "SUBCAT09", "CASACAS Y ABRIGOS | MUJER");
            addOption(subcate, "SUBCAT10", "FALDAS Y PANTALONES | MUJER");
            addOption(subcate, "SUBCAT11", "ZAPATILLAS | MUJER");
        }else{
            if(selectcate ==="CAT03"){
                addOption(subcate, "SUBCAT06", "POLOS | NIÑOS");
                addOption(subcate, "SUBCAT12", "BLUSAS | NIÑOS");
                addOption(subcate, "SUBCAT13", "CASACAS | NIÑOS");
                addOption(subcate, "SUBCAT14", "PANTALONES | NIÑOS");
                addOption(subcate, "SUBCAT15", "ZAPATILLAS | NIÑOS");
            }
        }
        
    }
   
}
function addOption(select, value, text) {
    var option = document.createElement("option");
    option.value = value;
    option.text = text;
    select.add(option);
}