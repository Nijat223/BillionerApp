//
//  RegisterController.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 07.10.24.
//

import UIKit

protocol RegisterControllerDelegate: AnyObject {
    func didFinish(user: User)
}
final class RegisterController: UIViewController {
    
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var surnameField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var mailField: UITextField!
    private var user: User?
    var users: [User] = []
    weak var delegate: RegisterControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    fileprivate func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureButton()
    }
    
    fileprivate func configureButton() {
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginButton.setTitle("Login", for: .normal)
    }
    
    @objc
    fileprivate func signUpButtonClicked() {
        guard checkValidation() else {
            print(#function, "fieldler bosh ola bilmez")
            return
        }
        guard let name = nameField.text,
              let surname = surnameField.text,
              let password = passwordField.text,
              let mail = mailField.text else {return}
        
        user = User(name: name, surname: surname, email: mail, password: password)
        
        saveUserToDefault(user: user)
        
        guard let user = user else {return}
        delegate?.didFinish(user: user)
        navigationController?.popViewController(animated: true)
        UserDefaults.standard.setValue(user.name, forKey: "Name")

        
    }
    
    fileprivate func saveUserToDefault(user: User?){
        UserDefaults.standard.setValue(user?.name, forKey: "name")
        UserDefaults.standard.setValue(user?.surname, forKey: "surname")
        UserDefaults.standard.setValue(user?.email, forKey: "email")
         
    }
    

    fileprivate func checkValidation() -> Bool {
        guard let name = nameField.text,
              let surname = surnameField.text,
              let password = passwordField.text,
              let mail = mailField.text
        else {return false}
        return !(name.isEmpty || surname.isEmpty || password.isEmpty || mail.isEmpty)
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        switch sender {
        case nameField:
            if sender.text?.isEmpty == true {
                nameField.layer.borderColor = UIColor.red.cgColor
                nameField.layer.borderWidth = 1.0
            } else if !validateUsername(sender.text ?? "") {
                nameField.layer.borderColor = UIColor.red.cgColor
                nameField.layer.borderWidth = 1.0
            } else {
                nameField.layer.borderColor = UIColor.blue.cgColor
                nameField.layer.borderWidth = 1.0
            }
            
        case surnameField:
            if sender.text?.isEmpty == true {
                surnameField.layer.borderColor = UIColor.red.cgColor
                surnameField.layer.borderWidth = 1.0
            } else if !validateUsername(sender.text ?? "") {
                surnameField.layer.borderColor = UIColor.red.cgColor
                surnameField.layer.borderWidth = 1.0
            } else {
                surnameField.layer.borderColor = UIColor.blue.cgColor
                surnameField.layer.borderWidth = 1.0
            }
            
        case mailField:
            if sender.text?.isEmpty == true {
                mailField.layer.borderColor = UIColor.red.cgColor
                mailField.layer.borderWidth = 1.0
            } else if !validateEmail(sender.text ?? "") {
                mailField.layer.borderColor = UIColor.red.cgColor
                mailField.layer.borderWidth = 1.0
            } else {
                mailField.layer.borderColor = UIColor.blue.cgColor
                mailField.layer.borderWidth = 1.0
            }
            
        case passwordField:
            if sender.text?.isEmpty == true {
                passwordField.layer.borderColor = UIColor.red.cgColor
                passwordField.layer.borderWidth = 1.0
            } else if !validatePassword(sender.text ?? "") {
                passwordField.layer.borderColor = UIColor.red.cgColor
                passwordField.layer.borderWidth = 1.0
            } else {
                passwordField.layer.borderColor = UIColor.blue.cgColor
                passwordField.layer.borderWidth = 1.0
            }
            
        default:
            break
        }
        
        updateLoginButtonState()
    }
    
    private func resetFieldBorders() {
        [nameField, surnameField, mailField, passwordField].forEach {
            $0?.layer.borderColor = UIColor.clear.cgColor
            $0?.layer.borderWidth = 0.0
        }
    }
    
    private func validateUsername(_ username: String) -> Bool {
        let regex = "^[A-Za-z]+$"
        let allowedCharacters = NSPredicate(format: "SELF MATCHES %@", regex)
        return allowedCharacters.evaluate(with: username)
    }
    
    private func validateUsersurname(_ usersurname: String) -> Bool {
        let regex = "^[A-Za-z]+$"
        let allowedCharacters = NSPredicate(format: "SELF MATCHES %@", regex)
        return allowedCharacters.evaluate(with: usersurname)
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    private func isUserExists(username: String) -> Bool {
        return users.contains { $0.name == username }
    }
    
    private func addUser(username: String, number: String, email: String, password: String) {
        let newUser = User(name: username, surname: username, email: email, password: password)
        users.append(newUser)
    }
    
    private func clearFields() {
        nameField.text = ""
        surnameField.text = ""
        mailField.text = ""
        passwordField.text = ""
        
        resetFieldBorders()
    
    }
    
    private func updateLoginButtonState() {
        let isUsernameValid = validateUsername(nameField.text ?? "")
        let isUsersurnameValid = validateUsersurname(surnameField.text ?? "")
        let isEmailValid = validateEmail(mailField.text ?? "")
        let isPasswordValid = validatePassword(passwordField.text ?? "")
        
        let isFormValid = isUsernameValid && isUsersurnameValid && isEmailValid && isPasswordValid
        signUpButton.isEnabled = isFormValid
    }
    
    
    @objc
    fileprivate func loginButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}

