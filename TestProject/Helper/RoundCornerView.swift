//
//  RoundCornerView.swift
//  Runewood
//
//  Created by Apple on 23/12/2021.
//

import UIKit
class RoundCornerView: UIView {
    @IBInspectable var borderColor: UIColor = UIColor.white {
           didSet {
               self.layer.borderColor = borderColor.cgColor
           }
       }

       @IBInspectable var borderWidth: CGFloat = 2.0 {
           didSet {
               self.layer.borderWidth = borderWidth
           }
       }

       @IBInspectable var cornerRadius: CGFloat = 0.0 {
           didSet {
               self.layer.cornerRadius = cornerRadius
           }
       
    
}
}

extension UIViewController{
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      
    }
}
