//
//  PhotoWithInformation.swift
//  photoAppl
//
//  Created by planB on 4/4/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit

class PhotoWithInformation: UIViewController {

    @IBOutlet weak var imageOnTheShow: UIImageView!
    @IBOutlet weak var nameOfThePhot: UILabel!
    @IBOutlet weak var locationOfThePhoto: UILabel!
    @IBOutlet weak var timeOfThePhoto: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
