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
    

    override func awakeFromNib() {
        super.awakeFromNib()
       mainView.layer.cornerRadius = 7
    }

}
