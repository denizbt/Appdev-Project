//
//  FilterCollectionViewCell.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterButton = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 30
        contentView.clipsToBounds = true
        filterButton.backgroundColor = .systemBlue
        filterButton.contentMode = .scaleAspectFit
        filterButton.textAlignment = .center
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.layer.cornerRadius = 15
        contentView.addSubview(filterButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            filterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
    
    func configure(filters: Filter) {
        filterButton.text = filters.filterName
        if filters.selected == true {
            filterButton.backgroundColor = .systemGreen
        }
        else {
            filterButton.backgroundColor = .systemBlue
        }
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
