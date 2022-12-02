//
//  ViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let all = Filter(filterName: "All", selected: false)
    let diningHalls = Filter(filterName: "Dining Halls", selected: false)
    let libraries = Filter(filterName: "Libraries", selected: false)
    let cafes = Filter(filterName: "Cafés", selected: false)
    let foodCourts = Filter(filterName: "Food Courts", selected: false)
    let serviceCenters = Filter(filterName: "Service Centers", selected: false)
    
    var user: UserID?
    var login: LoginSession
    
    init(login: LoginSession, user: UserID) {
        self.user = user
        self.login = login
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Dining Halls
    let morrison = Places(imageName: "morrison", name: "Morrison Dining", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 4:30pm , 5:00pm - 8:30pm", tue: "7:00am - 4:30pm , 5:00pm - 8:30pm", wed: "7:00am - 4:30pm , 5:00pm - 8:30pm", thu: "7:00am - 4:30pm , 5:00pm - 8:30pm", fri: "7:00am - 4:30pm , 5:00pm - 8:30pm", sat: "8:00am - 4:30pm , 5:00pm - 8:30pm", sun: "10:00am - 2:00pm , 5:00pm - 8:30pm", id: 1)
    
    let northStar = Places(imageName: "northStar", name: "North Star", category: "Dining Hall", crowded: 0.0, mon: "5:00pm - 9:00pm", tue: "5:00pm - 9:00pm", wed: "5:00pm - 9:00pm", thu: "5:00pm - 9:00pm", fri: "5:00pm - 9:00pm", sat: "10:30am - 2:30pm , 5:00pm - 9:00pm", sun: "10:00am - 2:00pm , 5:00pm - 9:00pm", id: 2)
    
    let risley = Places(imageName: "risley", name: "Risley", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:00pm , 4:30pm - 9:00pm", tue: "11:00am - 2:00pm , 4:30pm - 9:00pm", wed: "11:00am - 2:00pm , 4:30pm - 9:00pm", thu: "11:00am - 2:00pm , 4:30pm - 9:00pm", fri: "11:00am - 2:00pm , 4:30pm - 9:00pm", sat: "Closed", sun: "Closed", id: 3)
    
    let okenshields = Places(imageName: "okenshields", name: "Okenshields", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:30pm , 5:00pm - 8:30pm", tue: "7:00am - 4:30pm , 5:00pm - 8:30pm", wed: "7:00am - 4:30pm , 5:00pm - 8:30pm", thu: "7:00am - 4:30pm , 5:00pm - 8:30pm", fri: "7:00am - 4:30pm , 5:00pm - 8:30pm", sat: "Closed", sun: "Closed", id: 4)
    
    let becker = Places(imageName: "becker", name: "Becker House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 3:30pm , 5:00pm - 8:00pm", tue: "7:00am - 3:30pm , 5:00pm - 8:00pm", wed: "7:00am - 2:00pm , 6:00pm - 8:00pm", thu: "7:00am - 3:30pm , 5:00pm - 8:00pm", fri: "7:00am - 3:30pm , 5:00pm - 8:00pm", sat: "10:30am - 2:00pm , 5:00pm - 8:00pm", sun: "10:00am - 2:00pm , 5:00pm - 8:00pm", id: 5)
    
    let cook = Places(imageName: "cook", name: "Cook House", category: "Dining Hall", crowded: 0.0, mon: "7:30am - 10:00am , 5:00pm - 9:00pm", tue: "7:30am - 10:00am , 5:00pm - 9:00pm", wed: "7:30am - 10:00am , 6:00pm - 9:00pm", thu: "7:30am - 10:00am , 5:00pm - 9:00pm", fri: "7:30am - 10:00am , 5:00pm - 9:00pm", sat: "10:30am - 2:00pm , 5:00pm - 9:00pm", sun: "10:00am - 2:00pm , 5:00pm - 9:00pm", id: 6)
    
    let bethe = Places(imageName: "bethe", name: "Bethe House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 2:00pm , 4:30pm - 7:30pm", tue: "7:00am - 2:00pm , 4:30pm - 7:30pm", wed: "7:00am - 2:00pm , 6:00pm - 7:30pm", thu: "7:00am - 2:00pm , 4:30pm - 7:30pm", fri: "7:00am - 2:00pm , 4:30pm - 7:30pm", sat: "10:30am - 2:00pm , 4:30pm - 7:30pm", sun: "10:00am - 2:00pm , 4:30pm - 7:30pm", id: 7)
    
    let keeton = Places(imageName: "keeton", name: "Keeton House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 10:00am , 5:00pm - 8:00pm", tue: "7:00am - 10:00am , 5:00pm - 8:00pm", wed: "7:00am - 10:00am , 6:00pm - 8:00pm", thu: "7:00am - 10:00am , 5:00pm - 8:00pm", fri: "7:00am - 10:00am , 5:00pm - 8:00pm", sat: "10:30am - 2:00pm , 5:00pm - 8:00pm", sun: "10:00am - 2:00pm , 5:00pm - 8:00pm", id: 8)
    
    let rose = Places(imageName: "rose", name: "Rose House", category: "Dining Hall", crowded: 0.0, mon: "7:30am - 10:00am , 5:00pm - 8:00pm", tue: "7:30am - 10:00am , 5:00pm - 8:00pm", wed: "7:30am - 10:00am , 6:00pm - 8:00pm", thu: "7:30am - 10:00am , 5:00pm - 8:00pm", fri: "7:30am - 10:00am , 5:00pm - 8:00pm", sat: "8:00am - 2:00pm , 5:00pm - 8:00pm", sun: "8:00am - 2:00pm , 5:00pm - 8:00pm", id: 9)
    
    let west = Places(imageName: "104west", name: "104West!", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:00pm , 5:00pm - 7:00pm", tue: "11:00am - 2:00pm , 5:00pm - 7:00pm", wed: "11:00am - 2:00pm , 5:00pm - 7:00pm", thu: "11:00am - 2:00pm , 5:00pm - 7:00pm", fri: "11:00am - 2:00pm , 5:00pm - 7:00pm", sat: "12:30pm - 2:00pm , 4:20pm - 5:20pm", sun: "11:00am - 2:00pm , 5:00pm - 7:00pm", id: 10)
    
    
    // Libraries
    let adelson = Places(imageName: "adelson", name: "Adelson Library", category: "Library", crowded: 0.0, mon: "10:00am - 5:00pm", tue: "10:00am - 5:00pm", wed: "10:00am - 5:00pm", thu: "10:00am - 5:00pm", fri: "10:00am - 5:00pm", sat: "10:00am - 5:00pm", sun: "10:00am - 5:00pm", id: 11)
    
    let ilr = Places(imageName: "ilr", name: "ILR Library", category: "Library", crowded: 0.0, mon: "8:00am - 8:00pm", tue: "8:00am - 8:00pm", wed: "8:00am - 8:00pm", thu: "8:00am - 8:00pm", fri: "8:00am - 5:00pm", sat: "Closed", sun: "Closed", id: 12)
    
    let physicalSciences = Places(imageName: "physicalSciences", name: "Physical Sciences Library", category: "Library", crowded: 0.0, mon: "Open 24 Hours", tue: "Open 24 Hours", wed: "Open 24 Hours", thu: "Open 24 Hours", fri: "Open 24 Hours", sat: "Open 24 Hours", sun: "Open 24 Hours", id: 13)
    
    let engineering = Places(imageName: "engineering", name: "Engineering Library", category: "Library", crowded: 0.0, mon: "Open 24 Hours", tue: "Open 24 Hours", wed: "Open 24 Hours", thu: "Open 24 Hours", fri: "Open 24 Hours", sat: "Open 24 Hours", sun: "Open 24 Hours", id: 14)
    
    let vet = Places(imageName: "vet", name: "Veterinary Library", category: "Library", crowded: 0.0, mon: "7:30am - 10:00pm", tue: "7:30am - 10:00pm", wed: "7:30am - 10:00pm", thu: "7:30am - 10:00pm", fri: "7:30am - 8:00pm", sat: "10:00am - 8:00pm", sun: "12:00pm - 10:00pm", id: 15)
    
    let africana = Places(imageName: "africana", name: "Africana Library", category: "Library", crowded: 0.0, mon: "9:00am - 9:00pm", tue: "9:00am - 9:00pm", wed: "9:00am - 9:00pm", thu: "9:00am - 9:00pm", fri: "9:00am - 5:00pm", sat: "Closed", sun: "Closed", id: 16)
    
    let olin = Places(imageName: "olin", name: "Olin Library", category: "Library", crowded: 0.0, mon: "8:00am - 12:00am", tue: "8:00am - 12:00am", wed: "8:00am - 12:00am", thu: "8:00am - 12:00am", fri: "8:00am - 6:00pm", sat: "10:00am - 6:00pm", sun: "10:00am - 12:00am", id: 17)
    
    let kroch = Places(imageName: "kroch", name: "Kroch Library", category: "Library", crowded: 0.0, mon: "8:00am - 12:00am", tue: "8:00am - 12:00am", wed: "8:00am - 12:00am", thu: "8:00am - 12:00am", fri: "8:00am - 6:00pm", sat: "10:00am - 6:00pm", sun: "10:00am - 12:00am", id: 18)
    
    let law = Places(imageName: "law", name: "Law Library", category: "Library", crowded: 0.0, mon: "8:00am - 8:00pm", tue: "8:00am - 8:00pm", wed: "8:00am - 8:00pm", thu: "8:00am - 8:00pm", fri: "8:00am - 5:00pm", sat: "11:00am - 5:00pm", sun: "12:00pm - 8:00pm", id: 19)

    let management = Places(imageName: "management", name: "Management Library", category: "Library", crowded: 0.0, mon: "7:00am - 8:00pm", tue: "7:00am - 8:00pm", wed: "7:00am - 8:00pm", thu: "7:00am - 8:00pm", fri: "7:00am - 8:00pm", sat: "7:00am - 5:00pm", sun: "7:00am - 5:00pm", id: 20)

    let mann = Places(imageName: "mann", name: "Mann Library", category: "Library", crowded: 0.0, mon: "8:00am - 10:00pm", tue: "8:00am - 10:00pm", wed: "8:00am - 10:00pm", thu: "8:00am - 10:00pm", fri: "8:00am - 6:00pm", sat: "12:00pm - 6:00pm", sun: "12:00pm - 6:00pm", id: 21)
    
    let math = Places(imageName: "math", name: "Math Library", category: "Library", crowded: 0.0, mon: "9:00am - 8:00pm", tue: "9:00am - 8:00pm", wed: "9:00am - 8:00pm", thu: "9:00am - 8:00pm", fri: "9:00am - 5:00pm", sat: "Closed", sun: "12:00pm - 8:00pm", id: 22)
    
    let arts = Places(imageName: "arts", name: "Fine Arts Library", category: "Library", crowded: 0.0, mon: "9:00am - 10:00pm", tue: "9:00am - 10:00pm", wed: "9:00am - 10:00pm", thu: "9:00am - 10:00pm", fri: "9:00am - 5:00pm", sat: "12:00pm - 5:00pm", sun: "Closed", id: 23)
    
    let hotel = Places(imageName: "hotel", name: "Hotel Library", category: "Library", crowded: 0.0, mon: "8:00am - 11:30pm", tue: "8:00am - 11:30pm", wed: "8:00am - 11:30pm", thu: "8:00am - 11:30pm", fri: "8:00am - 6:30pm", sat: "12:00pm - 6:30pm", sun: "Closed", id: 24)

    let uris = Places(imageName: "uris", name: "Uris Library", category: "Library", crowded: 0.0, mon: "8:00am - 11:00pm", tue: "8:00am - 11:00pm", wed: "8:00am - 11:00pm", thu: "8:00am - 11:00pm", fri: "8:00am - 5:00pm", sat: "12:00pm - 5:00pm", sun: "12:00pm - 11:00pm", id: 25)

    
    //Cafes
    let libe = Places(imageName: "libe", name: "Libe Café", category: "Café", crowded: 0.0, mon: "8:00am - 10:00pm", tue: "8:00am - 10:00pm", wed: "8:00am - 10:00pm", thu: "8:00am - 10:00pm", fri: "8:00am - 5:00pm", sat: "10:00am - 5:00pm", sun: "10:00am - 10:00pm", id: 26)

    let atrium = Places(imageName: "atrium", name: "Atrium Café", category: "Café", crowded: 0.0, mon: "Closed", tue: "Closed", wed: "Closed", thu: "Closed", fri: "Closed", sat: "Closed", sun: "Closed", id: 27)
    
    let barn = Places(imageName: "barn", name: "Big Red Barn", category: "Café", crowded: 0.0, mon: "8:00am - 3:00pm", tue: "8:00am - 3:00pm", wed: "Closed", thu: "Closed", fri: "Closed", sat: "Closed", sun: "Closed", id: 28)
    
    let jennie = Places(imageName: "jennie", name: "Café Jennie", category: "Café", crowded: 0.0, mon: "8:30am - 6:00pm", tue: "8:30am - 6:00pm", wed: "8:30am - 6:00pm", thu: "8:30am - 6:00pm", fri: "8:30am - 6:00pm", sat: "10:00am - 5:00pm", sun: "Closed", id: 29)
    
    let crossings = Places(imageName: "crossings", name: "Crossings Café", category: "Café", crowded: 0.0, mon: "8:00am - 6:00pm", tue: "8:00am - 6:00pm", wed: "8:00am - 6:00pm", thu: "8:00am - 6:00pm", fri: "8:00am - 6:00pm", sat: "8:00am - 6:00pm", sun: "8:00am - 6:00pm", id: 30)
    
    let goldies = Places(imageName: "goldies", name: "Goldie's Café", category: "Café", crowded: 0.0, mon: "8:00am - 6:00pm", tue: "8:00am - 6:00pm", wed: "8:00am - 6:00pm", thu: "8:00am - 6:00pm", fri: "8:00am - 5:00pm", sat: "Closed", sun: "Closed", id: 31)

    let greenDragon = Places(imageName: "greenDragon", name: "Green Dragon", category: "Café", crowded: 0.0, mon: "8:00am - 11:00pm", tue: "8:00am - 11:00pm", wed: "8:00am - 11:00pm", thu: "8:00am - 11:00pm", fri: "8:00am - 5:00pm", sat: "12:00pm - 5:00pm", sun: "12:00pm - 11:00pm", id: 32)

    let mannCafe = Places(imageName: "mannCafe", name: "Mann Café", category: "Café", crowded: 0.0, mon: "8:00am - 6:00pm", tue: "8:00am - 6:00pm", wed: "8:00am - 6:00pm", thu: "8:00am - 6:00pm", fri: "8:00am - 5:00pm", sat: "Closed", sun: "Closed", id: 33)
    
    let martha = Places(imageName: "martha", name: "Martha's Café", category: "Café", crowded: 0.0, mon: "8:00am - 3:00pm", tue: "8:00am - 3:00pm", wed: "8:00am - 3:00pm", thu: "8:00am - 3:00pm", fri: "8:00am - 3:00pm", sat: "Closed", sun: "Closed", id: 34)

    let mattin = Places(imageName: "mattin", name: "Mattin's Café", category: "Café", crowded: 0.0, mon: "7:00am - 10:00pm", tue: "7:00am - 10:00pm", wed: "7:00am - 10:00pm", thu: "7:00am - 10:00pm", fri: "7:00am - 5:00pm", sat: "Closed", sun: "Closed", id: 35)
    
    let novicks = Places(imageName: "novicks", name: "Novick's Café", category: "Café", crowded: 0.0, mon: "7:30am - 9:00pm", tue: "7:30am - 9:00pm", wed: "7:30am - 9:00pm", thu: "7:30am - 9:00pm", fri: "7:30am - 9:00pm", sat: "7:30am - 9:00pm", sun: "7:30am - 9:00pm", id: 36)

    let rusty = Places(imageName: "rusty", name: "Rusty's", category: "Café", crowded: 0.0, mon: "8:00am - 4:00pm", tue: "8:00am - 4:00pm", wed: "8:00am - 4:00pm", thu: "8:00am - 4:00pm", fri: "8:00am - 4:00pm", sat: "Closed", sun: "Closed", id: 37)

    
    //Food Court
    let trillium = Places(imageName: "trillium", name: "Trillium", category: "Food Court", crowded: 0.0, mon: "8:00am - 3:00pm", tue: "8:00am - 3:00pm", wed: "8:00am - 3:00pm", thu: "8:00am - 3:00pm", fri: "8:00am - 2:00pm", sat: "Closed", sun: "Closed", id: 38)
    
    let bear = Places(imageName: "bear", name: "Bear Necessities", category: "Food Court", crowded: 0.0, mon: "8:00am - 2:00am", tue: "8:00am - 2:00am", wed: "8:00am - 2:00am", thu: "8:00am - 2:00am", fri: "8:00am - 2:00am", sat: "10:00am - 2:00am", sun: "10:00am - 2:00am", id: 39)
    
    var placesCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
    let afterSchoolLabel = UILabel()
    let spacing: CGFloat = 10
    
    var places: [Places] = []
    var filters: [Filter] = []
    var allPlaces: [Places] = []
    var allFilters: [Filter] = []
    var selectedRestaurants: [Filter] = []
    var selectedFilters: [Filter] = []
    var filterSelected: [Bool] = [false, false]
    let placesReuseIdentifier: String = "placesReuseIdentifier"
    let filterReuseIdentifier: String = "filterReuseIdentifier"
    
    let homeButton = UIButton()
    var home = UIImage(named: "home")
    let profileButton = UIButton()
    let profile = UIImage(named: "profile")
    
    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)
    
    //location
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white

        
        places = [morrison, northStar, risley, okenshields, becker, cook, bethe, keeton, rose, west, adelson, ilr, physicalSciences, engineering, vet, africana, olin, kroch, law, management, mann, math, arts, hotel, uris, libe, atrium, barn, jennie, crossings, goldies, greenDragon, mannCafe, martha, mattin, novicks, rusty, trillium, bear]
            
        allPlaces = places
        
        filters = [all, diningHalls, libraries, cafes, foodCourts, serviceCenters]
        
        allFilters = filters
        
        //TODO: Setup flow layout
        let placesLayout =  UICollectionViewFlowLayout()
        placesLayout.minimumLineSpacing = spacing
        placesLayout.minimumInteritemSpacing = spacing
        placesLayout.scrollDirection = .vertical
        
        let filterLayout =  UICollectionViewFlowLayout()
        filterLayout.minimumLineSpacing = spacing
        filterLayout.minimumInteritemSpacing = spacing
        filterLayout.scrollDirection = .horizontal
        
        //TODO: Instantiate collectionView
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .white
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        view.addSubview(filterCollectionView)
        
        placesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: placesLayout)
        placesCollectionView.backgroundColor = .white
        placesCollectionView.register(PlacesCollectionViewCell.self, forCellWithReuseIdentifier: placesReuseIdentifier)
        placesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        view.addSubview(placesCollectionView)
        
        //shapes
        let rectangle1 = CGRect(x: 0, y: 0, width: 400, height: 116)
        let view1 = UIView(frame: rectangle1)
        view1.backgroundColor = maroon
        self.view.addSubview(view1)
        
        let rectangle2 = CGRect(x: 0, y: 773, width: 400, height: 71)
        let view2 = UIView(frame: rectangle2)
        view2.backgroundColor = .white
        self.view.addSubview(view2)
        
        afterSchoolLabel.text = "CUAfterSchool"
        afterSchoolLabel.font = .systemFont(ofSize: 32)
        afterSchoolLabel.textAlignment = .center
        afterSchoolLabel.textColor = .white
        afterSchoolLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(afterSchoolLabel)
        
        let vertLine = CGRect(x: 196, y: 785, width: 2, height: 47)
        let view3 = UIView(frame: vertLine)
        view3.backgroundColor = maroon
        self.view.addSubview(view3)
        
        let horzLine = CGRect(x: 0, y: 773, width: 400, height: 1)
        let view4 = UIView(frame: horzLine)
        view4.backgroundColor = maroon
        self.view.addSubview(view4)

        homeButton.setBackgroundImage(home, for: .normal)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        
        profileButton.setBackgroundImage(profile, for: .normal)
        profileButton.addTarget(self, action: #selector(pushProfile), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        setUpConstraints()
        
        LocationManager.shared.getUserLocation { location in

            
        }
    }
    
    @objc func pushProfile() {
        if let unwrappedUser = user {
            navigationController?.pushViewController(ProfileViewController(new_user: unwrappedUser), animated: true)
        }
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    func setUpConstraints() {
        let collectionViewPadding: CGFloat = 18
        
        NSLayoutConstraint.activate([
            afterSchoolLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            afterSchoolLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            afterSchoolLabel.heightAnchor.constraint(equalToConstant: 39),
            afterSchoolLabel.widthAnchor.constraint(equalToConstant: 251)
        ])
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 780),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            homeButton.heightAnchor.constraint(equalToConstant: 60),
            homeButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 780),
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260),
            profileButton.heightAnchor.constraint(equalToConstant: 60),
            profileButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: afterSchoolLabel.bottomAnchor, constant: 23),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 31),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            placesCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: collectionViewPadding),
            placesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            placesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            placesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
    
    func filterRestaurants() {
        places = []
        
        if(filters[1].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Dining Hall"
            })
        }
        if(filters[2].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Library"
            })
        }
        if(filters[3].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Café"
            })
        }
        if(filters[4].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Food Court"
            })
        }
        if(filters[5].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Service Center"
            })
        }
        
        if(filters[0].selected == true){
            places = allPlaces
            }
        else if (filters[1].selected == filters[2].selected && filters[2].selected == filters[3].selected && filters[3].selected == filters[4].selected && filters[4].selected == filters[5].selected) {
            places = allPlaces
        }
        else if (filters[0].selected == filters[1].selected && filters[1].selected == filters[2].selected && filters[2].selected == filters[3].selected && filters[3].selected == filters[4].selected && filters[4].selected == filters[5].selected) {
            places = allPlaces
        }
        placesCollectionView.reloadData()
        filterCollectionView.reloadData()
        }
        
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == filterCollectionView) {
            return filters.count
        }
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == filterCollectionView) {
            let filterCell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            filterCell.configure(filters: filters[indexPath.row])
            return filterCell
        }
        else {
            let placesCell = placesCollectionView.dequeueReusableCell(withReuseIdentifier: placesReuseIdentifier, for: indexPath) as! PlacesCollectionViewCell
            placesCell.layer.shadowColor = UIColor.black.cgColor
            placesCell.layer.shadowOffset = CGSize(width: 0, height: 0)
            placesCell.layer.shadowRadius = 3.0
            placesCell.layer.shadowOpacity = 1
            placesCell.layer.masksToBounds = false
            placesCell.configure(places: places[indexPath.row])
            return placesCell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == filterCollectionView) {
                return CGSize(width: 140, height: 31)
        }
        else {
            return CGSize(width: 168, height: 166)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == filterCollectionView) {
            filters[indexPath.row].selected.toggle()
            filterRestaurants()
        }
        else{
            let cell = placesCollectionView.cellForItem(at: indexPath) as! PlacesCollectionViewCell
            
                NetworkManager.getLocationById(id: self.places[indexPath.row].id) { response in
                    self.present(DetailViewController(login: self.login, location: response, places: self.places[indexPath.row], delegate: cell), animated: true)
            }
            

            
        }
    }
}
