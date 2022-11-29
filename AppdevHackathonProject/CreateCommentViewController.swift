//
//  CreateCommentViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit

class CreateCommentViewController: UIViewController {

    let headerLabel = UILabel()
    let titleTextField = UITextField()
    let bodyTextView = UITextView()
    let posterTextField = UITextField()
    let saveButton = UIButton()

    weak var delegate: CreatePostDelegate?

    init(delegate: CreatePostDelegate) {
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

        titleTextField.placeholder = "Post title"
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.clipsToBounds = true
        titleTextField.layer.cornerRadius = 5
        titleTextField.backgroundColor = .systemGray4
        titleTextField.font = .systemFont(ofSize: 20)
        view.addSubview(titleTextField)

        bodyTextView.text = "Insert Body"
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.clipsToBounds = true
        bodyTextView.layer.cornerRadius = 5
        bodyTextView.backgroundColor = .systemGray4
        bodyTextView.font = .systemFont(ofSize: 15)
        view.addSubview(bodyTextView)

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
        let title = titleTextField.text!
        let body = bodyTextView.text!
        let poster = posterTextField.text!

        delegate?.createPost(title: title, body: body, poster: poster)

        navigationController?.popViewController(animated: true)
    }

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            titleTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])

        NSLayoutConstraint.activate([
            bodyTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            bodyTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            bodyTextView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            posterTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterTextField.topAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 20),
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

protocol CreatePostDelegate: UIViewController {
    func createPost(title: String, body: String, poster: String)
}
