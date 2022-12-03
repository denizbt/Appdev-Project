//
//  CreateCommentViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import UIKit
import CoreLocation
import DropDown

class CreateCommentViewController: UIViewController {

    let headerLabel = UILabel()
    let textTextView = UITextView()
    let titleTextView = UITextView()
    let userIdTextField = UITextField()
    let saveButton = UIButton()
    let dropButton = UIButton()
    let dropDown = DropDown()
    var latitude: Double?
    var longitude: Double?
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)

    var location:LocationById?
    var id: Int?

    init(id: Int, location: LocationById) {
        self.location = location
        self.id = id

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = maroon

        headerLabel.text = "Add Comment"
        headerLabel.font = .boldSystemFont(ofSize: 20)
        headerLabel.textColor = .white
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 20)
        view.addSubview(headerLabel)
        
        textTextView.text = "Insert Body"
        textTextView.translatesAutoresizingMaskIntoConstraints = false
        textTextView.clipsToBounds = true
        textTextView.layer.cornerRadius = 5
        textTextView.backgroundColor = .white
        textTextView.font = .systemFont(ofSize: 15)
        view.addSubview(textTextView)
        
        dropDown.anchorView = dropButton
        dropDown.dataSource = ["1","2","3","4","5"]
        dropDown.backgroundColor = .white
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            dropButton.setTitle(item + "/5", for: .normal)
        }
        view.addSubview(dropDown)

        dropButton.setTitle("Rate Busyness", for: .normal)
        dropButton.translatesAutoresizingMaskIntoConstraints = false
        dropButton.setTitleColor(maroon, for: .normal)
        dropButton.backgroundColor = .white
        dropButton.layer.cornerRadius = 15
        dropButton.addTarget(self, action: #selector(showList), for: .touchUpInside)
        view.addSubview(dropButton)

        saveButton.setTitle("Post", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .white
        saveButton.setTitleColor(maroon, for: .normal)
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }
    
    @objc func saveAction() {
        //alert message if no rating
        let ratingTitle=String(dropButton.currentTitle!)
        
        if(ratingTitle == "Rate Busyness"){
            let invalidInputAlert = UIAlertController(title: "No Rating", message: "Please submit a busyness rating", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should submit rating")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else{
            let rating = ratingTitle.prefix(1)
            //TODO: send rating to backend
            let new_rating: Int? = Int(rating)
            
            print(rating)
            
            LocationManager.shared.getUserLocation { location in
                self.latitude = location.coordinate.latitude
                self.longitude = location.coordinate.longitude
            }
            
            let text = textTextView.text!
            
            
            if let new_id = id {
                if let location_id = location?.id {
                    NetworkManager.createComment(location_id: location_id ,user_id: new_id, number: new_rating!, text: text, latitude: latitude ?? 0, longitude: longitude ?? 0) { response in
                        
                    }
                }
                
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    @objc func showList() {
        dropDown.show()
    }

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            textTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            textTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            textTextView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            dropButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropButton.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 20),
            dropButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

}
