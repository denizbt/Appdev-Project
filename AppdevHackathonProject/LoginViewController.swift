//
//  LoginViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/26/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let loginButton = UIButton()
    let height = CGFloat(40)

    let urlBlue = UIColor(red: 51/255, green: 102/255, blue: 204/255, alpha: 1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        
        loginLabel.text = "Login"
        loginLabel.font = .systemFont(ofSize: 50)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)

        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = .white
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.borderStyle = .roundedRect
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
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            usernameTextField.heightAnchor.constraint(equalToConstant: height),
            usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
