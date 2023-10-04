//
//  CategoriesView.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 2.10.2023.
//

import UIKit

class CategoriesView: UIView {
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    var id: UUID?
    
    static let nibName: String = "CategoriesView"
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: CategoriesView.nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setUIElements(categoriesLabel: String, categoriesImage: String) {
        self.categoriesLabel.text = categoriesLabel
        self.categoriesImage.setImage(with: categoriesImage)
    }
    
    @IBAction func categoriesButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case SelectedButtonTag.FilmsButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.films,
                                         errorMessage: Constants.StoryboardIDs.Films.errorMessage,
                                         viewController: FilmsViewController.self)
            
        case SelectedButtonTag.PeopleButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.people,
                                         errorMessage: Constants.StoryboardIDs.People.errorMessage,
                                         viewController: PeopleViewController.self)
            
        case SelectedButtonTag.PlanetsButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.planets,
                                         errorMessage: Constants.StoryboardIDs.Planets.errorMessage,
                                         viewController: PlanetsViewController.self)
            
        case SelectedButtonTag.SpeciesButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.species,
                                         errorMessage: Constants.StoryboardIDs.Species.errorMessage,
                                         viewController: SpeciesViewController.self)
            
        case SelectedButtonTag.StarshipsButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.starships,
                                         errorMessage: Constants.StoryboardIDs.Starships.errorMessage,
                                         viewController: StarshipsViewController.self)
            
        case SelectedButtonTag.VehiclesButton.rawValue:
            goToNavigationViewController(storyboardId: Constants.StoryboardIDs.vehicles,
                                         errorMessage: Constants.StoryboardIDs.Vehicles.errorMessage,
                                         viewController: VehiclesViewController.self)
            
        default:
            print("Error happened.")
        }
    }
    
    private func goToNavigationViewController<T: UIViewController>(storyboardId: String, errorMessage: String, viewController: T.Type){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId) as? T else { fatalError(errorMessage)}
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(viewController, animated: true)
        } else { fatalError(errorMessage) }
    }
}

enum SelectedButtonTag: Int {
    case FilmsButton
    case PeopleButton
    case PlanetsButton
    case SpeciesButton
    case StarshipsButton
    case VehiclesButton
}
