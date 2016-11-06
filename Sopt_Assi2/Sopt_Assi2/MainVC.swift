//
//  MainVC.swift
//  Sopt_Assi2
//
//  Created by jigunho on 2016. 10. 27..
//  Copyright © 2016년 SSU. All rights reserved.
//

import UIKit
class MainVC : UIViewController{
    
    
    @IBOutlet var label_name: UILabel!
    
    @IBOutlet var label_id: UILabel!
    
    
    @IBOutlet var label_password: UILabel!
    
    @IBOutlet var label_age: UILabel!
    
    @IBOutlet var label_gender: UILabel!
    var rData = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_id.text = rData
        label_name.text = functionSet.info_member[rData]!["name"] as? String
        label_password.text = functionSet.info_member[rData]!["password"] as? String
        
        if let age = functionSet.info_member[rData]!["age"]{
            label_age.text = "\(age)"

        }
        
        let gender = functionSet.info_member[rData]!["gender"] as? Int
        if(gender==1){
            label_gender.text = "남성"
        }else{
            label_gender.text = "여성"
        }
    }
    @IBAction func toHome(_ sender: Any) {
        
        // 현재 프레젠트 제거.
    //    navigationController?.popViewController(animated: true)
        
        print("asd")
       // dismiss(animated: true, completion: nil)
    }
    
    
}
