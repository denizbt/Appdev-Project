//
//  DetailViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit
import DropDown
 
class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    let nameTextView = UILabel()
    let categoryTextView = UILabel()
    let crowdTextView = UILabel()
    let crowdDegreeLabel = UILabel()
    let mon = UILabel()
    let tue = UILabel()
    let wed = UILabel()
    let thu = UILabel()
    let fri = UILabel()
    let sat = UILabel()
    let sun = UILabel()
    let backButton = UIButton()
    let dropDown = DropDown()
    
    //design
    let labelCornerRadius = CGFloat(15)
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    let textFont = CGFloat(14)
    let babyBlue = CGColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 1.0)
 
    let places: Places
    weak var delegate: viewInfo?
    let location: LocationById
    let login: LoginSession
    
    init(login:LoginSession, location:LocationById, places: Places, delegate: viewInfo) {
        self.places = places
        self.delegate = delegate
        self.location = location
        self.login = login
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
        nameTextView.font = .boldSystemFont(ofSize: 16)
        nameTextView.backgroundColor = .white
        nameTextView.layer.shadowColor = UIColor.black.cgColor
        nameTextView.layer.shadowOffset = CGSize(width: -1, height: 1)
        nameTextView.layer.shadowRadius = 5
        nameTextView.layer.shadowOpacity = 1
        nameTextView.layer.masksToBounds = false
        nameTextView.textColor = maroon
        nameTextView.textAlignment = .center
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextView)
        
        categoryTextView.text = places.category
        categoryTextView.font = .boldSystemFont(ofSize: 16)
        categoryTextView.backgroundColor = .white
        categoryTextView.layer.shadowColor = UIColor.black.cgColor
        categoryTextView.layer.shadowOffset = CGSize(width: -1, height: 1)
        categoryTextView.layer.shadowRadius = 5
        categoryTextView.layer.shadowOpacity = 1
        categoryTextView.layer.masksToBounds = false
        categoryTextView.textColor = maroon
        categoryTextView.textAlignment = .center
        categoryTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTextView)
        
        let rectangle1 = CGRect(x: 33, y: 323, width: 330, height: 165)
        let view1 = UIView(frame: rectangle1)
        view1.backgroundColor = .white
        view1.layer.cornerRadius = 15
        self.view.addSubview(view1)
        
        mon.text = String(places.mon)
        mon.font = .systemFont(ofSize: textFont)
        mon.textColor = maroon
        mon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mon)
        
        tue.text = String(places.tue)
        tue.font = .systemFont(ofSize: textFont)
        tue.textColor = maroon
        tue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tue)
        
        wed.text = String(places.wed)
        wed.font = .systemFont(ofSize: textFont)
        wed.textColor = maroon
        wed.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wed)
        
        thu.text = String(places.thu)
        thu.font = .systemFont(ofSize: textFont)
        thu.textColor = maroon
        thu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thu)
        
        fri.text = String(places.fri)
        fri.font = .systemFont(ofSize: textFont)
        fri.textColor = maroon
        fri.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fri)
        
        sat.text = String(places.sat)
        sat.font = .systemFont(ofSize: textFont)
        sat.textColor = maroon
        sat.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sat)
        
        sun.text = String(places.sun)
        sun.font = .systemFont(ofSize: textFont)
        sun.textColor = maroon
        sun.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sun)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
 
        commentTableView.layer.cornerRadius = 15
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.dataSource = self
        commentTableView.register(PostTableViewCell.self, forCellReuseIdentifier: commentReuseIdentifier)
        view.addSubview(commentTableView)
        
        //TODO: replace places.crowded with crowded from backend
        crowdDegreeLabel.font = .boldSystemFont(ofSize: 20)
        crowdDegreeLabel.backgroundColor = .white
        var crowdedColor = UIColor(red: 247/255, green: 10/255, blue: 10/255, alpha: 1.0)
        var crowdedLabel = "Extremely Busy"
        if places.crowded < 1.5{
            crowdedColor = UIColor(red: 13/255, green: 189/255, blue: 42/255, alpha: 1.0)
            crowdedLabel = "Not Busy"
        }
        else if places.crowded < 3{
            crowdedColor = UIColor(red: 237/255, green: 201/255, blue: 21/255, alpha: 1.0)
            crowdedLabel = "Slightly Busy"
        }
        else if places.crowded < 4.5{
            crowdedColor = UIColor(red: 247/255, green: 117/255, blue: 10/255, alpha: 1.0)
            crowdedLabel = "Busy"
        }
        crowdDegreeLabel.textColor = crowdedColor
        crowdDegreeLabel.text = crowdedLabel
        crowdDegreeLabel.textAlignment = .center
        crowdDegreeLabel.clipsToBounds = true
        crowdDegreeLabel.layer.cornerRadius = 25
        crowdDegreeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(crowdDegreeLabel)
        
        crowdTextView.text = String(places.crowded) + "/5.0"
        crowdTextView.font = .boldSystemFont(ofSize: 18)
        crowdTextView.backgroundColor = maroon
        crowdTextView.textColor = .white
        crowdTextView.textAlignment = .center
        crowdTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(crowdTextView)
        
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
        present(CreateCommentViewController(id: login.user_id, location: location), animated: true)
    }
 
    func sortCommentData() {
        commentData.sort { comment1, comment2 in
            return comment1.timestamp > comment2.timestamp
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
            self.commentData = comments.comments
            self.sortCommentData()
            self.shownCommentData = self.commentData
            self.commentTableView.reloadData()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 244)
        ])
        
        NSLayoutConstraint.activate([
            nameTextView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            nameTextView.widthAnchor.constraint(equalToConstant: 148),
            nameTextView.heightAnchor.constraint(equalToConstant: 31),
            nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            categoryTextView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            categoryTextView.widthAnchor.constraint(equalToConstant: 104),
            categoryTextView.heightAnchor.constraint(equalToConstant: 31),
            categoryTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            crowdDegreeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 255),
            crowdDegreeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            crowdDegreeLabel.heightAnchor.constraint(equalToConstant: 50),
            crowdDegreeLabel.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            crowdTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 265),
            crowdTextView.leadingAnchor.constraint(equalTo: crowdDegreeLabel.trailingAnchor, constant: 10),
            crowdTextView.heightAnchor.constraint(equalToConstant: 40),
            crowdTextView.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            mon.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            mon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mon.heightAnchor.constraint(equalToConstant: 20),
            mon.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            tue.topAnchor.constraint(equalTo: mon.bottomAnchor, constant: 2),
            tue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tue.heightAnchor.constraint(equalToConstant: 20),
            tue.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            wed.topAnchor.constraint(equalTo: tue.bottomAnchor, constant: 2),
            wed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wed.heightAnchor.constraint(equalToConstant: 20),
            wed.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            thu.topAnchor.constraint(equalTo: wed.bottomAnchor, constant: 2),
            thu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thu.heightAnchor.constraint(equalToConstant: 20),
            thu.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            fri.topAnchor.constraint(equalTo: thu.bottomAnchor, constant: 2),
            fri.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fri.heightAnchor.constraint(equalToConstant: 20),
            fri.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            sat.topAnchor.constraint(equalTo: fri.bottomAnchor, constant: 2),
            sat.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sat.heightAnchor.constraint(equalToConstant: 20),
            sat.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            sun.topAnchor.constraint(equalTo: sat.bottomAnchor, constant: 2),
            sun.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sun.heightAnchor.constraint(equalToConstant: 20),
            sun.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: sun.bottomAnchor, constant: 35),
            commentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            commentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            commentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
        ])
        
        NSLayoutConstraint.activate([
            addCommentButton.widthAnchor.constraint(equalToConstant: 70),
            addCommentButton.heightAnchor.constraint(equalToConstant: 70),
            addCommentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addCommentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshData() {

        //TODO: #1.5 Implement Refresh
        NetworkManager.getCommentsByLocation(location_id: location.id) { comments in
            self.commentData = comments.comments
            self.sortCommentData()
            self.shownCommentData = self.commentData + comments.comments
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

//extension DetailViewController: CreateCommentDelegate {
//
//    func createComment(location_id: Int, user_id: Int, number: Int, text: String, latitude: Double, longitude: Double) {
//
//        //TODO: #1 Create Post
//        NetworkManager.createComment(location_id: location_id, user_id: user_id, number: number, text: text, latitude: latitude, longitude: longitude){ comment in
//            self.shownCommentData = self.shownCommentData
//            self.commentTableView.reloadData()
//        }
//    }
//}


