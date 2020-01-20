//
//  VirtualRealityViewController+ViewModel.swift
//  PortraitToReality
//
//  Created by Mykhailo on 18.01.2020.
//  Copyright © 2020 Bontar Mykhailo. All rights reserved.
//

import UIKit
import ARKit

extension VirtualRealityViewController {
    class ViewModel {
        
        private(set) var modelsArray: [ObjectModel] = []
        private var videoIsRecording = false
        open var menuIsVisible = false
        open var modelName = ""
        
        enum MenuState: Int {
            case open = 
            case closed = 
        }
        
        // MARK: - Properties
        open var objectScene: SCNScene!
        open var object = SCNNode()
        open var boxObject = SCNBox()
        open var boxObjectNode = SCNNode()
        
        func setUpModelArray() {
            var modelsArray: [ObjectModel] =
                [ObjectModel(modelImage: UIImage(named: "picasso"), modelName: "picasso"),
                 ObjectModel(modelImage: UIImage(named: "picasso1"), modelName: "picasso1"),
                 ObjectModel(modelImage: UIImage(named: "picasso2"), modelName: "picasso2"),
                 ObjectModel(modelImage: UIImage(named: "painting1"), modelName: "painting1"),
                 ObjectModel(modelImage: UIImage(named: "monalisa"), modelName: "monalisa"),
                 ObjectModel(modelImage: UIImage(named: "vangooh"), modelName: "vangooh"),
                 ObjectModel(modelImage: UIImage(named: "vangooh1"), modelName: "vangooh"),
                 ObjectModel(modelImage: UIImage(named: "vangooh2"), modelName: "vangooh") ]
        }
        
        var shouldReturnModelArray: (([ObjectModel]) -> Void)
        
        var shouldReturnObject: ((ObjectModel) -> Void)
        
        var shouldAddObjectToScene: ((SCNNode) -> Void)
        

        func didSelectItem(index: Int) {
            if modelsArray.count > 0 {
                shouldReturnObject(modelsArray[index])
            }
        }
        
        
        func addObjectToView(x: Float = 0, y: Float = 0, z: Float = 0, width: CGFloat , height: CGFloat) {
            
            // box height and width
            boxObject = SCNBox(width: width, height: height, length: 0.06, chamferRadius: 0)
            let material = SCNMaterial()
            // material
            material.diffuse.contents = UIImage(named: modelName)
            boxObject.materials = [material]
            
            boxObjectNode = SCNNode(geometry: boxObject)
            
            object = boxObjectNode
            object.position = SCNVector3(x, y, z)
            
            shouldAddObjectToScene(object)
        }
    }
}
