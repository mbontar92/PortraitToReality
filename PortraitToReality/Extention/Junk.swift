//
//  Junk.swift
//  WindowDoors
//
//  Created by Lorem on 8/14/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//

import Foundation




// viewWillAppear
/*

 //        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
 //        configuration.planeDetection = .vertical
 //        sceneView.showsStatistics = true
 */
/*
 
  // Put Model inside
 let tapLocation = recognizer.location(in: sceneView)
 let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
 
 guard let hitTestResult = hitTestResults.first else { return }
 let translation = hitTestResult.worldTransform.translation
 let x = translation.x
 let y = translation.y
 let z = translation.z
 
 guard let shipScene = SCNScene(named: "ship.scn"),
 let shipNode = shipScene.rootNode.childNode(withName: "ship", recursively: false)
 else { return }
 
 shipNode.position = SCNVector3(x,y,z)
 sceneView.scene.rootNode.addChildNode(shipNode) */


// delegate methods
/*
 func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
 // 1
 
 
 guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
 
 // 2
 let width = CGFloat(planeAnchor.extent.x)
 let height = CGFloat(planeAnchor.extent.z)
 let plane = SCNPlane(width: width, height: height)
 
 // 3 color for area
 plane.materials.first?.diffuse.contents = areaColor
 
 // 4
 let planeNode = SCNNode(geometry: plane)
 
 // 5
 let x = CGFloat(planeAnchor.center.x)
 let y = CGFloat(planeAnchor.center.y)
 let z = CGFloat(planeAnchor.center.z)
 planeNode.position = SCNVector3(x,y,z)
 planeNode.eulerAngles.x = -.pi / 2
 
 // 6
 node.addChildNode(planeNode)
 
 }
 
 func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
 
 // 1
 guard let planeAnchor = anchor as?  ARPlaneAnchor,
 let planeNode = node.childNodes.first,
 let plane = planeNode.geometry as? SCNPlane
 else { return }
 
 // 2
 let width = CGFloat(planeAnchor.extent.x)
 let height = CGFloat(planeAnchor.extent.z)
 plane.width = width
 plane.height = height
 
 // 3
 let x = CGFloat(planeAnchor.center.x)
 let y = CGFloat(planeAnchor.center.y)
 let z = CGFloat(planeAnchor.center.z)
 planeNode.position = SCNVector3(x, y, z)
 
 } */

/*
 // MARK: - ARSCNViewDelegate
 func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
 }
 
 
 func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
 // This method will help when any node has been removed from sceneview
 print("didRemove")
 }
 
 func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
 // Called when any node has been updated with data from anchor
 print("didUpdate")
 }
 
 //    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
 //        // help us inform the user when the app is ready
 //    }
 
 // MARK: - ARSessionDelegate
 func sessionWasInterrupted(_ session: ARSession) {
 stateLabel.text = "Session was interrupted"
 }
 
 func sessionInterruptionEnded(_ session: ARSession) {
 stateLabel.text = "Session interruption ended"
 resetTracking()
 }
 
 func session(_ session: ARSession, didFailWithError error: Error) {
 stateLabel.text = "Session failed: \(error.localizedDescription)"
 resetTracking()
 }
 
 func resetTracking() {
 let configuration = ARWorldTrackingConfiguration()
 configuration.planeDetection = .horizontal
 sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
 }
 */
/*
 func sliderInstalation() {
 let slider = MultiSlider()
 
 slider.minimumValue = 0.3
 slider.maximumValue = 3
 
 slider.value = [0.5, 0.7, 1, 1.2, 1.5, 1.8, 2, 2.3, 2.6, 3]
 
 
 self.view.addSubview(slider)
 
 slider.translatesAutoresizingMaskIntoConstraints = false
 slider.centerXAnchor.constraint(equalToSystemSpacingAfter: sliderView.centerXAnchor, multiplier: 0).isActive = true
 
 slider.topAnchor.constraint(equalToSystemSpacingBelow: sliderView.topAnchor, multiplier: 0).isActive = true
 
 slider.bottomAnchor.constraint(equalToSystemSpacingBelow: sliderView.bottomAnchor, multiplier: 0).isActive = true
 
 slider.orientation = .vertical
 slider.valueLabelPosition = .right
 slider.isValueLabelRelative = true
 slider.valueLabelFormatter.positiveSuffix = " 𝞵s"
 slider.outerTrackColor = .lightGray
 
 slider.snapStepSize = 0.5 // default is 0.0, i.e. don't snap
 slider.isHapticSnap = false
 
 
 
 slider.tintColor = .cyan // color of track
 slider.trackWidth = 32
 slider.hasRoundTrackEnds = false
 slider.showsThumbImageShadow = false
 slider.addTarget(self, action: #selector(sliderChanged(slider:)), for: .valueChanged) // continuous changes
 //        slider.addTarget(self, action: #selector(sliderDragEnded(_:)), for: . touchUpInside) // sent when drag ends
 }
 @objc func sliderChanged(slider: MultiSlider) {
 print("\(slider.value)") // e.g., [1.0, 4.5, 5.0]
 }
 */

// SHIP MODEL
/*
 // add Model
 let tapLocation = recognizer.location(in: sceneView)
 let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
 
 guard let hitTestResult = hitTestResults.first else { return }
 let translation = hitTestResult.worldTransform.translation
 let x = translation.x
 let y = translation.y
 let z = translation.z
 
 guard let shipScene = SCNScene(named: "ship.scn"),
 let shipNode = shipScene.rootNode.childNode(withName: "ship", recursively: false)
 else { return }
 
 
 shipNode.position = SCNVector3(x,y,z)
 sceneView.scene.rootNode.addChildNode(shipNode)
 */

// AR DELEGATE

/*
 //
 extension VirtualRealityViewController {
 
 
 func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
 
 // 1
 guard let planeAnchor = anchor as?  ARPlaneAnchor,
 let planeNode = node.childNodes.first,
 let plane = planeNode.geometry as? SCNPlane
 else { return }
 
 // 2
 let width = CGFloat(planeAnchor.extent.x)
 let height = CGFloat(planeAnchor.extent.z)
 plane.width = width
 plane.height = height
 
 // 3
 let x = CGFloat(planeAnchor.center.x)
 let y = CGFloat(planeAnchor.center.y)
 let z = CGFloat(planeAnchor.center.z)
 planeNode.position = SCNVector3(x, y, z)
 }
 
 func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
 // 1
 guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
 
 // 2
 let width = CGFloat(planeAnchor.extent.x)
 let height = CGFloat(planeAnchor.extent.z)
 let plane = SCNPlane(width: width, height: height)
 
 // 3
 plane.materials.first?.diffuse.contents = UIColor.getCustomBlueColor
 
 // 4
 let planeNode = SCNNode(geometry: plane)
 
 // 5
 let x = CGFloat(planeAnchor.center.x)
 let y = CGFloat(planeAnchor.center.y)
 let z = CGFloat(planeAnchor.center.z)
 planeNode.position = SCNVector3(x,y,z)
 planeNode.eulerAngles.x = -.pi / 2
 
 // 6
 node.addChildNode(planeNode)
 }
 }

 */
