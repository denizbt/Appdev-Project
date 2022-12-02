//
//  RecentCommentTableViewCell.swift
//  AppdevHackathonProject
//
//  Created by Jenny Chen on 12/1/22.
//

import UIKit

class RecentCommentTableViewCell: UITableViewCell {

    let locationLabel = UILabel();
    let commentLabel = UILabel();
    let timeLabel = UILabel();
    let stackView = UIStackView()
    
    //design
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpViews()
        setUpConstraints()
    }
    

    func setUpViews() {
        locationLabel.textAlignment = .left
        locationLabel.font = .boldSystemFont(ofSize: 16)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        commentLabel.font = UIFont.systemFont(ofSize: 14)
        commentLabel.numberOfLines = 0
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .systemGray
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical

        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(commentLabel)
        stackView.addArrangedSubview(timeLabel)
        contentView.addSubview(stackView)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
    func configure(commentObject: Comment) {
        locationLabel.text = String(commentObject.location_id) //TODO: get location
        commentLabel.text = commentObject.text

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        let time_stamp = dateFormatter.date(from: commentObject.time_stamp)!

        let coolDateFormatter = DateFormatter()
        coolDateFormatter.dateFormat = "MMM d, h:mm a"
        let coolDateString = coolDateFormatter.string(from: time_stamp)
        timeLabel.text = "\(coolDateString)"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
