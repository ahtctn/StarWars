//
//  PlanetsDetailsViewController.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 14.10.2023.
//

import UIKit

class PlanetsDetailsViewController: UIViewController {

    var planets: PlanetsResultsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deneme()
    }
    
    func deneme() {
        print("Created:\(String(describing: planets?.created))\nFilms:\(String(describing: planets?.films[0]))")
    }
}
