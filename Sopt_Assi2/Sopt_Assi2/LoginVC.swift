//
//  LoginVC.swift
//  Sopt_Assi2
//
//  Created by jigunho on 2016. 10. 27..
//  Copyright © 2016년 SSU. All rights reserved.
//


import UIKit

class LoginVC : UIViewController{
    
    
    
    
    @IBOutlet var edittext_passwd: UITextField!
    @IBOutlet var edittext_id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    /*@IBAction func edittext_Click(_ sender: UITextField) {
        
        // id별로 나뉨.
        sender.resignFirstResponder()
        
        
    }
    */
    
    @IBAction func btn_Join(_ sender: Any) {
        

        if let jvc = storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinVC{ // 캐스팅 방식 1. 옵셔널 캐스팅과 : ! 2. 강제 캐스팅 : ?
            
            // 두번째 화면 viewDidLoad 에서 데이터를 받을 수는 없다. 안뜰껄?
            
            navigationController?.pushViewController(jvc, animated: true)
            
        }
        
    }
    
    @IBAction func btn_login(_ sender: UIButton) {
        
        let alert = UIAlertController(title : "Sopt IOS 화이팅!", message: "Warning!", preferredStyle: .alert)
        
        
        //navigationController?.popViewController(animated: false)

        var ok: UIAlertAction
        ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        

        if(edittext_id.text=="" || edittext_passwd.text==""){
            alert.message = "ID , 패스워드를 입력하세요."
            // case1. no input the value
            
        
        }else if(functionSet.isMember(edittext_id.text!, edittext_passwd.text!)){
            
            alert.message = "로그인 성공"
          //  init_Page()
            
            // 프레젠트방식
            if let mvc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC{
                
                mvc.rData = edittext_id.text!
                present(mvc, animated: true)
                
            }


        }else{
            
            alert.message = "아이디, 비밀번호를 다시한번 확인해주세요."
            

        }
        
        // 임의로 handler 를 바꾸는 메소드를 못찾겠습니다 ㅜㅜ

        present(alert,animated: true,completion: nil)

    }
    func init_Page(_ sender : UIAlertAction){
        
        if let jvc = storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinVC{ // 캐스팅 방식 1. 옵셔널 캐스팅과 : ! 2. 강제 캐스팅 : ?
            
            // 두번째 화면 viewDidLoad 에서 데이터를 받을 수는 없다. 안뜰껄?
            
            navigationController?.pushViewController(jvc, animated: true)
            
        }
        
        
    }
}




