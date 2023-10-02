//
//  UIImageViewExtension.swift
//  StarWars
//
//  Created by Ahmet Ali ÇETİN on 2.10.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            fatalError("Kingfisher URL Error")
        }
        
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
        
    }
}
