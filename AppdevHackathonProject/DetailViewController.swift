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
 
    let places: Places
    weak var delegate: viewInfo?
    init(places: Places, delegate: viewInfo) {
        self.places = places
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
 
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
        
        hoursTextView.text = places.hours
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
 
        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true)
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
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol viewInfo: UICollectionViewCell{
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

