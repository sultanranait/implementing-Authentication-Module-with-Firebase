//
//  SigninViewModel.swift
//  TestProject
//
//  Created by Apple on 02/03/2022.
//

import UIKit
import FirebaseAuth
class SigninViewModel: NSObject {

    
    
    func signIn(email: String, password: String, completionBlock: @escaping (_ success: Bool, _ data:String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false,error.localizedDescription)
            } else {
                completionBlock(true,"User sucessfully logged in.")
            }
        }
    }
    
}
