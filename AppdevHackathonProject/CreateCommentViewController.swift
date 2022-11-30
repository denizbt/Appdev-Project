//
//  CreateCommentViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit

class CreateCommentViewController: UIViewController {

    let headerLabel = UILabel()
    let textTextView = UITextView()
    let titleTextView = UITextView()
    let posterTextField = UITextField()
    let saveButton = UIButton()

    weak var delegate: CreateCommentDelegate?

    init(delegate: CreateCommentDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        headerLabel.text = "Create Post"
        headerLabel.font = .boldSystemFont(ofSize: 20)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(headerLabel)

        titleTextView.text = "Insert Body"
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        titleTextView.clipsToBounds = true
        titleTextView.layer.cornerRadius = 5
        titleTextView.backgroundColor = .systemGray4
        titleTextView.font = .systemFont(ofSize: 15)
        view.addSubview(titleTextView)
        
        textTextView.text = "Insert Body"
        textTextView.translatesAutoresizingMaskIntoConstraints = false
        textTextView.clipsToBounds = true
        textTextView.layer.cornerRadius = 5
        textTextView.backgroundColor = .systemGray4
        textTextView.font = .systemFont(ofSize: 15)
        view.addSubview(textTextView)

        posterTextField.placeholder = "Who's creating this post?"
        posterTextField.translatesAutoresizingMaskIntoConstraints = false
        posterTextField.clipsToBounds = true
        posterTextField.layer.cornerRadius = 5
        posterTextField.backgroundColor = .systemGray4
        posterTextField.font = .systemFont(ofSize: 20)
        view.addSubview(posterTextField)

        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }
    
    @objc func saveAction() {
        let title = titleTextView.text!
        let body = textTextView.text!
        let poster = posterTextField.text!

        delegate?.createComment(title: title, body: body, poster: poster)

        navigationController?.popViewController(animated: true)
    }

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            textTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            textTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            textTextView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            posterTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterTextField.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 20),
            posterTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])

        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: posterTextField.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

protocol CreateCommentDelegate: UIViewController {
    func createComment(title: String, body: String, poster: String)
}
