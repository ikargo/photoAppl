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
        print("Loading camera")
        
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
    
    @IBAction func showImagePickerForPhotoLibrary(_ sender: Any) {
        self.showImagePickerForSourceType(sourceType: .photoLibrary, button: sender  as! UIBarButtonItem)
    }
    
    func showImagePickerForSourceType(sourceType:UIImagePickerControllerSourceType, button:UIBarButtonItem){
        
      //  if (imageIn.isAnimating) {
      //      imageIn.stopAnimating()
      //  }
        
        let newPicker = UIImagePickerController()
        newPicker.modalPresentationStyle = .currentContext
        newPicker.sourceType = sourceType
        newPicker.delegate = self
        //newPicker.modalPresentationStyle = .currentContext
        
        let presenter = newPicker.popoverPresentationController
        presenter?.barButtonItem = button
        presenter?.permittedArrowDirections = .any
        
        self.picker = newPicker
        self.present(self.picker!, animated: true, completion: nil)
    }
    
    
    //MARK: -UIImagePickerController delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage]
        print("Captured image \(image)")
        self.dismiss(animated: true, completion: nil)
        
      
     self.performSegue(withIdentifier: "showPhotoWithInformation", sender: self)
       
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationForThePhoto = segue.destination as! PhotoWithInformation
        destinationForThePhoto.imageOnTheShow = imageIn as! UIImageView
        
    }

    */
    
    
    
    
    
    //UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(" Cancel taking photo ")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // let storyboard = UIStoryboard(name: "PhotoWithInformation", bundle: nil)
    // let vc = storyboard.instantiateViewController(withIdentifier: "showPhotoWithInformation")
    // navigationcontroller?.pushViewController(vc, animated: true)
    
    
    // let controller = PhotoWithInformation()
    //controller.delegate = self
    //controller.imageOnTheShow = image
    
    // navigationController?.present(controller, animated: true, completion: nil)
    
    //controller.imageOnTheShow = image as! UIImageView
    
    
    
    //destinationForThePhoto.imageOnTheShow = image as! UIImageView
    
    // let newPhotowithData = PhotoWithInformation()
    //   newPhotowithData.imageOnTheShow = image as! UIImageView
    
    
    
    
    
    
    
    
    
    
    
}



   
