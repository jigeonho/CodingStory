//
//  functionSet.swift
//  Sopt_Assi2
//
//  Created by jigunho on 2016. 10. 28..
//  Copyright © 2016년 SSU. All rights reserved.
//

import UIKit
class functionSet{
    
    static var info_member = [
        
        "jce0831" : ["name" : "지건호", "password" : "123456", "age": 22, "gender" : 1],
        "wlrjsgh12" : ["name" : "호건지", "password" : "654321", "age":23, "gender" : 1],
        "minjin" : ["name" : "김민진", "password" : "246810" , "age":25, "gender":0]
        
    ]
    
    
    static func isMember(_ id : String, _ password : String) -> Bool {
        
        if let res = info_member[id]{
            if let x : [String : Any] = res{
                
                print("id exist")
                let password1 : String = x["password"]! as! String
                if(password1 == password){
                    print("log in")
                    return true
                    
                }else{
                    print("password is wrong")
                    return false
                }
                
            }else{
                print("value is nil")
                return false
            }
        }else{
            print("key is not present in dict")
            return false
        }
        
    }
    static func check_id( _ id : String) -> Bool{
        
        if let res = info_member[id]{
            print("잇다")
            return true
        }else{
            
            print("없다")
            return false
        }
        
    }
    static func func1(){
        print("123")
    }
    
}
