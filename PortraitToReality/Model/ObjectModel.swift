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

var array: [ObjectModel] = [ObjectModel(modelImage: UIImage(named: "picasso"), modelName: "picasso"),
                                   ObjectModel(modelImage: UIImage(named: "picasso1"), modelName: "picasso1"),
                                   ObjectModel(modelImage: UIImage(named: "picasso2"), modelName: "picasso2"),
                                   ObjectModel(modelImage: UIImage(named: "painting1"), modelName: "painting1"),
                                   ObjectModel(modelImage: UIImage(named: "monalisa"), modelName: "monalisa"),
                                   ObjectModel(modelImage: UIImage(named: "vangooh"), modelName: "vangooh"),
                                   ObjectModel(modelImage: UIImage(named: "vangooh1"), modelName: "vangooh"),
                                   ObjectModel(modelImage: UIImage(named: "vangooh2"), modelName: "vangooh") ]
