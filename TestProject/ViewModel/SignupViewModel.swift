//
//  SignupViewModel.swift
//  TestProject
//
//  Created by Apple on 02/03/2022.
//

import UIKit
import FirebaseAuth

class SignupViewModel: NSObject {
    
    
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool, _ data:String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true,"User sucessfully created.")
                
            } else {
                completionBlock(false,error?.localizedDescription ?? "")
            }
        }
    }
    
}
