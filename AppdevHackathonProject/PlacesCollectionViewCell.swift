//
//  PlacesCollectionViewCell.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit
 
class PlacesCollectionViewCell: UICollectionViewCell {
    var placesImageView = UIImageView()
    var placesName = UILabel()
    var placesCategory = UILabel()
    var placesCrowd = UILabel()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 182.0/255, green: 166.0/255, blue: 202.0/255, alpha: 1.0)
 
        placesImageView.contentMode = .scaleAspectFit
        placesImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesImageView)
        
        placesName.font = UIFont.boldSystemFont(ofSize: 18)
        placesName.textColor = .white
        placesName.textAlignment = .center
        placesName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesName)
        
        placesCategory.textColor = .white
        placesCategory.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesCategory)
        
        placesCrowd.textColor = .white
        placesCrowd.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesCrowd)
 
        setupConstraints()
    }
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            placesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            placesImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            placesName.topAnchor.constraint(equalTo: placesImageView.bottomAnchor, constant: 10),
            placesName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            placesName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            placesCategory.topAnchor.constraint(equalTo: placesName.bottomAnchor,constant: 5),
            placesCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            placesCrowd.topAnchor.constraint(equalTo: placesCategory.bottomAnchor, constant: 5),
            placesCrowd.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
    }
 
    func configure(places: Places) {
        placesImageView.image = UIImage(named: places.imageName)
        placesName.text = places.name
        placesCategory.text = places.category
        placesCrowd.text = String(places.crowded)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PlacesCollectionViewCell: viewInfo{
    
}
