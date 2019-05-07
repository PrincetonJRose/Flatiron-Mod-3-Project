const EMPTY_HEART = '♡'
const FULL_HEART = '♥'
const search = document.getElementById('site-search')
search.addEventListener('submit', siteSearch)
const navList = document.getElementById('nav-list')
const mainDisplay = document.getElementById('main-display')

const cocktailsUrl = `http://localhost:3000/cocktails/`
const ingredientsUrl = `http://localhost:3000/ingredients/`

function siteSearch(e) {
    e.preventDefault()
    e.target.reset()
}

function clearNode(node) {
    while(node.firstChild) {
        node.removeChild(node.firstChild)
    }
}

function makeNavList() {
    clearNode(navList)
    navItems = ['Home', 'Cocktails', 'Ingredients', 'Custom Drinks', 'Favorites', 'About']
    for ( let item of navItems ) {
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

function homePage() {
    clearNode(mainDisplay)

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

function navMenu(e, menu) {
    console.log(e.target)
    console.log(menu)
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
}

makeNavList()
homePage()