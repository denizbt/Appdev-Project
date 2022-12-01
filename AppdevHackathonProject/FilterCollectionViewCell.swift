//
//  FilterCollectionViewCell.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterButton = UILabel()
    
    //design
    let selected_filterColor = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        
        filterButton.font = .systemFont(ofSize: 16, weight: .semibold)
        filterButton.backgroundColor = .white
        filterButton.contentMode = .scaleAspectFit
        filterButton.textAlignment = .center
        filterButton.translatesAutoresizingMaskIntoConstraints = false
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
        filterButton.sizeToFit()
        if filters.selected == true {
            filterButton.backgroundColor = selected_filterColor
            filterButton.textColor = .white
        }
        else {
            filterButton.backgroundColor = .systemGray6
            filterButton.textColor = selected_filterColor
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
