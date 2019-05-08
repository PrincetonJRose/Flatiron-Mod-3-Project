const EMPTY_HEART = '♡'
const FULL_HEART = '♥'

const search = document.getElementById('site-search')
search.addEventListener('submit', siteSearch)

const navList = document.getElementById('nav-list')
const mainDisplay = document.getElementById('main-display')
mainDisplay.style.overflowX = 'hidden'
mainDisplay.style.overflowY = 'auto'
mainDisplay.style.height = '600px'
mainDisplay.style.float = 'right'

let user = []

const cocktailsUrl = `http://localhost:3000/cocktails/`
const ingredientsUrl = `http://localhost:3000/ingredients/`
const usersUrl = `http://localhost:3000/users/`

function siteSearch(e) {
    e.preventDefault()
    e.target.reset()
}

function clearNode(node) {
    while(node.firstChild) {
        node.removeChild(node.firstChild)
    }
}

function homePage() {
    clearNode(mainDisplay)

    if (user.length != 0) {
        let h3 = document.createElement('h3')
        h3.className = `center-element`
        h3.innerHTML = `Hello ${user[0]}!`
        h3.setAttribute('align', 'center')
        let br = document.createElement('br')
        mainDisplay.appendChild(h3)
        mainDisplay.appendChild(br)
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
}

function makeNavList() {
    clearNode(navList)
    navItems = ['Home', 'Cocktails', 'Ingredients', 'Custom Drinks', 'Favorites', 'About', 'loginStatus']
    for ( let item of navItems ) {

        if (item == 'loginStatus' && user.length == 0) {
            item = 'Login'
        } else if (item == 'loginStatus' && user.length != 0) {
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
        getCocktails()
    }
    if (menu == 'Ingredients') {
        getIngredients()
    }
    if (menu == 'Custom Drinks') {
        getCustomDrinks()
    }
    if (menu == 'Favorites') {
        getFavorites()
    }
    if (menu == 'Login') {
        loginUser()
    }
    if (menu == 'Logout') {
        logoutUser()
    }
}


makeNavList()
homePage()