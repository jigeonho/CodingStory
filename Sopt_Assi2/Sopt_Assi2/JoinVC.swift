//
//  JoinVC.swift
//  Sopt_Ass2
//
//  Created by jigunho on 2016. 10. 22..
//  Copyright © 2016년 CSE. All rights reserved.
//

import UIKit
class JoinVC : UIViewController{
    
    
    @IBOutlet var edittext_ID: UITextField!
    
    @IBOutlet var edittext_psw1: UITextField!
    
    @IBOutlet var check_label1: UILabel!
    
    @IBOutlet var edittext_psw2: UITextField!
    
    @IBOutlet var check_label2: UILabel!
    
    @IBOutlet var edittext_name: UITextField!
    
    @IBOutlet var edittext_age: UITextField!
    var prob_join = [ 0, 0, 0 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        edittext_psw1.addTarget(self, action: "pswChange1", for: UIControlEvents.editingChanged)
      
        edittext_psw2.addTarget(self, action: "pswChange2", for: UIControlEvents.editingChanged)
        print("join Screen")
        
    }
    func pswChange1(){
        // 8~12자리 맞는지
        if(edittext_psw1.text?.utf8CString.count as Int! == 1){

            check_label1.textColor = UIColor.black
            check_label1.text? = "6~10자리"
            prob_join[1] = 0     // 회원가입 불가능

            
        }else if(edittext_psw1.text?.utf8CString.count as Int! > 6 && edittext_psw1.text?.utf8CString.count as Int! < 10){
            
            check_label1.textColor = UIColor.blue
            check_label1.text = " 사용가능"
            prob_join[1] = 1     // 회원가입 가능
            
        }else{
            
            check_label1.textColor = UIColor.red
            check_label1.text = " 사용불가"
            prob_join[1] = 0     // 회원가입 불가능

            
        }
 
        
    }
    func pswChange2(){
        // 위아래 일치하는지.
        if(edittext_psw2.text?.utf8CString.count as Int! == 1){
            
            check_label2.textColor = UIColor.black
            check_label2.text? = " 확 인"
            prob_join[2] = 0     // 회원가입 불가능

            
        }
        else if(edittext_psw1.text == edittext_psw2.text ){
            
            check_label2.textColor = UIColor.green
            check_label2.text = " 일 치"
            prob_join[2] = 1     // 회원가입 가능

            
        }else{
            
            check_label2.textColor = UIColor.red
            check_label2.text = " 불일치"
            prob_join[2] = 0     // 회원가입 불가능

        }
        
    }
    
    
    
    @IBAction func check_Dup(_ sender: UIButton) {
        // id 중복확인
        let alert = UIAlertController(title: "alarm", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        
        if(functionSet.check_id(edittext_ID.text!)){
            
            alert.message = "중복된 아이디입니다."
            prob_join[0] = 0     // 회원가입불가능
        }else{
            
            alert.message = "사용할 수 있는 아이디입니다"
            prob_join[0] = 1     // 회원가입 가능
            
        }
        
        present(alert, animated: true, completion: nil)
        
        
    }
    func disappear(alert: UIAlertAction){ // 이전 뷰로 돌아감
        print("disappear")
        super.viewDidDisappear(true)    // 현재 view 사라짐
                                        // 클로저로 충분히 표현가능
        
    }
    
    
    @IBAction func join_Btn(_ sender: UIButton) {
        
        var signal = true
        for index in 0...2{
            if(prob_join[index] == 1){
            }else{
                signal = false
                break
            }
        }
        
        
        let alert = UIAlertController(title: "Alarm", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        if(signal){
          
            alert.message = "성공적으로 가입되었습니다."
           // edittext_ID.text = "asd"
            functionSet.info_member[edittext_ID.text!] = [ "name" : edittext_name.text! , "password" : edittext_psw1.text! , "age" : Int(edittext_age.text!)! , "gender" : 1]    // Dictionary 추가
            
            
            
            // 프레젠트로 MainVC 로 이동.
            
            if let mvc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC{
                
                mvc.rData = edittext_ID.text!
                present(mvc, animated: true)
                
            }

            
        }else{
            alert.message = "회원정보를 다시한번 확인해주세요."
        }
        
        present(alert, animated: true, completion: nil)
        
        
 
    } // 최종 회원가입 ( 앞의 내용이 모두 이루어진 뒤 )
    
    @IBAction func cancel_Btn(_ sender: UIButton) {
        
        
        //  print("알람메시지")
        let alert = UIAlertController(title: "warning", message: "정말로 회원가입 취소하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: { (action:UIAlertAction!) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    func dismissPresent(_ sender : UIAlertAction){
        
        dismiss(animated: true)
    }
    
    
    
}

