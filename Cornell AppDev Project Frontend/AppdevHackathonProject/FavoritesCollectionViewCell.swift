//
//  FavoritesCollectionViewCell.swift
//  AppdevHackathonProject
//
//  Created by Jenny Chen on 12/1/22.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    let favoriteImg = UIImageView()
    
    //design
    let selected_filterColor = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        
        contentView.layer.cornerRadius = 2
        contentView.clipsToBounds = true
        favoriteImg.sizeToFit()
        favoriteImg.clipsToBounds = true
        favoriteImg.layer.cornerRadius = 41.5
        favoriteImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteImg)
        
        setUpConstraints()
        
    }
    

    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            favoriteImg.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            favoriteImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            favoriteImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
    
    
    func configure(favorite: String) {
        favoriteImg.image = UIImage(named: favorite)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
