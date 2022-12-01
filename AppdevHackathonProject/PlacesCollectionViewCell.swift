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
    
    //design
    let textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.backgroundColor = maroon
 
        placesImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesImageView)
        
        placesName.font = .systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 600))
        placesName.textColor = .white
        placesName.textAlignment = .center
        placesName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesName)
        
        placesCategory.font = .systemFont(ofSize: 16, weight: .medium)
        placesCategory.textColor = .white
        placesCategory.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesCategory)
        
        placesCrowd.font = .systemFont(ofSize: 16, weight: .medium)
        placesCrowd.textColor = .white
        placesCrowd.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placesCrowd)
 
        setupConstraints()
    }
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            placesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            placesImageView.heightAnchor.constraint(equalToConstant: 85),
            placesImageView.widthAnchor.constraint(equalToConstant: 168),
        ])
        
        NSLayoutConstraint.activate([
            placesName.topAnchor.constraint(equalTo: placesImageView.bottomAnchor, constant: 9),
            placesName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
        ])
        
        NSLayoutConstraint.activate([
            placesCategory.topAnchor.constraint(equalTo: placesName.bottomAnchor, constant: 5),
            placesCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
        ])
        
        NSLayoutConstraint.activate([
            placesCrowd.topAnchor.constraint(equalTo: placesCategory.bottomAnchor),
            placesCrowd.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
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
