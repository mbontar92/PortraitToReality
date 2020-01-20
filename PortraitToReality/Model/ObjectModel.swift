//
//  ObjectModel.swift
//  WindowDoors
//
//  Created by Lorem on 8/16/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//

import Foundation
import UIKit

class ObjectModel: NSObject {
    
    var modelImage: UIImage?
    var modelName: String?
    
    init(modelImage: UIImage?, modelName: String?) {
        
        self.modelImage = modelImage
        self.modelName = modelName
    }
}
