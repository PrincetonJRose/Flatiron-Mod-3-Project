const EMPTY_HEART = '♡'
const FULL_HEART = '♥'

const search = document.getElementById('site-search')
search.addEventListener('submit', siteSearch)
const form = document.querySelector('#enter-username')
form.addEventListener('submit', fetchUser)

const navList = document.getElementById('nav-list')
const mainDisplay = document.getElementById('main-display')
mainDisplay.style.overflowX = 'hidden'
mainDisplay.style.overflowY = 'auto'
mainDisplay.style.height = '600px'
mainDisplay.style.float = 'right'

let currentUser = []

let limit = 20
let page = 1
let pageLimit = `?_limit=${limit}&_page=${page}`
function changePage(e, direction, type) {
    if (direction === 'forward') {
        page += 1
    } else if (page > 1) {
        page -= 1
    }
    clearNode(mainDisplay)
    if (type == "drinks") {
        getAllDrinks()
    } else {
        getAllIngredients()
    }
}

const drinksUrl = `http://localhost:3000/drinks/`
const ingredientsUrl = `http://localhost:3000/ingredients/`
const usersUrl = `http://localhost:3000/users/`

function siteSearch(e) {
    e.preventDefault()
    console.log(e.target.query.value)
    e.target.reset()
}

// ************ modal stuff *****************
let modal = document.querySelector(".modal");
let modalContent = modal.querySelector(".modal-content")
let closeButton = document.querySelector(".close-button");
function toggleModal() {
    modal.classList.toggle("show-modal");
}
function windowOnClick(event) {
    if (event.target === modal) {
        toggleModal();
    }
}
closeButton.addEventListener("click", toggleModal);
window.addEventListener("click", windowOnClick);
// ************* end modal stuff *******************

function clearNode(node) {
    while(node.firstChild) {
        node.removeChild(node.firstChild)
    }
}

function homePage() {
    page = 1
    limit = 20
    clearNode(mainDisplay)
    clearNode(modalContent)
    modalContent.appendChild(form)

    if (currentUser.length != 0) {
        let h3 = document.createElement('h3')
        h3.className = `center-element`
        h3.innerHTML = `Hello ${currentUser[0].username}!`
        h3.setAttribute('align', 'center')
        mainDisplay.appendChild(h3)
    }

    let h1 = document.createElement('h1')
    h1.innerHTML = `Welcome to Cocktail Rater`
    h1.className = `center-element`
    h1.setAttribute('align', 'center')
    mainDisplay.appendChild(h1)

    let img = document.createElement('img')
    randomPic = Math.random()
    if (randomPic < 0.3) {
        img.src = "src/5-glasses-cropped.jpg"
    } else if (randomPic < 0.6) {
        img.src = "src/cocktail-splashing-cropped.jpg"
    } else {
        img.src = "src/neon-cocktails-sign-cropped.jpg"
    }
    img.className = "center-img"
    mainDisplay.appendChild(img)

    if (currentUser.length == 0) {
        let p = document.createElement('p')
        p.innerHTML = `Click <span style="color: blue">here</span> to login.`
        p.setAttribute('align', 'center')
        clearNode(modalContent)
        modalContent.appendChild(form)
        p.addEventListener('click', toggleModal)
        mainDisplay.appendChild(p)
    }
}

function makeNavList() {
    clearNode(navList)
    navItems = ['Home', 'Cocktails', 'Ingredients', 'Custom Drinks', 'Favorites', 'About', 'loginStatus']
    for ( let item of navItems ) {

        if (item == 'loginStatus' && currentUser.length == 0) {
            item = 'Login'
        } else if (item == 'loginStatus' && currentUser.length != 0) {
            item = 'Logout'
        }

        let br = document.createElement('br')
        let li = document.createElement('li')
        li.innerHTML = item
        li.addEventListener('click', (e) => {
            navMenu(e, item)
        })
        navList.appendChild(br)
        navList.appendChild(li)
    }
}

function navMenu(e, menu) {
    if (menu == 'Home') {
        homePage()
    }
    if (menu == 'About') {
        aboutPage()
    }
    if (menu == 'Cocktails') {
        getAllDrinks()
    }
    if (menu == 'Ingredients') {
        geAllIngredients()
    }
    if (menu == 'Custom Drinks') {
        getCustomDrinks()
    }
    if (menu == 'Favorites') {
        getFavorites()
    }
    if (menu == 'Login') {
        clearNode(modalContent)
        modalContent.appendChild(form)
        toggleModal()
    }
    if (menu == 'Logout') {
        currentUser = []
        let p = document.querySelector(`#current-users-name`)
        p.innerHTML = '&emsp;'
        makeNavList()
        homePage()
    }
}

function fetchUser(e) {
    e.preventDefault()
    toggleModal()
    allUsers = []
    let name = e.target.username.value

    fetch(usersUrl)
    .then(res => res.json())
    .then(users => users.forEach(user => getUsers(user, name)))
    
    if (currentUser.length == 0) {
        clearNode(modalContent)
        toggleModal()
        let p = document.createElement('p')
        p.innerHTML = `User ${name} was not found. Would you like to create it instead?`
        let confirmBtn = document.createElement('button')
        confirmBtn.innerText = "Yes! ^_^"
        confirmBtn.classList += `btn-success`
        confirmBtn.addEventListener('click', (e) => {
            toggleModal()
            clearNode(modalContent)
            modalContent.appendChild(form)
            newUser(e, name)})
        let cancelBtn = document.createElement('button')
        cancelBtn.innerText = "No way! >_<"
        cancelBtn.classList += `btn-danger`
        cancelBtn.setAttribute('align', 'right')
        cancelBtn.addEventListener('click', (e) => {
            toggleModal()
            clearNode(modalContent)
            modalContent.appendChild(form)
            homePage
        })
        modalContent.appendChild(p)
        modalContent.appendChild(confirmBtn)
        modalContent.appendChild(cancelBtn)
    }
    e.target.reset()
    
}

function getUsers(user, name) {
    if (user.username != null && user.username.toUpperCase() == name.toUpperCase()) {
        toggleModal()
        currentUser.push(user)
        let p = document.querySelector(`#current-users-name`)
        p.innerText = currentUser[0].username
        makeNavList()
        homePage()
    }
}

function newUser(e, name) {
    let user = {
        username: name
    }
    fetch(usersUrl, {
        headers:{
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        method: 'POST',
        body: JSON.stringify({ user })
    })
    .catch(errors => console.log(errors))
    .then(res => console.log(res.json()))

}

function getAllDrinks() {
    clearNode(mainDisplay)
    let h3 = document.createElement('h3')
    h3.innerHTML = `<b><u>List of Cocktails</u>:</b>`
    h3.setAttribute('align', 'center')
    mainDisplay.appendChild(h3)
    let ul = document.createElement('ul')
    mainDisplay.appendChild(ul)
    fetch(drinksUrl + pageLimit)
    .then(res => res.json())
    .then(drinks => drinks.forEach(drink => {
        let newDrink = new Cocktail(drink.id, drink.name, drink.instructions, drink.category, drink.alcoholic, drink.glass, drink.imageURL, drink.videoURL )
        let li = document.createElement('li')
        li.innerHTML = newDrink.name
        li.dataset.id = newDrink.id
        li.addEventListener('click', (e) => { showDrink(e, newDrink) })
        ul.appendChild(li)
    }))

}

function showDrink(e, drink) {
    clearNode(mainDisplay)
    drink.makeCard()
}

makeNavList()
homePage()

