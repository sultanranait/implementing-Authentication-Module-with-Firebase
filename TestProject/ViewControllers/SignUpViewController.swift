//
//  SignUpViewController.swift
//  TestProject
//
//  Created by Apple on 02/03/2022.
//

import UIKit
import RappleProgressHUD

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var viewModel = SignupViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func SignUpButton() {
        guard let email = txtEmail.text, txtEmail.text != "" ,txtEmail.text != nil else  {
            showAlert(message: "Please Enter Email")
            return
        }
        guard let password = txtPassword.text, txtPassword.text != "" ,txtPassword.text != nil else  {
            showAlert(message: "Please Enter Password")
            return
        }
        RappleActivityIndicatorView.startAnimating()
        viewModel.createUser(email: email, password: password) {[weak self] (success,data) in
            guard self != nil else { return }
            var message: String = ""
            message = data
            RappleActivityIndicatorView.stopAnimation()
            self?.showAlert(message: message)
            
        }
        
    }
    
    
    @IBAction func signupBtnAction(_ sender: Any) {
        SignUpButton()
    }
    
    @IBAction func alreadyAccntAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
