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
    let filterColor = UIColor(red: 164/255, green: 195/255, blue: 178/255, alpha: 1)
    let selected_filterColor = UIColor(red: 107/255, green: 144/255, blue: 128/255, alpha: 1)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        contentView.layer.cornerRadius = 26
        contentView.clipsToBounds = true
        
        filterButton.backgroundColor = filterColor
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
        if filters.selected == true {
            filterButton.backgroundColor = selected_filterColor
        }
        else {
            filterButton.backgroundColor = filterColor
        }
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
