//
//  ViewController.swift
//  CustomCamera
//
//  Created by Alex Barbulescu on 2020-05-21.
//  Copyright © 2020 ca.alexs. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: BaseViewController {
    //MARK:- Vars
    var captureSession : AVCaptureSession!
    
    var backCamera : AVCaptureDevice!
    var frontCamera : AVCaptureDevice!
    var backInput : AVCaptureInput!
    var frontInput : AVCaptureInput!
    
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    var videoOutput : AVCaptureVideoDataOutput!
    
    var captureImage : UIImage!
    
    var takePicture = false
    var backCameraOn = true
    
    //MARK:- View Components
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    
    //    let switchCameraButton : UIButton = {
    //        let button = UIButton()
    //        let image = UIImage(named: "switchcamera")?.withRenderingMode(.alwaysTemplate)
    //        button.setImage(image, for: .normal)
    //        button.tintColor = .white
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    //
    //    let captureImageButton : UIButton = {
    //        let button = UIButton()
    //        button.backgroundColor = .white
    //        button.tintColor = .white
    //        button.layer.cornerRadius = 25
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    
    //    let capturedImageView = CapturedImageView()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        //            TabbarController.shared.hideTabbar()
        //        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkPermissions()
        setupAndStartCaptureSession()
    }
    //MARK:- Permissions
    func checkPermissions() {
        let cameraAuthStatus =  AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch cameraAuthStatus {
        case .authorized:
            return
        case .denied:
            abort()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
                                            { (authorized) in
                                                if(!authorized){
                                                    abort()
                                                }
                                            })
        case .restricted:
            abort()
        @unknown default:
            fatalError()
        }
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        takePicture = true
        //        let setProductVC = SetProductVC()
        //        setProductVC.picImageView.image = captureImage
        //        self.navigationController?.pushViewController(setProductVC, animated: false)
    }
    //MARK:- Camera Setup
    func setupAndStartCaptureSession(){
        DispatchQueue.global(qos: .userInitiated).async{
            //init session
            self.captureSession = AVCaptureSession()
            //start configuration
            self.captureSession.beginConfiguration()
            
            //session specific configuration
            if self.captureSession.canSetSessionPreset(.photo) {
                self.captureSession.sessionPreset = .photo
            }
            self.captureSession.automaticallyConfiguresCaptureDeviceForWideColor = true
            
            //setup inputs
            self.setupInputs()
            
            DispatchQueue.main.async {
                //setup preview layer
                self.setupPreviewLayer()
            }
            
            //setup output
            self.setupOutput()
            
            //commit configuration
            self.captureSession.commitConfiguration()
            //start running it
            self.captureSession.startRunning()
        }
    }
    
    func setupInputs(){
        //get back camera
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            backCamera = device
        } else {
            //handle this appropriately for production purposes
            fatalError("no back camera")
        }
        
        //get front camera
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            frontCamera = device
        } else {
            fatalError("no front camera")
        }
        
        //now we need to create an input objects from our devices
        guard let bInput = try? AVCaptureDeviceInput(device: backCamera) else {
            fatalError("could not create input device from back camera")
        }
        backInput = bInput
        if !captureSession.canAddInput(backInput) {
            fatalError("could not add back camera input to capture session")
        }
        
        guard let fInput = try? AVCaptureDeviceInput(device: frontCamera) else {
            fatalError("could not create input device from front camera")
        }
        frontInput = fInput
        if !captureSession.canAddInput(frontInput) {
            fatalError("could not add front camera input to capture session")
        }
        
        //connect back camera input to session
        captureSession.addInput(backInput)
    }
    
    func setupOutput(){
        videoOutput = AVCaptureVideoDataOutput()
        let videoQueue = DispatchQueue(label: "videoQueue", qos: .userInteractive)
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            fatalError("could not add video output")
        }
        
        videoOutput.connections.first?.videoOrientation = .portrait
    }
    
    func setupPreviewLayer(){
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewView.layer.insertSublayer(previewLayer, below: menuView.layer)
        previewLayer.frame = self.previewView.layer.frame
        
    }
    
    //    func switchCameraInput(){
    //        //don't let user spam the button, fun for the user, not fun for performance
    //        switchCameraButton.isUserInteractionEnabled = false
    //
    //        //reconfigure the input
    //        captureSession.beginConfiguration()
    //        if backCameraOn {
    //            captureSession.removeInput(backInput)
    //            captureSession.addInput(frontInput)
    //            backCameraOn = false
    //        } else {
    //            captureSession.removeInput(frontInput)
    //            captureSession.addInput(backInput)
    //            backCameraOn = true
    //        }
    //
    //        //deal with the connection again for portrait mode
    //        videoOutput.connections.first?.videoOrientation = .portrait
    //
    //        //mirror the video stream for front camera
    //        videoOutput.connections.first?.isVideoMirrored = !backCameraOn
    //
    //        //commit config
    //        captureSession.commitConfiguration()
    //
    //        //acitvate the camera button again
    //        switchCameraButton.isUserInteractionEnabled = true
    //    }
    
    //MARK:- Actions
    //    @objc func captureImage(_ sender: UIButton?){
    //        takePicture = true
    //    }
    //
    //    @objc func switchCamera(_ sender: UIButton?){
    //        switchCameraInput()
    //    }
    
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if !takePicture {
            return //we have nothing to do with the image buffer
        }
        
        //try and get a CVImageBuffer out of the sample buffer
        guard let cvBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        //get a CIImage out of the CVImageBuffer
        let ciImage = CIImage(cvImageBuffer: cvBuffer)
        
        //get UIImage out of CIImage
        let uiImage = UIImage(ciImage: ciImage)
        print(uiImage)
        
        DispatchQueue.main.async {
            self.captureImage = uiImage
            print(self.captureImage!)
            self.takePicture = false
        }
        
        
        
    }
    
}

