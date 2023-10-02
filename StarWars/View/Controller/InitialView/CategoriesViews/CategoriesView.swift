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
        self.categoriesButton.setTitle(categoriesLabel, for: .normal)
        self.categoriesImage.setImage(with: categoriesImage)
    }
    
}
