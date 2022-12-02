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
    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let or = UILabel()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let noAccountLabel = UILabel()
    let signUpButton = UIButton()
    let loginButton = UIButton()

    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = maroon
        
        welcome.text = "Welcome!"
        welcome.font = .boldSystemFont(ofSize: 32)
        welcome.textColor = .white
        welcome.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcome)
        
        emailLabel.text = "EMAIL"
        emailLabel.font = .systemFont(ofSize: 15)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        emailTextField.backgroundColor = maroon
        emailTextField.textColor = .white
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        let horzEmailLine = CGRect(x: 54, y: 281, width: 281.5, height: 0.5)
        let view1 = UIView(frame: horzEmailLine)
        view1.backgroundColor = .white
        self.view.addSubview(view1)
        
        or.text = "OR"
        or.font = .systemFont(ofSize: 14)
        or.textAlignment = .center
        or.textColor = .white
        or.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(or)
        
        usernameLabel.text = "USERNAME"
        usernameLabel.font = .systemFont(ofSize: 15)
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
            
        usernameTextField.backgroundColor = maroon
        usernameTextField.textColor = .white
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        let horzUsernameLine = CGRect(x: 54, y: 380, width: 281.5, height: 0.5) //TODO: Change
        let view2 = UIView(frame: horzUsernameLine)
        view2.backgroundColor = .white
        self.view.addSubview(view2)
        
        passwordLabel.text = "PASSWORD"
        passwordLabel.font = .systemFont(ofSize: 15)
        passwordLabel.textColor = .white
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        passwordTextField.backgroundColor = maroon
        passwordTextField.textColor = .white
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let horzPasswordLine = CGRect(x: 54, y: 454, width: 281.5, height: 0.5) //TODO: Change
        let view3 = UIView(frame: horzPasswordLine)
        view3.backgroundColor = .white
        self.view.addSubview(view3)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(maroon, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 16)
        loginButton.backgroundColor = .white
        loginButton.titleLabel?.textAlignment = .center
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        noAccountLabel.text = "Don't have an account?"
        noAccountLabel.font = .systemFont(ofSize: 15)
        noAccountLabel.textColor = .white
        noAccountLabel.textAlignment = .center
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noAccountLabel)
        
        signUpButton.setTitle("Create an account!", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20)
        signUpButton.titleLabel?.textAlignment = .center
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
        let password=passwordTextField.text ?? ""
        let email=emailTextField.text ?? ""
        let username=usernameTextField.text ?? ""

        if(password.isEmpty || (email.isEmpty && username.isEmpty)){
            let invalidInputAlert = UIAlertController(title: "Empty Field(s)", message: "Please make sure all text fields are completed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should check empty text fields")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else{
            //TODO: post info to database
            navigationController?.pushViewController(ViewController(), animated: true)

        }
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            welcome.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),
            welcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            welcome.heightAnchor.constraint(equalToConstant: 39),
            welcome.widthAnchor.constraint(equalToConstant: 157)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 232),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            emailLabel.heightAnchor.constraint(equalToConstant: 14),
            emailLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 281),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            emailTextField.heightAnchor.constraint(equalToConstant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            or.topAnchor.constraint(equalTo: view.topAnchor, constant: 306),
            or.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            or.heightAnchor.constraint(equalToConstant: 12),
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 331),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameLabel.heightAnchor.constraint(equalToConstant: 14),
            usernameLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameTextField.heightAnchor.constraint(equalToConstant: 20),
            usernameTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 405),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            passwordLabel.heightAnchor.constraint(equalToConstant: 14),
            passwordLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 454),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 503),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            loginButton.widthAnchor.constraint(equalToConstant: 284),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            noAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 619),
            noAccountLabel.heightAnchor.constraint(equalToConstant: 18),
            noAccountLabel.widthAnchor.constraint(equalToConstant: 170),
            noAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 644),
            signUpButton.heightAnchor.constraint(equalToConstant: 24),
            signUpButton.widthAnchor.constraint(equalToConstant: 176),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func loginButtonPressed (_sender: UIButton) {
    }
}
