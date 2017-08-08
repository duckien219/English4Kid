//
//  BottomVC.swift
//  English4Kid
//
//  Created by Kien Nguyen Duc on 8/8/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class BottomVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var nameImage: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("nameImgae\(nameImage)")
        
        imgView.image = UIImage(named: nameImage as String)
        
        
    }

  
    

    
}
