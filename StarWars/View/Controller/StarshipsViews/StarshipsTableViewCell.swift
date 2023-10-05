//
//  StarshipsTableViewCell.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 27.09.2023.
//

import UIKit

class StarshipsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: StarshipResultsModel) {
        self.nameLabel.text = item.name
        self.typeLabel.text = item.crew
    }
    
}
