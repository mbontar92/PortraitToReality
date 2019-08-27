//
//  ViewController.swift
//  WindowDoors
//
//  Created by Lorem on 8/14/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import ARVideoKit
import LTMorphingLabel


class VirtualRealityViewController: UIViewController, ARSCNViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var photoButtonOutlet: UIButton!
    @IBOutlet weak var videoButtonOutlet: UIButton!
    @IBOutlet weak var stateLabel: LTMorphingLabel!
    @IBOutlet weak var photoToVideoSwitchOutlet: UISwitch!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepperViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var lightEffectView: UIView!
    
    // MARK: - STEPPER outlets
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightStepperOutlet: UIStepper!
    @IBOutlet weak var widthStepperOutlet: UIStepper!
    
    

    var modelsArray: [ObjectModel] = [ObjectModel(modelImage: UIImage(named: "picasso"), modelName: "picasso"),
                                      ObjectModel(modelImage: UIImage(named: "picasso1"), modelName: "picasso1"),
                                      ObjectModel(modelImage: UIImage(named: "picasso2"), modelName: "picasso2"),
                                      ObjectModel(modelImage: UIImage(named: "painting1"), modelName: "painting1"),
                                      ObjectModel(modelImage: UIImage(named: "monalisa"), modelName: "monalisa"),
                                      ObjectModel(modelImage: UIImage(named: "vangooh"), modelName: "vangooh"),
                                      ObjectModel(modelImage: UIImage(named: "vangooh1"), modelName: "vangooh"),
                                      ObjectModel(modelImage: UIImage(named: "vangooh2"), modelName: "vangooh") ]
    
    // MARK: - Properties
    private var object = SCNNode()
    private var recorder: RecordAR?
    var videoIsRecording = false
    var menuIsVisible = false
    var modelImageName = "picasso"
    var objectHeight = 1.2
    var objectWidth = 0.8

    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGestureToSceneView()
        addPinGestureRecognizer()
        addPanGestureRecognizer()
        
        recorder = RecordAR(ARSceneKit: sceneView)
        recorder?.inputViewOrientations = [.portrait, .landscapeLeft, .landscapeRight]
        
        
        collectionView.register(UINib(nibName: "ModelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ModelCollectionViewCell")
    
    }
    
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        
        //        configuration.planeDetection = .vertical
        //          sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.session.run(configuration)
        recorder?.prepare(configuration)
        
        sceneView.delegate = self
        
        setAdditionallViews()
    }
    
    
    // MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
        recorder?.rest()
    }
    
    
    
    // MARK: switch between photo and video
    @IBAction func photoOrVideoSwitchAction(_ sender: UISwitch) {
        if sender.isOn == true {
            photoButtonOutlet.alpha = 0
            videoButtonOutlet.alpha = 1
        } else {
            photoButtonOutlet.alpha = 1
            videoButtonOutlet.alpha = 0
        }
    }
    

    // MARK: take a photo Button
    @IBAction func photoActionButton(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(sceneView.snapshot(), nil, nil, nil)
        flashAnimation(mainView: self.view, lightView: lightEffectView)
    }
    
    
    // MARK: record video Button
    @IBAction func videoActionButton(_ sender: Any) {
        if videoIsRecording == false && recorder?.status == .readyToRecord  {
            // Start recording
            recorder?.record()
            photoToVideoSwitchOutlet.isEnabled = false
            pulsatingButtonAnimation(button: videoButtonOutlet)
        } else if recorder?.status == .recording || recorder?.status == .paused {
            // Finish recording
            recorder?.stopAndExport()
            photoToVideoSwitchOutlet.isEnabled = true
            videoButtonOutlet.layer.removeAllAnimations()
        }
        videoIsRecording = !videoIsRecording
    }
    
    
    // MARK: show menu action button
    @IBAction func menuActionButton(_ sender: Any) {
        if menuIsVisible == false {
            stepperViewLeadingConstraint.constant = 30
            self.collectionViewTrailingConstraint.constant = 10
            UIView.animate(withDuration: 0.7) {
                self.view.layoutIfNeeded()
            }
        } else {
            stepperViewLeadingConstraint.constant = -150
            self.collectionViewTrailingConstraint.constant = -200
            UIView.animate(withDuration: 0.7) {
                self.view.layoutIfNeeded()
            }
        }
        menuIsVisible = !menuIsVisible
    }
    
    
    // MARK: height stepper
    @IBAction func heightStepperValueAction(_ sender: UIStepper) {
        heightLabel.text = "height : \(Float(sender.value))"
        objectHeight = sender.value
    }
    // MARK: width stepper
    @IBAction func widthStepperValueAction(_ sender: UIStepper) {
        widthLabel.text = "width : \(Float(sender.value))"
        objectWidth = sender.value
    }
    
    func setAdditionallViews() {
        
        collectionViewTrailingConstraint.constant = -150
        stepperViewLeadingConstraint.constant = -150
        heightLabel.text = "height : \(Float(heightStepperOutlet.value))"
        widthLabel.text = "width : \(Float(widthStepperOutlet.value))"
    }
    
    
    // MARK: - Add object to view
    func addObjectToView(x: Float = 0, y: Float = 0, z: Float = 0) {
        
        // box heihgt and width
        let boxObject = SCNBox(width: CGFloat(objectWidth), height: CGFloat(objectHeight), length: 0.06, chamferRadius: 0)
        // material
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: modelImageName)
        boxObject.materials = [material]
        
         let boxObjectNode = SCNNode(geometry: boxObject)
        
        object = boxObjectNode
        object.position = SCNVector3(x, y, z)
        
        sceneView.scene.rootNode.addChildNode(object)
    }
    
        
    // MARK: - addTapGestureToSceneView
    func addTapGestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(VirtualRealityViewController.addActionToView(withGestureRecognizer:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func addActionToView(withGestureRecognizer recognizer: UIGestureRecognizer) {
    
        
        let tapLocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation)
        guard let node = hitTestResults.first?.node else {
            let hitTestResultsWithFeaturePoints = sceneView.hitTest(tapLocation, types: .featurePoint)
            if let hitTestResultWithFeaturePoints = hitTestResultsWithFeaturePoints.first {
                let translation = hitTestResultWithFeaturePoints.worldTransform.translation
                
                addObjectToView(x: translation.x, y: translation.y, z: translation.z)
            }
            return
        }
        node.removeFromParentNode()
    }
    
    
    // MARK: - pinGestureRecognizer
    func addPinGestureRecognizer() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
    }
    @objc func didPinch(_ gesture: UIPinchGestureRecognizer) {

        var originalScale = object.scale
        
        switch gesture.state {
        case .began:
            originalScale = object.scale
            gesture.scale = CGFloat((object.scale.x))
        case .changed:
             var newScale = originalScale
            if gesture.scale < 0.5{ newScale = SCNVector3(x: 0.5, y: 0.5, z: 0.5) }else if gesture.scale > 2{
                newScale = SCNVector3(2, 2, 2)
            } else {
                newScale = SCNVector3(gesture.scale, gesture.scale, gesture.scale)
            }
            object.scale = newScale
        case .ended:
            var newScale = originalScale
            if gesture.scale < 0.5{ newScale = SCNVector3(x: 0.5, y: 0.5, z: 0.5) }else if gesture.scale > 2{
                newScale = SCNVector3(2, 2, 2)
            } else {
                newScale = SCNVector3(gesture.scale, gesture.scale, gesture.scale)
            }
            object.scale = newScale
            gesture.scale = CGFloat((object.scale.x))
        default:
            gesture.scale = 1.0
            originalScale = object.scale
        }
    }
    
    
    // MARK: - addPanGestureRecognizer
    func addPanGestureRecognizer(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        //        panGesture.delegate = self
        sceneView.addGestureRecognizer(panGesture)
    }
    var currentAngleY: Float = 0.0
    
    @objc func didPan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        var newAngleY = (Float)(translation.x)*(Float)(Double.pi)/180.0
    
        
        newAngleY += currentAngleY
        object.eulerAngles.y = newAngleY
        
        if gesture.state == .ended{
            currentAngleY = newAngleY
        }
    }
    
    
    // MARK: - ARSCNViewDelegate
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        // help us inform the user when the app is ready
        
        switch camera.trackingState {
        case .normal :
           
            stateLabel.morphingEffect = .evaporate
            stateLabel.text = "Camera state is ready to use"
            
            
        //            stateLabel.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case .notAvailable:
            stateLabel.morphingEffect = .scale
            stateLabel.text = "Tracking not available."
        //            stateLabel.backgroundColor = .red
        case .limited(.excessiveMotion):
            stateLabel.morphingEffect = .scale
            stateLabel.text = "Tracking limited - Move the device more slowly."
        //            stateLabel.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        case .limited(.insufficientFeatures):
            stateLabel.morphingEffect = .scale
            stateLabel.text = "Tracking limited - Point the device at an area with visible surface detail."
        //            stateLabel.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        case .limited(.initializing):
            stateLabel.morphingEffect = .scale
            stateLabel.text = "Initializing AR session."
        //            stateLabel.backgroundColor = .orange
        default:
            
            stateLabel.text = ""
        }
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension VirtualRealityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModelCollectionViewCell", for: indexPath) as! ModelCollectionViewCell
        
        let model = modelsArray[indexPath.row]
        
        cell.modelImageView.image = model.modelImage
        
        return cell
    }
    // cell height / width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 80.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = modelsArray[indexPath.row]
        
        if let name = model.modelName {
            modelImageName = name
            self.collectionViewTrailingConstraint.constant = -200
            stepperViewLeadingConstraint.constant = -150
            UIView.animate(withDuration: 0.7) {
                self.view.layoutIfNeeded()
                self.menuIsVisible = !self.menuIsVisible
            }
        }
    }
}

// MARK: - Float Number Extention
extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}



