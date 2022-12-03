//
//  PostTableViewCell.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    let profileImageView = UIImageView()
    let posterImageView = UIImageView()
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let posterLabel = UILabel()
    let timestampLabel = UILabel()
    
    let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel.font = UIFont.systemFont(ofSize: 15)
        bodyLabel.numberOfLines = 0
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        posterLabel.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
        posterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timestampLabel.font = UIFont.systemFont(ofSize: 10)
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)
        stackView.addArrangedSubview(posterLabel)
        stackView.addArrangedSubview(timestampLabel)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        let profileImageDim: CGFloat = 50
        let verticalPadding: CGFloat = 20.0
        let sidePadding: CGFloat = 20.0

        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageDim),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageDim)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(commentObject: Comment) {
        bodyLabel.text = commentObject.text
        posterLabel.text = String(commentObject.user_id)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
//        print(commentObject.timestamp)
//        print( dateFormatter.date(from: commentObject.timestamp))
        let timestamp = dateFormatter.date(from: commentObject.timestamp)

        let coolDateFormatter = DateFormatter()
        coolDateFormatter.dateFormat = "MMM d, h:mm a"
        let coolDateString = coolDateFormatter.string(from: timestamp ?? Date())
        timestampLabel.text = "\(coolDateString)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//extension PostTableViewCell: ChangeCommentInfoDelegate {
//
//    func changeCellInfo(comment: Comment) {
//        titleLabel.text = comment.title
//        bodyLabel.text = comment.body
//    }
//
//}
