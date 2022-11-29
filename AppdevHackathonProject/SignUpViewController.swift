//
//  SignUpViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/28/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let signUpLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let signUpButton = UIButton()
    let height = CGFloat(40)

    let urlBlue = UIColor(red: 51/255, green: 102/255, blue: 204/255, alpha: 1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        
        signUpLabel.text = "Sign Up"
        signUpLabel.font = .systemFont(ofSize: 50)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpLabel)

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
        
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.layer.borderWidth = 3
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordTextField)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .blue
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        
        setUpConstraints()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func signUp() {
        
        let password=passwordTextField.text ?? ""
        let confirmPassword=confirmPasswordTextField.text ?? ""
        let username=usernameTextField.text ?? ""

        if(password.isEmpty || confirmPassword.isEmpty || username.isEmpty){
            let invalidInputAlert = UIAlertController(title: "Empty Field(s)", message: "Please make sure all text fields are completed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should check empty text fields")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else if (password != confirmPassword) {
            let invalidInputAlert = UIAlertController(title: "Passwords Do Not Match", message: "Please make sure the password and confirm password fields match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should check empty text fields")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else{
            //TODO: post info to database
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: height),
            confirmPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
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
