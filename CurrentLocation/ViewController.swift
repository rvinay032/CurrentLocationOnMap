//
//  ViewController.swift
//  CurrentLocation
//
//  Created by appinventiv on 04/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func mapBtnTap(_ sender: UIButton) {
        
        guard let mapScene = self.storyboard?.instantiateViewController(withIdentifier: "MyMapVCId") as? MyMapVC
            else {fatalError() }
        self.navigationController?.pushViewController(mapScene, animated: true)
       
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

