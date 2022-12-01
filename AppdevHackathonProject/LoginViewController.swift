//
//  LoginViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/26/22.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    let welcome = UILabel()
    let usernameTextField = UITextField()
    let usernameUILabel = UILabel()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let loginButton = UIButton()
    let height = CGFloat(40)

    let urlBlue = UIColor(red: 51/255, green: 102/255, blue: 204/255, alpha: 1.0)
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = maroon
        
        welcome.text = "Welcome!"
        welcome.font = .systemFont(ofSize: 32)
        welcome.textAlignment = .center
        welcome.textColor = .white
        welcome.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome)
        
        usernameUILabel.text = "USERNAME"
        usernameUILabel.font = .systemFont(ofSize: 15)
        usernameUILabel.textAlignment = .center
        usernameUILabel.textColor = .white
        usernameUILabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameUILabel)

        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = .white
        usernameTextField.borderStyle = .roundedRect
        //usernameTextField.delegate = self
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.borderStyle = .roundedRect
        //passwordTextField.delegate = self
        passwordTextField.layer.borderWidth = 3
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(urlBlue, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        setUpConstraints()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func signUp() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    @objc func login() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            welcome.topAnchor.constraint(equalTo: view.topAnchor, constant: 207),
            welcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            welcome.heightAnchor.constraint(equalToConstant: 39),
            welcome.widthAnchor.constraint(equalToConstant: 157)
        ])
        
        NSLayoutConstraint.activate([
            usernameUILabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 282),
            usernameUILabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameUILabel.heightAnchor.constraint(equalToConstant: 14),
            usernameUILabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 207),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameTextField.heightAnchor.constraint(equalToConstant: 39),
            usernameTextField.widthAnchor.constraint(equalToConstant: 157)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 45),
            passwordTextField.heightAnchor.constraint(equalToConstant: height),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
    }
    
    func loginButtonPressed (_sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
