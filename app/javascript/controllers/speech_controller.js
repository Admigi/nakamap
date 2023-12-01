import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["text"];

    connect() {
        // 
    }

    next() {
        this.updateText();
    }

    updateText() {
        const texts = [
            "🌏 Hello, explorer! Welcome to Nakamap, your gateway to the beauty of Japan. I'm your guide on this exciting journey.",
            "📍 To kick off, hover over a pin on the map. Each pin holds a unique story and adventure waiting to be discovered!",
            "🏰 Uncover the rich history and traditions of Japan. Dive into tales of fearless samurais, ancient shrines, and modern marvels.",
            "🗺️ Navigate Nakamap effortlessly. Explore diverse regions, from the electric energy of bustling cities to the tranquil beauty of the countryside.",
            "🍣 Unlock the secrets of local cuisine. Embark on a culinary adventure, from the delicate flavors of sushi in Tokyo to the hearty warmth of ramen in Osaka.",
            "🌸 Immerse yourself in the magic of festivals and celebrations. Witness the breathtaking beauty of cherry blossoms and experience traditional ceremonies.",
            "🤝 Connect with fellow explorers on Nakamap. Share your experiences, exchange recommendations, and create lasting memories together.",
        ];

        const currentTextIndex = parseInt(this.textTarget.dataset.index || 0);
        const nextTextIndex = (currentTextIndex + 1) % texts.length;

        this.textTarget.innerHTML = texts[nextTextIndex];
        this.textTarget.dataset.index = nextTextIndex;
    }
}