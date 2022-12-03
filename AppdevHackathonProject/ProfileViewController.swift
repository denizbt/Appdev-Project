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
    var favoritesCollectionView: UICollectionView!
    var commentsTableView = UITableView()
    let favoriteReuseIdentifier: String = "favoriteReuseIdentifier"
    let commentsReuseIdentifier: String = "commentReuseIdentifier"
    var favorites: [String] = [] //favorite consists of imageName String 
    var comments: [Comment] = []
    let spacing: CGFloat = 10
    let atView = UILabel()
    
    var new_user: UserID?
    
    init(new_user: UserID) {
        self.new_user = new_user
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
        profileImage.layer.cornerRadius = 41.5
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
//        editProfileButton.setBackgroundImage(UIImage(named: "comment"), for: .normal)
        editProfileButton.setTitle("Edit Profile Image", for: .normal)
        editProfileButton.backgroundColor = .systemRed
        editProfileButton.layer.cornerRadius = 10
        editProfileButton.clipsToBounds = true
        editProfileButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)

        let favoritesLayout =  UICollectionViewFlowLayout()
        favoritesLayout.minimumLineSpacing = spacing
        favoritesLayout.minimumInteritemSpacing = spacing
        favoritesLayout.scrollDirection = .horizontal
        
        favoritesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: favoritesLayout)
        favoritesCollectionView.backgroundColor = maroon
        favoritesCollectionView.clipsToBounds = true
        favoritesCollectionView.layer.cornerRadius = 15
        favoritesCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: favoriteReuseIdentifier)
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        view.addSubview(favoritesCollectionView)
        
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.backgroundColor = maroon
        commentsTableView.clipsToBounds = true
        commentsTableView.layer.cornerRadius = 15
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        commentsTableView.register(RecentCommentTableViewCell.self, forCellReuseIdentifier: commentsReuseIdentifier)
        view.addSubview(commentsTableView)
        
        favoriteLabel.text = "Favorites"
        favoriteLabel.font = .boldSystemFont(ofSize: 20)
        favoriteLabel.textColor = .black
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoriteLabel)
        
        commentLabel.text = "Your Recent Comments"
        commentLabel.font = .boldSystemFont(ofSize: 20)
        commentLabel.textColor = .black
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentLabel)
        
        setUpConstraints()
    }
    
    @objc func editProfile() {
        ImagePickerManager().pickImage(self){ image in
            self.profileImage.image = image
            NetworkManager.uploadImage(user_id: self.new_user!.id, image_data: image.pngData()!) { response in
                
            }
        }
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
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 273),
            profileImage.heightAnchor.constraint(equalToConstant: 83),
            profileImage.widthAnchor.constraint(equalToConstant: 83)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 4),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            editProfileButton.heightAnchor.constraint(equalToConstant: 24),
            editProfileButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        let collectionViewPadding = CGFloat(18)
        NSLayoutConstraint.activate([
            favoriteLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 50),
            favoriteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCollectionView.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            favoritesCollectionView.heightAnchor.constraint(equalToConstant: 150),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: favoritesCollectionView.bottomAnchor, constant: 50),
            commentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            commentsTableView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor),
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            commentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
            commentsTableView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favoriteCell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: favoriteReuseIdentifier, for: indexPath) as! FavoritesCollectionViewCell
        favoriteCell.configure(favorite: favorites[indexPath.row])
        return favoriteCell
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    //get appropiate song from the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = commentsTableView.dequeueReusableCell(withIdentifier: commentsReuseIdentifier, for: indexPath) as? RecentCommentTableViewCell{
            cell.configure(commentObject: comments[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell();
        }
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 31)
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    //no need to present details yet
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ProfileViewController: UITableViewDelegate {
    //no need to present details yet
    func tableView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
