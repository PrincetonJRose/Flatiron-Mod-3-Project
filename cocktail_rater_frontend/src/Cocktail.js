class Cocktail {
    constructor(id, name, instructions, category, alcoholic, glass, imageURL = '', videoURL = '') {
        this.id = id
        this.name = name
        this.instructions = instructions
        this.category = category
        this.alcoholic = alcoholic
        this.glass = glass
        this.videoURL = videoURL
        this.imageURL = imageURL
    }

    makeCard =()=> {
        const mainDisplay = document.getElementById('main-display')

        let img = document.createElement('img')
        img.src = this.imageURL


    }
}