//
//  CreateCommentViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit
import CoreLocation

class CreateCommentViewController: UIViewController {

    let headerLabel = UILabel()
    let textTextView = UITextView()
    let titleTextView = UITextView()
    let userIdTextField = UITextField()
    let saveButton = UIButton()

    weak var delegate: CreateCommentDelegate?

    init(delegate: CreateCommentDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    var id: LoginSession?
    
    init(id: LoginSession) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    var new_location: LocationManager?
    
    init(new_location: LocationManager) {
        self.new_location = new_location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        userIdTextField.placeholder = "Who's creating this post?"
        userIdTextField.translatesAutoresizingMaskIntoConstraints = false
        userIdTextField.clipsToBounds = true
        userIdTextField.layer.cornerRadius = 5
        userIdTextField.backgroundColor = .systemGray4
        userIdTextField.font = .systemFont(ofSize: 20)
        view.addSubview(userIdTextField)

        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }
    
    @objc func saveAction() {
        LocationManager.shared.getUserLocation { location in
            new_location?.locationManager(location.manager, didUpdateLocations: [location])
            //var latitude = location.latitude
            //var longitude = location.longitude
        }
        
        let text = textTextView.text!
        let user_id = id?.user_id

        
        if let unwrappedUserId = user_id {
            //delegate?.createComment(user_id: unwrappedUserId, number: 0,text: text, latitude: latitude, longitude: longitude)
        }
        
        

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
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

}

protocol CreateCommentDelegate: UIViewController {
    func createComment(user_id: Int, number: Int, text: String, latitude: Float, longitude: Float)
}
