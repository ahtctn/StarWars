//
//  FilmsTableViewCell.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 27.09.2023.
//

import UIKit

class FilmsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with item: FilmsResultsModel) {
        self.nameLabel.text = item.title
        self.infoLabel.text = "\(item.director)- \(item.created)"
        
    }
    
}
