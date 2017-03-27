//
//  ViewController.swift
//  photoAppl
//
//  Created by planB on 20/3/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    
    var picker: UIImagePickerController?
    @IBOutlet weak var imageIn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK: -ShowCameraInterface
    
    @IBAction func showImagePickerForCamera(_ sender: Any) {
        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        if (authStatus == .denied){
            
            let alertController = UIAlertController(title: "Unable to access the Camera",
             message: "To enable access, got to Settings > Privacy > Camera and turn on Camera access for this app",
             preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
            
        } else if (authStatus == .notDetermined){
            
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { granted in
                if granted {self.showImagePickerForSourceType(sourceType: .camera, button: sender as! UIBarButtonItem)}
            })
            
        } else {
            self.showImagePickerForSourceType(sourceType: .camera, button: sender  as! UIBarButtonItem)
        }
    }
    
    
    func showImagePickerForSourceType(sourceType:UIImagePickerControllerSourceType, button:UIBarButtonItem){
        
        if (imageIn.isAnimating) {
            imageIn.stopAnimating()
        }
        let picker = UIImagePickerController()
        picker.modalPresentationStyle = .currentContext
        picker.sourceType = sourceType
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        
        let presenter = picker.popoverPresentationController
        presenter?.barButtonItem = button
        presenter?.permittedArrowDirections = .any
        
        self.picker = picker// not unserstood
        self.present(self.picker!, animated: true, completion: nil)// not unserstood
    }
    
    
    //MARK: -UIImagePickerController delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage]
        print("Captured image \(image)")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(" Cancel taking photo ")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

   
