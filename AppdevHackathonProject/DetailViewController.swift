//
//  DetailViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit
 
class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    let nameTextView = UILabel()
    let categoryTextView = UILabel()
    let crowdTextView = UILabel()
    let hoursTextView = UILabel()
    let backButton = UIButton()
    
    //design
    let labelCornerRadius = CGFloat(15)
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    let textFont = CGFloat(16)
    let babyBlue = CGColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
 
    let places: Places
    weak var delegate: viewInfo?
    init(places: Places, delegate: viewInfo) {
        self.places = places
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
 
    //comments
    let commentTableView = UITableView()
    let addCommentButton = UIButton()
    let commentReuseIdentifier = "commentReuseIdentifier"
    
    let refreshControl = UIRefreshControl()
    
    //Data
    var commentData: [Comment] = []
    var shownCommentData: [Comment] = []
    
    //favorites
    let favoritesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = maroon
 
        imageView.image = UIImage(named:places.imageName)
        imageView.sizeToFit()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //add star
        //TODO: ADD STAR FOR FAVORITE
        favoritesButton.addTarget(self, action: #selector(favorite), for: .touchUpInside)
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoritesButton)
        
        nameTextView.text = places.name
        nameTextView.font = .systemFont(ofSize: textFont)
        nameTextView.backgroundColor = .white
        nameTextView.textColor = maroon
        nameTextView.layer.cornerRadius = labelCornerRadius
        nameTextView.clipsToBounds = true
        nameTextView.textAlignment = .center
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextView)
        
        categoryTextView.text = places.category
        categoryTextView.font = .systemFont(ofSize: textFont)
        categoryTextView.backgroundColor = .white
        categoryTextView.textColor = maroon
        categoryTextView.layer.cornerRadius = labelCornerRadius
        categoryTextView.clipsToBounds = true
        categoryTextView.textAlignment = .center
        categoryTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTextView)
        
        crowdTextView.text = String(places.crowded)
        crowdTextView.font = .systemFont(ofSize: textFont)
        crowdTextView.backgroundColor = .white
        crowdTextView.textColor = maroon
        crowdTextView.layer.cornerRadius = labelCornerRadius
        crowdTextView.clipsToBounds = true
        crowdTextView.textAlignment = .center
        crowdTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(crowdTextView)
        
        // hoursTextView.text = places.hours
        hoursTextView.font = .systemFont(ofSize: textFont)
        hoursTextView.backgroundColor = .white
        hoursTextView.textColor = maroon
        hoursTextView.layer.cornerRadius = labelCornerRadius
        hoursTextView.clipsToBounds = true
        hoursTextView.textAlignment = .center
        hoursTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hoursTextView)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: textFont, weight: .bold)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
 
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.dataSource = self
        commentTableView.register(PostTableViewCell.self, forCellReuseIdentifier: commentReuseIdentifier)
        view.addSubview(commentTableView)
        
        addCommentButton.setBackgroundImage(UIImage(named: "comment"), for: .normal)
        addCommentButton.layer.cornerRadius = 20
        addCommentButton.clipsToBounds = true
        addCommentButton.addTarget(self, action: #selector(pushCreateView), for: .touchUpInside)
        addCommentButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCommentButton)

        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            commentTableView.refreshControl = refreshControl
        } else {
            commentTableView.addSubview(refreshControl)
        }
        
        createDummyData()

        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
    
    @objc func favorite() {
        
    }
    
    @objc func pushCreateView() {
        present(CreateCommentViewController(delegate: self), animated: true)
    }
 
    func sortCommentData() {
        commentData.sort { comment1, comment2 in
            return comment1.timeStamp > comment2.timeStamp
        }
    }
    
    func createDummyData() {
        // MARK: Use getAllPosts
        /**
         We want to retrieve data from the server here upon refresh. Make sure to
         1) Sort the posts with `sortPostData`
         2) Update `postData` & `shownPostData` and reload `postTableView`
         */

        NetworkManager.getCommentsByLocation(location_id: self.places.id) { comments in
            self.commentData = comments
            self.sortCommentData()
            self.shownCommentData = self.commentData
            self.commentTableView.reloadData()
        }
    }
    
    func setupConstraints() {
        let spacing = CGFloat(20)
        let labelHeight = CGFloat(30)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            nameTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 274),
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextView.widthAnchor.constraint(equalToConstant: 148),
            nameTextView.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            categoryTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: spacing),
            categoryTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTextView.widthAnchor.constraint(equalToConstant: 104),
            categoryTextView.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            crowdTextView.topAnchor.constraint(equalTo: categoryTextView.bottomAnchor, constant: spacing),
            crowdTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crowdTextView.heightAnchor.constraint(equalToConstant: labelHeight),
            crowdTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            hoursTextView.topAnchor.constraint(equalTo: crowdTextView.bottomAnchor, constant: spacing),
            hoursTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hoursTextView.heightAnchor.constraint(equalToConstant: labelHeight),
            hoursTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: hoursTextView.bottomAnchor, constant: 10),
            commentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            addCommentButton.widthAnchor.constraint(equalToConstant: 70),
            addCommentButton.heightAnchor.constraint(equalToConstant: 70),
            addCommentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addCommentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
        ])
        
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshData() {

        //TODO: #1.5 Implement Refresh
        NetworkManager.getCommentsByLocation(location_id: self.places.id) { comments in
            self.commentData = comments
            self.sortCommentData()
            self.shownCommentData = self.commentData
            self.commentTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
        
        NetworkManager.getCommentsByLocation(location_id: self.places.id) { comments in
            self.commentData = comments
            self.sortCommentData()
            self.shownCommentData = self.commentData
            self.commentTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

protocol viewInfo: UICollectionViewCell{
    
}

extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCommentData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentReuseIdentifier, for: indexPath) as! PostTableViewCell
        let commentObject = shownCommentData[indexPath.row]
        cell.configure(commentObject: commentObject)
        return cell
    }
}

extension DetailViewController: CreateCommentDelegate {

    func createComment(title: String, body: String, poster: String) {

        //TODO: #1 Create Post
        NetworkManager.createComment(title: title, body: body, poster: poster) { comment in
            self.shownCommentData = [comment] + self.shownCommentData
            self.commentTableView.reloadData()
        }
    }
    
}

