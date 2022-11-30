////
////  EditDetailViewController.swift
////  AppdevHackathonProject
////
////  Created by Youssef Ahmed on 11/29/22.
////
//
//import UIKit
//
//class EditDetailViewController: UIViewController {
//
//    let headerLabel = UILabel()
//    let titleLabel = UILabel()
//    let bodyTextView = UITextView()
//    let saveButton = UIButton()
//
//    var comment: Comment!
//    weak var delegate: ChangeCommentInfoDelegate?
//
//    init(comment: Comment, delegate: ChangeCommentInfoDelegate?) {
//        self.comment = comment
//        self.delegate = delegate
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        headerLabel.text = "Edit Post"
//        headerLabel.font = .boldSystemFont(ofSize: 20)
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerLabel.font = .systemFont(ofSize: 20)
//        view.addSubview(headerLabel)
//
//        titleLabel.text = comment.title
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.clipsToBounds = true
//        titleLabel.layer.cornerRadius = 5
//        titleLabel.font = .systemFont(ofSize: 24)
//        view.addSubview(titleLabel)
//
//        bodyTextView.text = comment.body
//        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
//        bodyTextView.clipsToBounds = true
//        bodyTextView.layer.cornerRadius = 5
//        bodyTextView.backgroundColor = .systemGray4
//        bodyTextView.font = .systemFont(ofSize: 20)
//        view.addSubview(bodyTextView)
//
//        saveButton.setTitle("Save", for: .normal)
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        saveButton.backgroundColor = .systemBlue
//        saveButton.layer.cornerRadius = 15
//        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
//        view.addSubview(saveButton)
//
//        setupConstraints()
//    }
//
//    @objc func saveAction() {
//        comment.title = titleLabel.text!
//        comment.body = bodyTextView.text!
//        delegate?.changeCellInfo(comment: comment)
//
//        //TODO: #3 Update Post
//
//        dismiss(animated: true)
//    }
//
//    func setupConstraints() {
//        let widthMultiplier: CGFloat = 0.75
//
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
//            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
//        ])
//
//        NSLayoutConstraint.activate([
//            bodyTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bodyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
//            bodyTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
//            bodyTextView.heightAnchor.constraint(equalTo: view.widthAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            saveButton.topAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 20),
//            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//protocol ChangeCommentInfoDelegate: AnyObject {
//    func changeCellInfo(comment: Comment)
//}
