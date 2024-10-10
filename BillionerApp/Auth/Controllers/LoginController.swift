//
//  LoginController.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 09.10.24.
//

import UIKit

final class LoginController : UIViewController{
    
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var mailField: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         configureUI()
    }
    
    fileprivate func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureButton()
        configureTextField()

    }
    fileprivate func configureButton(){
        signInButton.addTarget(self, action:#selector(signInButtonClicked), for: .touchUpInside)
        signInButton.setTitle("Login", for: .normal)
        signUpButton.addTarget(self, action:#selector(signUpButtonClicked), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)

    }
    @objc
    fileprivate func signUpButtonClicked(){
        showRegisterController()
    }
    
    @objc
    fileprivate func signInButtonClicked (){
        print(#function)
    }
    
    fileprivate func configureTextField() {
        passwordField.delegate = self
        mailField .delegate = self
    }
    
    fileprivate func showRegisterController() {
        let vc = UIStoryboard.init(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "RegisterController") as? RegisterController ?? RegisterController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension LoginController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        print(#function, text)
    }
    
}
 
