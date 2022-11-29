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
    let labelCornerRadius = CGFloat(10)
    let viewBGcolor = UIColor(red: 204.0/255, green: 227.0/255, blue: 222.0/255, alpha: 1.0)
    let textBGcolor = UIColor(red: 234.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1.0)
    let textColor = UIColor(red: 107.0/255, green: 144.0/255, blue: 128.0/255, alpha: 1.0)
    let textFont = CGFloat(20)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewBGcolor
 
        imageView.image = UIImage(named:places.imageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        nameTextView.text = places.name
        nameTextView.font = .systemFont(ofSize: textFont)
        nameTextView.backgroundColor = textBGcolor
        nameTextView.textColor = textColor
        nameTextView.layer.cornerRadius = labelCornerRadius
        nameTextView.clipsToBounds = true
        nameTextView.textAlignment = .center
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextView)
        
        categoryTextView.text = places.category
        categoryTextView.font = .systemFont(ofSize: textFont)
        categoryTextView.backgroundColor = textBGcolor
        categoryTextView.textColor = textColor
        categoryTextView.layer.cornerRadius = labelCornerRadius
        categoryTextView.clipsToBounds = true
        categoryTextView.textAlignment = .center
        categoryTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTextView)
        
        crowdTextView.text = String(places.crowded)
        crowdTextView.font = .systemFont(ofSize: textFont)
        crowdTextView.backgroundColor = textBGcolor
        crowdTextView.textColor = textColor
        crowdTextView.layer.cornerRadius = labelCornerRadius
        crowdTextView.clipsToBounds = true
        crowdTextView.textAlignment = .center
        crowdTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(crowdTextView)
        
       // hoursTextView.text = places.hours
        hoursTextView.font = .systemFont(ofSize: textFont)
        hoursTextView.backgroundColor = textBGcolor
        hoursTextView.textColor = textColor
        hoursTextView.layer.cornerRadius = labelCornerRadius
        hoursTextView.clipsToBounds = true
        hoursTextView.textAlignment = .center
        hoursTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hoursTextView)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(textColor, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: textFont, weight: .bold)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
 
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.register(PostTableViewCell.self, forCellReuseIdentifier: commentReuseIdentifier)
        view.addSubview(commentTableView)
        
        addCommentButton.setBackgroundImage(UIImage(named: "comment"), for: .normal)
        addCommentButton.layer.cornerRadius = 20
        addCommentButton.layer.borderWidth = 4
        addCommentButton.clipsToBounds = true
        addCommentButton.layer.borderColor = babyBlue
        addCommentButton.addTarget(self, action: #selector(pushCreateView), for: .touchUpInside)
        addCommentButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCommentButton)

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
 
    func sortPostData() {
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

        NetworkManager.getAllPosts { comments in
            self.commentData = comments
            self.sortPostData()
            self.shownCommentData = self.commentData
            self.commentTableView.reloadData()
        }
    }
    func setupConstraints() {
        let spacing = CGFloat(20)
        let labelHeight = CGFloat(30)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            nameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextView.heightAnchor.constraint(equalToConstant: labelHeight),
            nameTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            categoryTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: spacing),
            categoryTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTextView.heightAnchor.constraint(equalToConstant: labelHeight),
            categoryTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
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
    }

    @objc func pushCreateView() {
        navigationController?.pushViewController(CreateCommentViewController(delegate: self), animated: true)
    }
    
}

protocol viewInfo: UICollectionViewCell{
    
}
    
extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = commentTableView.cellForRow(at: indexPath) as! PostTableViewCell
        let editVC = EditDetailViewController(comment: shownCommentData[indexPath.row], delegate: cell)
        editVC.title = "My Title"
        
        present(editVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            let deletedComment = shownCommentData[indexPath.row]
            shownCommentData.remove(at: indexPath.row)
            commentTableView.deleteRows(at: [indexPath], with: .fade)

            //TODO: #2 Delete Post
        }
    }
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

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension DetailViewController: CreatePostDelegate {

    func createPost(title: String, body: String, poster: String) {

        //TODO: #1 Create Post

    }
    
}


