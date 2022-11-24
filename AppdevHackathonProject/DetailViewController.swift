//
//  DetailViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit
 
class DetailViewController: UIViewController {
    let imageView = UIImageView()
    let nameTextView = UITextView()
    let categoryTextView = UITextView()
    let crowdTextView = UITextView()
    let hoursTextView = UITextView()
    let backButton = UIButton()
 
    let places: Places
    weak var delegate: viewInfo?
    init(places: Places, delegate: viewInfo) {
        self.places = places
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
 
        imageView.image = UIImage(named:places.imageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        nameTextView.text = places.name
        nameTextView.font = .systemFont(ofSize: 20)
        nameTextView.backgroundColor = .systemGray3
        nameTextView.layer.cornerRadius = 5
        nameTextView.clipsToBounds = true
        nameTextView.textAlignment = .center
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextView)
        
        categoryTextView.text = places.category
        categoryTextView.font = .systemFont(ofSize: 20)
        categoryTextView.backgroundColor = .systemGray3
        categoryTextView.layer.cornerRadius = 5
        categoryTextView.clipsToBounds = true
        categoryTextView.textAlignment = .center
        categoryTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTextView)
        
        crowdTextView.text = String(places.crowded)
        crowdTextView.font = .systemFont(ofSize: 20)
        crowdTextView.backgroundColor = .systemGray3
        crowdTextView.layer.cornerRadius = 5
        crowdTextView.clipsToBounds = true
        crowdTextView.textAlignment = .center
        crowdTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(crowdTextView)
        
        hoursTextView.text = places.hours
        hoursTextView.font = .systemFont(ofSize: 20)
        hoursTextView.backgroundColor = .systemGray3
        hoursTextView.layer.cornerRadius = 5
        hoursTextView.clipsToBounds = true
        hoursTextView.textAlignment = .center
        hoursTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hoursTextView)
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.systemGreen, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
 
        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            nameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            categoryTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 10),
            categoryTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            crowdTextView.topAnchor.constraint(equalTo: categoryTextView.bottomAnchor, constant: 10),
            crowdTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crowdTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
        
        NSLayoutConstraint.activate([
            hoursTextView.topAnchor.constraint(equalTo: crowdTextView.bottomAnchor, constant: 10),
            hoursTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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

