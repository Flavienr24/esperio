input = document.getElementById("myInput");
input.addEventListener('keyup', (event) => {
  searchList();
})

function searchList() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    ul = document.getElementById("myUL");
    ul.style.visibility = "visible"
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
}

let listOfTags = [];

function getSkill() {
  list = document.querySelector('#myUL')
  list.style.visibility = "visible";
  skill = event.path[0].innerText;
  skillList = document.querySelector('.skill-get');
  skillForm = document.querySelector('.skill-form');
  skillList.insertAdjacentHTML("beforeend", `<li class="tag-expertise">${skill}</li>`);
  skillForm.insertAdjacentHTML("beforeend", `<input class="form-control string optional" type="text" value="${skill}" name="project[project_tags]" id="list_of_tags">`);

  listOfTags.push(skill);
  console.log(listOfTags)
  // Les items s'ajoute à l'array. Comment exploiter l'array ?

  item = list.addEventListener('click', (event) => {
    console.log(event.path[1]);
    element = event.path[1];
    element.style.display = "none";
    input = document.getElementById("myInput");
    input.value = null
    input.focus()
    list.style.visibility = "hidden";
    });
  }

  // searchList('<%= j render "projects/form-project" %>');
