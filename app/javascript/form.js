list = document.getElementById("myUL");
input = document.getElementById("myInput");
skillList = document.getElementsByClassName("skill-list");

input.addEventListener('keyup', (key) => {
  searchList();
})

list.addEventListener('click', (event) => {
  getSkill();
  hideItem();
})

skillList[0].addEventListener('click', (event) => {
  removeSkill();
})

function searchList() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    ul = document.getElementById("myUL");
    ul.style.display = ""
    filter = input.value.toUpperCase();
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
};

function getSkill() {
  event.preventDefault();
  // list = document.getElementById('myUL');
  skill = event.composedPath()[0].innerText;
  tagExpertise = document.querySelector('.skill-list');
  tagExport = document.querySelector('.tag-export');
  tagExpertise.insertAdjacentHTML("beforeend", ` <div class="tag-expertise"><i class="fas fa-bookmark ml-0 mr-2 justify-content-between"></i>${skill}</div>`);
  tagExport.insertAdjacentHTML("beforeend", `<input class="form-control " autocomplete="Project_tags" autofocus="autofocus" placeholder="Search an expertise" type="text" value="${skill}" name="project[project_tags][]" id="project_project_tags">`);
};

function hideItem() {
    element = event.path[1];
    element.style.display = "none";
    input.focus()
    input.value = null
   };

function removeSkill() {
    event.path[0].style.display = "none";
}




