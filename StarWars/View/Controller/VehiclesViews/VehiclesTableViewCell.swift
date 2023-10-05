//
//  VehiclesTableViewCell.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 27.09.2023.
//

import UIKit

class VehiclesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: VehiclesResultsModel) {
        self.nameLabel.text = item.name
        self.crewLabel.text = item.crew
    }
    
}
