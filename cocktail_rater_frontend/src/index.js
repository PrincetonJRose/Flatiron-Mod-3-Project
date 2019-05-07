const EMPTY_HEART = '♡'
const FULL_HEART = '♥'
const search = document.getElementById('site-search')
search.addEventListener('submit', siteSearch)

const cocktailsUrl = `http://localhost:3000/cocktails/`
const ingredientsUrl = `http://localhost:3000/ingredients/`

function siteSearch(e) {
    console.log("Hello")
    e.preventDefault()
    e.target.reset()
}