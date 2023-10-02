//
//  Constants.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 25.09.2023.
//

import Foundation

enum Constants {
    static let baseURL: String = "https://swapi.dev/api/"
    
    enum Path {
        static let people: String = "people/"
        static let planets: String = "planets/"
        static let films: String = "films/"
        static let species: String = "species/"
        static let vehicles: String = "vehicles/"
        static let starships: String = "starships/"
    }
    
    enum EventMessages {
        static let loading: String = "Data is Loading"
        static let stopLoading: String = "Data Stopped Loading"
        static let dataLoaded: String = "Data Loaded"
    }
    
    enum ID {
        static let gridItemCell: String = "ItemCell"
    }
    
    enum CategoriesImages {
        enum Starships {
            static let name: String = "Starships"
            static let starships: [String] = [
                Constants.CategoriesImages.Starships.image1, Constants.CategoriesImages.Starships.image2, Constants.CategoriesImages.Starships.image3, Constants.CategoriesImages.Starships.image4, Constants.CategoriesImages.Starships.image5
            ]
            
            static let image1: String = "https://www.denofgeek.com/wp-content/uploads/2019/12/x-wing.jpg?w=1024"
            static let image2: String = "https://www.cnet.com/a/img/resize/40f82a3a214cf84ba160bf3fbc1f80b7385aba36/hub/2019/10/22/616f3e87-d1b1-4934-9945-c3b8f66d264f/ship-main.jpg?auto=webp&width=1200"
            static let image3: String = "https://www.cnet.com/a/img/resize/d57e8275fc1fde89b606a07d5c84180a79de881e/hub/2016/09/15/626331fe-2b77-4055-b771-6a07d5e1eb28/starwarsshipsradiantviii.jpg?auto=webp&width=1200"
            
            static let image4: String = "https://www.cnet.com/a/img/resize/dd1080bd7aa56e3bcfac223f21f990eeb37e5764/hub/2016/09/15/62b3da98-09e6-49c2-b818-b62893949ad9/starwarsshipsghost.jpg?auto=webp&width=1200"
            
            static let image5: String = "https://www.cnet.com/a/img/resize/e03156f15130177842f1b09c1693523d30039154/hub/2019/10/22/aa2588e1-7293-438a-b745-873192c116ff/ship-han-falcon.jpg?auto=webp&width=1200"
        }
        
        enum Vehicles {
            static let name: String = "Vehicles"
            
            static let vehicles: [String] = [
                Constants.CategoriesImages.Vehicles.image1, Constants.CategoriesImages.Vehicles.image2,
                Constants.CategoriesImages.Vehicles.image3, Constants.CategoriesImages.Vehicles.image4,
                Constants.CategoriesImages.Vehicles.image5
            ]
            
            static let image1: String = "https://media.wired.com/photos/5dfbd524f3e943000879987a/master/pass/Culture_MilitaryStarWars_MCDSTWA_WD041.jpg"
            static let image2: String = "https://www.digitaltrends.com/wp-content/uploads/2023/05/AT-ATs-Empire-Strikes-Back.jpeg?fit=720%2C321&p=1"
            static let image3: String = "https://www.digitaltrends.com/wp-content/uploads/2023/05/The-Ghost-Rebels.jpeg?fit=720%2C405&p=1"
            static let image4: String = "https://www.digitaltrends.com/wp-content/uploads/2015/12/Star-Wars-The-Force-Awakens-0006.jpg?fit=720%2C405&p=1"
            static let image5: String = "https://www.digitaltrends.com/wp-content/uploads/2015/08/Star-Wars-force-awakens.jpg?fit=720%2C480&p=1"
        }
        
        enum Species {
            static let name: String = "Species"
            
            static let species: [String] = [Constants.CategoriesImages.Species.image1, Constants.CategoriesImages.Species.image2, Constants.CategoriesImages.Species.image3, Constants.CategoriesImages.Species.image4, Constants.CategoriesImages.Species.image5]
            
            static let image1: String = "https://images.thedirect.com/media/article_full/book-of-boba-fett-grogu-baby-yoda-mandalorian-star-wars.jpg"
            static let image2: String = "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/05/star-wars-return-of-the-jedi-ackbar.jpg?q=50&fit=crop&w=750&dpr=1.5"
            static let image3: String = "https://static1.cbrimages.com/wordpress/wp-content/uploads/2017/09/chewbacca-display.jpg?q=50&fit=crop&w=750&dpr=1.5"
            static let image4: String = "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/05/star-wars-the-phantom-menace-gungan-army.jpg?q=50&fit=crop&w=750&dpr=1.5"
            static let image5: String = "https://static1.cbrimages.com/wordpress/wp-content/uploads/2018/02/Ewoks-in-Star-Wars.jpg?q=50&fit=crop&w=750&dpr=1.5"
        }
        
        enum Films {
            static let name: String = "Films"
            
            static let films: [String] = [Constants.CategoriesImages.Films.image1, Constants.CategoriesImages.Films.image2, Constants.CategoriesImages.Films.image3, Constants.CategoriesImages.Films.image4, Constants.CategoriesImages.Films.image5]
            
            static let image1: String = "https://cdn.mos.cms.futurecdn.net/ScZ7FwNXDc3iZ2GNgiNKDn.jpg"
            static let image2: String = "https://sm.ign.com/t/ign_nordic/lists/r/ranking-th/ranking-the-star-wars-movies-from-worst-to-best_2vtt.1200.jpg"
            static let image3: String = "https://ventsmagazine.com/wp-content/uploads/2023/04/840_560.jpg"
            static let image4: String = "https://phantom-marca.unidadeditorial.es/bdee1b612d2756eea7d2b46f06894cb2/resize/828/f/jpg/assets/multimedia/imagenes/2023/05/04/16831803848910.jpg"
            static let image5: String = "https://media.wired.com/photos/62ce0a69540a1fd5ca4bd82a/master/pass/Star-Wars-Ranking-Culture-607402182.jpg"
        }
        
        enum People {
            static let name: String = "People"
            
            static let people: [String] = [
                Constants.CategoriesImages.People.image1,
                Constants.CategoriesImages.People.image2,
                Constants.CategoriesImages.People.image3,
                Constants.CategoriesImages.People.image4,
                Constants.CategoriesImages.People.image5]
            
            static let image1: String = "https://media.timeout.com/images/105863223/750/422/image.jpg"
            static let image2: String = "https://qph.cf2.quoracdn.net/main-qimg-97aa77cf19154852234c2e8fc52fa363-lq"
            static let image3: String = "https://qph.cf2.quoracdn.net/main-qimg-c32fb893c36f34c9d3b2547666aedf82-pjlq"
            static let image4: String = "https://qph.cf2.quoracdn.net/main-qimg-a47b40698717c0456a71b0097f825453-lq"
            static let image5: String = "https://qph.cf2.quoracdn.net/main-qimg-cc029a914e3fbaa8e50715be5984e56c-lq"
        }
        
        enum Planets {
            static let name: String = "Planets"
            
            static let planets: [String] = [
                Constants.CategoriesImages.Planets.image1, Constants.CategoriesImages.Planets.image2,
                Constants.CategoriesImages.Planets.image3, Constants.CategoriesImages.Planets.image4, Constants.CategoriesImages.Planets.image5]
            
            static let image1: String = "https://assetsio.reedpopcdn.com/Tatooine.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp"
            static let image2: String = "https://static1.moviewebimages.com/wordpress/wp-content/uploads/2023/07/planet-ahch-to-star-wars.jpg?q=50&fit=crop&w=1500&dpr=1.5"
            static let image3: String = "https://static1.moviewebimages.com/wordpress/wp-content/uploads/2023/07/coral-moon-of-rugosa-star-wars.jpg?q=50&fit=crop&w=1500&dpr=1.5"
            static let image4: String = "https://static1.moviewebimages.com/wordpress/wp-content/uploads/2023/07/ilum-star-wars.jpg?q=50&fit=crop&w=1500&dpr=1.5"
            static let image5: String = "https://movieweb.com/star-wars-most-important-planets-and-moons/#ilum"
        }
        
    }
}

