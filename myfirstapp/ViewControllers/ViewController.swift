//
//  ViewController.swift
//  myfirstapp
//
//  Created by Konstantin on 29.08.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private var userName: String!
    private var password: String!
    
    // MARK: - IB Actions
    @IBAction private func showUserNameButton() {
        showAlert(with: "Heeello",
                  and: "Your name is \(UserInfo.user.rawValue)")
    }
    
    @IBAction private func showPasswordButton() {
        showAlert(with: "Heeello",
                  and: "Your password is \(UserInfo.password.rawValue)")
    }
    
    @IBAction private func logInButtonAction() {
        guard userNameTextField.text == UserInfo.user.rawValue
            else { return
                showAlertForPassword(with: "Incorrect input",
                                     and: "Please enter correct login")
        }
        
        guard passwordTextField.text == UserInfo.password.rawValue
            else { return
                showAlertForPassword(with: "Incorrect input",
                                     and: "Please enter correct password")
        }
        
        performSegue(withIdentifier: "enterSegue", sender: nil)
    }
    
    // MARK: - Keyboard Settings
    @IBAction func hideKeyboardTap(_ sender: UITapGestureRecognizer) {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            logInButtonAction()
        }
        return true
    }
    
    // MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "enterSegue" else { return }
        let tabBarController = segue.destination as! UITabBarController
        let destinationVC = tabBarController.viewControllers?.first as!
        ViewControllerHome
        
        destinationVC.nameLabel = userNameTextField.text
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controllers

extension ViewController {
    private func showAlertForPassword(with title: String,
                                      and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        { _ in self.passwordTextField.text = ""}
        
        present(alert, animated: true)
        
        alert.addAction(okAction)
    }
    
    private func showAlert(with title: String,
                           and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        
        present(alert, animated: true)
        
        alert.addAction(okAction)
    }
}
