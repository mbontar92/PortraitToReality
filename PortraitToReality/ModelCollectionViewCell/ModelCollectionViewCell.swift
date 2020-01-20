//
//  ModelCollectionViewCell.swift
//  WindowDoors
//
//  Created by Lorem on 8/16/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//

import UIKit

class ModelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var modelImageView: UIImageView!
    
    
    var model: ObjectModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 7
        if let model = model {
            seUpUI(model: model)
        }
    }
    
    func seUpUI(model:ObjectModel ) {
        modelImageView.image = model.modelImage
    }
}
