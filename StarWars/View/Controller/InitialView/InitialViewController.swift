//
//  InitialViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 27.09.2023.
//

import UIKit

class InitialViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var starshipsView: CategoriesView!
    @IBOutlet weak var vehiclesView: CategoriesView!
    @IBOutlet weak var speciesView: CategoriesView!
    @IBOutlet weak var filmsView: CategoriesView!
    @IBOutlet weak var peopleView: CategoriesView!
    @IBOutlet weak var planetsView: CategoriesView!
    
    //MARK: PROPERTIES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIElements()
        categoriesButton()
    }
    
    private func setUIElements() {
        
        starshipsView.setUIElements(categoriesLabel: Constants.CategoriesImages.Starships.name,
                                    categoriesImage: Constants.CategoriesImages.Starships.starships.randomElement()!)
        vehiclesView.setUIElements(categoriesLabel: Constants.CategoriesImages.Vehicles.name,
                                   categoriesImage: Constants.CategoriesImages.Vehicles.vehicles.randomElement()!)
        speciesView.setUIElements(categoriesLabel: Constants.CategoriesImages.Species.name,
                                  categoriesImage: Constants.CategoriesImages.Species.species.randomElement()!)
        filmsView.setUIElements(categoriesLabel: Constants.CategoriesImages.Films.name,
                                categoriesImage: Constants.CategoriesImages.Films.films.randomElement()!)
        peopleView.setUIElements(categoriesLabel: Constants.CategoriesImages.People.name,
                                 categoriesImage: Constants.CategoriesImages.People.people.randomElement()!)
        planetsView.setUIElements(categoriesLabel: Constants.CategoriesImages.Planets.name,
                                  categoriesImage: Constants.CategoriesImages.Planets.planets.randomElement()!)
    }
    
    private func categoriesButton() {
        starshipsView.categoriesButton.tag = SelectedButtonTag.StarshipsButton.rawValue
        vehiclesView.categoriesButton.tag = SelectedButtonTag.VehiclesButton.rawValue
        speciesView.categoriesButton.tag = SelectedButtonTag.SpeciesButton.rawValue
        filmsView.categoriesButton.tag = SelectedButtonTag.FilmsButton.rawValue
        peopleView.categoriesButton.tag = SelectedButtonTag.PeopleButton.rawValue
        planetsView.categoriesButton.tag = SelectedButtonTag.PlanetsButton.rawValue
    }
}
