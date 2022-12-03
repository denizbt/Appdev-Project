//
//  ProfileViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/1/22.
//

import UIKit

class ProfileViewController: UIViewController {
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    let nameLabel = UILabel()
    var usernameLabel = UILabel()
    let profileImage = UIImageView();
    let editProfileButton = UIButton()
    
    let favoriteLabel = UILabel()
    let commentLabel = UILabel()
    var commentsTableView = UITableView()
    let favoriteReuseIdentifier: String = "favoriteReuseIdentifier"
    let commentsReuseIdentifier: String = "commentReuseIdentifier"
    var favorites: [String] = [] //favorite consists of imageName String 
    var comments: [Comment] = []
    let spacing: CGFloat = 10
    let atView = UILabel()
    let logoutButton = UIButton()
    
    var new_user: UserID?
    var login: LoginSession
    
    init(new_user: UserID, login: LoginSession) {
        self.new_user = new_user
        self.login = login

        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let places: Places
//    weak var delegate: viewInfo?
//    init(places: Places, delegate: viewInfo) {
//        self.places = places
//        self.delegate = delegate
//        super.init(nibName: nil, bundle: nil)
//    }
    //TODO: get user, comment, and favorites
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //TODO: initialize favorite and comments
        favorites = []
        comments = []

        nameLabel.text = new_user?.name //TODO: update
        nameLabel.font = .boldSystemFont(ofSize: 32)
        nameLabel.textColor = maroon
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        atView.text = "@"
        atView.font = .systemFont(ofSize: 20)
        atView.textColor = maroon
        atView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(atView)
        
        usernameLabel.text = new_user?.username //TODO: update
        usernameLabel.font = .systemFont(ofSize: 20)
        usernameLabel.textColor = maroon
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        profileImage.image = UIImage(named:"uris") //TODO: update
        profileImage.sizeToFit()
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 70
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        editProfileButton.setTitle("Edit Profile Image", for: .normal)
        editProfileButton.backgroundColor = maroon
        editProfileButton.layer.cornerRadius = 10
        editProfileButton.clipsToBounds = true
        editProfileButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = maroon
        logoutButton.layer.cornerRadius = 10
        logoutButton.clipsToBounds = true
        logoutButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)

        let favoritesLayout =  UICollectionViewFlowLayout()
        favoritesLayout.minimumLineSpacing = spacing
        favoritesLayout.minimumInteritemSpacing = spacing
        favoritesLayout.scrollDirection = .horizontal
        
        setUpConstraints()
        
        NetworkManager.getImage(user_id: self.new_user!.id) { otherResponse in
            let url = URL(string: otherResponse.url)
            if let data = try? Data(contentsOf: url!)
            {
                let image: UIImage = UIImage(data: data)!
                self.profileImage.image = image
            }
        }
        
        profileImage.image = UIImage()
        
    }

    
    @objc func editProfile() {
        ImagePickerManager().pickImage(self){ image in
            self.profileImage.image = image
            let strBase64 = image.pngData()!.base64EncodedString(options: .lineLength64Characters)
            
            NetworkManager.uploadImage(user_id: self.new_user!.id, image_data: strBase64) { response in
            }
        }
    }
    
    @objc func logoutAction() {
                
        NetworkManager.logout(session_token: login.session_token) {response in
            
        }
        
        navigationController?.pushViewController(LoginViewController(), animated: true)

    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameLabel.heightAnchor.constraint(equalToConstant: 39),
        ])
        
        NSLayoutConstraint.activate([
            atView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            atView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            atView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 58),
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 220),
            profileImage.heightAnchor.constraint(equalToConstant: 140),
            profileImage.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            editProfileButton.heightAnchor.constraint(equalToConstant: 24),
            editProfileButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        let collectionViewPadding = CGFloat(18)
        
    
        NSLayoutConstraint.activate([
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

