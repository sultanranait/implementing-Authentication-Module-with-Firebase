//
//  SignInViewController.swift
//  TestProject
//
//  Created by Apple on 02/03/2022.
//

import UIKit
import RappleProgressHUD

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var viewModel = SigninViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func SignInButton() {
        
        guard let email = txtEmail.text, txtEmail.text != "" ,txtEmail.text != nil else  {
            showAlert(message: "Please Enter Email")
            return
        }
        guard let password = txtPassword.text, txtPassword.text != "" ,txtPassword.text != nil else  {
            showAlert(message: "Please Enter Password")
            return
            
        }
        RappleActivityIndicatorView.startAnimating()
        viewModel.signIn(email: email, password: password) {[weak self] (success,data) in
            guard self != nil else { return }
            var message: String = ""
            message = data
            RappleActivityIndicatorView.stopAnimation()
            self?.showAlert(message: message)
            
        }
    }
    
    
    @IBAction func signinBtnAction(_ sender: Any) {
        SignInButton()
    }
    
    @IBAction func notAccountBtnAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
