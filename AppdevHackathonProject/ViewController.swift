//
//  ViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    let diningHalls = Filter(filterName: "Dining Halls", selected: false)
    let libraries = Filter(filterName: "Libraries", selected: false)
    let cafes = Filter(filterName: "Cafés", selected: false)
    let serviceCenters = Filter(filterName: "Service Centers", selected: false)
    
    //Dining Halls
    let morrison = Places(imageName: "morrison", name: "Morrison Dining", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 4:30pm , 5:00pm - 8:30pm", tue: "7:00am - 4:30pm , 5:00pm - 8:30pm", wed: "7:00am - 4:30pm , 5:00pm - 8:30pm", thu: "7:00am - 4:30pm , 5:00pm - 8:30pm", fri: "7:00am - 4:30pm , 5:00pm - 8:30pm", sat: "8:00am - 4:30pm , 5:00pm - 8:30pm", sun: "10:00am - 2:00pm , 5:00pm - 8:30pm")
    
    let northStar = Places(imageName: "northStar", name: "North Star", category: "Dining Hall", crowded: 0.0, mon: "5:00pm - 9:00pm", tue: "5:00pm - 9:00pm", wed: "5:00pm - 9:00pm", thu: "5:00pm - 9:00pm", fri: "5:00pm - 9:00pm", sat: "10:30am - 2:30pm , 5:00pm - 9:00pm", sun: "10:00am - 2:00pm , 5:00pm - 9:00pm")
    
    let risley = Places(imageName: "risley", name: "Risley", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:00pm , 4:30pm - 9:00pm", tue: "11:00am - 2:00pm , 4:30pm - 9:00pm", wed: "11:00am - 2:00pm , 4:30pm - 9:00pm", thu: "11:00am - 2:00pm , 4:30pm - 9:00pm", fri: "11:00am - 2:00pm , 4:30pm - 9:00pm", sat: "Closed", sun: "Closed")
    
    let okenshields = Places(imageName: "okenshields", name: "Okenshields", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:30pm , 5:00pm - 8:30pm", tue: "7:00am - 4:30pm , 5:00pm - 8:30pm", wed: "7:00am - 4:30pm , 5:00pm - 8:30pm", thu: "7:00am - 4:30pm , 5:00pm - 8:30pm", fri: "7:00am - 4:30pm , 5:00pm - 8:30pm", sat: "Closed", sun: "Closed")
    
    let becker = Places(imageName: "becker", name: "Becker House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 3:30pm , 5:00pm - 8:00pm", tue: "7:00am - 3:30pm , 5:00pm - 8:00pm", wed: "7:00am - 2:00pm , 6:00pm - 8:00pm", thu: "7:00am - 3:30pm , 5:00pm - 8:00pm", fri: "7:00am - 3:30pm , 5:00pm - 8:00pm", sat: "10:30am - 2:00pm , 5:00pm - 8:00pm", sun: "10:00am - 2:00pm , 5:00pm - 8:00pm")
    
    let cook = Places(imageName: "cook", name: "Cook House", category: "Dining Hall", crowded: 0.0, mon: "7:30am - 10:00am , 5:00pm - 9:00pm", tue: "7:30am - 10:00am , 5:00pm - 9:00pm", wed: "7:30am - 10:00am , 6:00pm - 9:00pm", thu: "7:30am - 10:00am , 5:00pm - 9:00pm", fri: "7:30am - 10:00am , 5:00pm - 9:00pm", sat: "10:30am - 2:00pm , 5:00pm - 9:00pm", sun: "10:00am - 2:00pm , 5:00pm - 9:00pm")
    
    let bethe = Places(imageName: "bethe", name: "Bethe House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 2:00pm , 4:30pm - 7:30pm", tue: "7:00am - 2:00pm , 4:30pm - 7:30pm", wed: "7:00am - 2:00pm , 6:00pm - 7:30pm", thu: "7:00am - 2:00pm , 4:30pm - 7:30pm", fri: "7:00am - 2:00pm , 4:30pm - 7:30pm", sat: "10:30am - 2:00pm , 4:30pm - 7:30pm", sun: "10:00am - 2:00pm , 4:30pm - 7:30pm")
    
    let keeton = Places(imageName: "keeton", name: "Keeton House", category: "Dining Hall", crowded: 0.0, mon: "7:00am - 10:00am , 5:00pm - 8:00pm", tue: "7:00am - 10:00am , 5:00pm - 8:00pm", wed: "7:00am - 10:00am , 6:00pm - 8:00pm", thu: "7:00am - 10:00am , 5:00pm - 8:00pm", fri: "7:00am - 10:00am , 5:00pm - 8:00pm", sat: "10:30am - 2:00pm , 5:00pm - 8:00pm", sun: "10:00am - 2:00pm , 5:00pm - 8:00pm")
    
    let rose = Places(imageName: "rose", name: "Rose House", category: "Dining Hall", crowded: 0.0, mon: "7:30am - 10:00am , 5:00pm - 8:00pm", tue: "7:30am - 10:00am , 5:00pm - 8:00pm", wed: "7:30am - 10:00am , 6:00pm - 8:00pm", thu: "7:30am - 10:00am , 5:00pm - 8:00pm", fri: "7:30am - 10:00am , 5:00pm - 8:00pm", sat: "8:00am - 9:30am , 10:30am - 2:00pm , 5:00pm - 8:00pm", sun: "8:00am - 9:30am , 10:00am - 2:00pm , 5:00pm - 8:00pm")
    
    let west = Places(imageName: "104west", name: "104West!", category: "Dining Hall", crowded: 0.0, mon: "11:00am - 2:00pm , 5:00pm - 7:00pm", tue: "11:00am - 2:00pm , 5:00pm - 7:00pm", wed: "11:00am - 2:00pm , 5:00pm - 7:00pm", thu: "11:00am - 2:00pm , 5:00pm - 7:00pm", fri: "11:00am - 2:00pm , 5:00pm - 7:00pm", sat: "12:30pm - 2:00pm , 4:20pm - 5:20pm", sun: "11:00am - 2:00pm , 5:00pm - 7:00pm")
    
    
    // Libraries
    let adelson = Places(imageName: "adelson", name: "Adelson Library", category: "Library", crowded: 0.0, mon: "10:00am - 5:00pm", tue: "10:00am - 5:00pm", wed: "10:00am - 5:00pm", thu: "10:00am - 5:00pm", fri: "10:00am - 5:00pm", sat: "10:00am - 5:00pm", sun: "10:00am - 5:00pm")
    
    let ilr = Places(imageName: "ilr", name: "Industrial and Labor Relations Library", category: "Library", crowded: 0.0, mon: "8:00am - 8:00pm", tue: "8:00am - 8:00pm", wed: "8:00am - 8:00pm", thu: "8:00am - 8:00pm", fri: "8:00am - 5:00pm", sat: "Closed", sun: "Closed")
    
    let physicalSciences = Places(imageName: "physicalSciences", name: "Clark Physical Sciences Library", category: "Library", crowded: 0.0, mon: "Open 24 Hours", tue: "Open 24 Hours", wed: "Open 24 Hours", thu: "Open 24 Hours", fri: "Open 24 Hours", sat: "Open 24 Hours", sun: "Open 24 Hours")
    
    let engineering = Places(imageName: "engineering", name: "Engineering Library", category: "Library", crowded: 0.0, mon: "Open 24 Hours", tue: "Open 24 Hours", wed: "Open 24 Hours", thu: "Open 24 Hours", fri: "Open 24 Hours", sat: "Open 24 Hours", sun: "Open 24 Hours")
    
    let vet = Places(imageName: "vet", name: "Veterinary Library", category: "Library", crowded: 0.0, mon: "7:30am - 10:00pm", tue: "7:30am - 10:00pm", wed: "7:30am - 10:00pm", thu: "7:30am - 10:00pm", fri: "7:30am - 8:00pm", sat: "10:00am - 8:00pm", sun: "12:00pm - 10:00pm")
    
    let africana = Places(imageName: "africana", name: "Africana Library", category: "Library", crowded: 0.0, mon: "9:00am - 9:00pm", tue: "9:00am - 9:00pm", wed: "9:00am - 9:00pm", thu: "9:00am - 9:00pm", fri: "9:00am - 5:00pm", sat: "Closed", sun: "Closed")
    
    let olin = Places(imageName: "olin", name: "Olin Library", category: "Library", crowded: 0.0, mon: "8:00am - 12:00am", tue: "8:00am - 12:00am", wed: "8:00am - 12:00am", thu: "8:00am - 12:00am", fri: "8:00am - 6:00pm", sat: "10:00am - 6:00pm", sun: "10:00am - 12:00am")
    
    let kroch = Places(imageName: "kroch", name: "Kroch Library", category: "Library", crowded: 0.0, mon: "8:00am - 12:00am", tue: "8:00am - 12:00am", wed: "8:00am - 12:00am", thu: "8:00am - 12:00am", fri: "8:00am - 6:00pm", sat: "10:00am - 6:00pm", sun: "10:00am - 12:00am")
    
    let law = Places(imageName: "law", name: "Law Library", category: "Library", crowded: 0.0, mon: "8:00am - 8:00pm", tue: "8:00am - 8:00pm", wed: "8:00am - 8:00pm", thu: "8:00am - 8:00pm", fri: "8:00am - 5:00pm", sat: "11:00am - 5:00pm", sun: "12:00pm - 8:00pm")

    let management = Places(imageName: "management", name: "Management Library", category: "Library", crowded: 0.0, mon: "7:00am - 8:00pm", tue: "7:00am - 8:00pm", wed: "7:00am - 8:00pm", thu: "7:00am - 8:00pm", fri: "7:00am - 8:00pm", sat: "7:00am - 5:00pm", sun: "7:00am - 5:00pm")

    let mann = Places(imageName: "mann", name: "Mann Library", category: "Library", crowded: 0.0, mon: "8:00am - 10:00pm", tue: "8:00am - 10:00pm", wed: "8:00am - 10:00pm", thu: "8:00am - 10:00pm", fri: "8:00am - 6:00pm", sat: "12:00pm - 6:00pm", sun: "12:00pm - 6:00pm")
    
    let math = Places(imageName: "math", name: "Mathematics Library", category: "Library", crowded: 0.0, mon: "9:00am - 8:00pm", tue: "9:00am - 8:00pm", wed: "9:00am - 8:00pm", thu: "9:00am - 8:00pm", fri: "9:00am - 5:00pm", sat: "Closed", sun: "12:00pm - 8:00pm")
    
    let arts = Places(imageName: "arts", name: "Fine Arts Library", category: "Library", crowded: 0.0, mon: "9:00am - 10:00pm", tue: "9:00am - 10:00pm", wed: "9:00am - 10:00pm", thu: "9:00am - 10:00pm", fri: "9:00am - 5:00pm", sat: "12:00pm - 5:00pm", sun: "Closed")
    
    let hotel = Places(imageName: "hotel", name: "Hotel Library", category: "Library", crowded: 0.0, mon: "8:00am - 11:30pm", tue: "8:00am - 11:30pm", wed: "8:00am - 11:30pm", thu: "8:00am - 11:30pm", fri: "8:00am - 6:30pm", sat: "12:00pm - 6:30pm", sun: "Closed")

    let uris = Places(imageName: "uris", name: "Uris Library", category: "Library", crowded: 0.0, mon: "8:00am - 11:00pm", tue: "8:00am - 11:00pm", wed: "8:00am - 11:00pm", thu: "8:00am - 11:00pm", fri: "8:00am - 5:00pm", sat: "12:00pm - 5:00pm", sun: "12:00pm - 11:00pm")


    
    var placesCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CU After School"
        view.backgroundColor = .white
        
        places = [morrison, uris, jenni, rpcc, morrison, uris, jenni, rpcc, morrison, uris, jenni, rpcc, morrison, uris, jenni, rpcc]
            
        allPlaces = places
        
        filters = [diningHalls, libraries, cafes, serviceCenters]
        
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

        
        setUpConstraints()
    }
  
    func setUpConstraints() {
        let collectionViewPadding: CGFloat = 10
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50),
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
        
        if(filters[0].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Dining Hall"
            })
        }
        if(filters[1].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Library"
            })
        }
        if(filters[2].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Café"
            })
        }
        if(filters[3].selected == true){
            places = places + allPlaces.filter({ places in
                places.category == "Service Center"
            })
        }
        
        if (filters[0].selected == filters[1].selected && filters[1].selected == filters[2].selected && filters[2].selected == filters[3].selected) {
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
            let size = (filterCollectionView.frame.width - 10)/2.5
            return CGSize(width: size, height: 50)
        }
        else {
            let size = (placesCollectionView.frame.width - 10)/2.0
            return CGSize(width: size, height: size)
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
            present(DetailViewController(places: places[indexPath.row], delegate: cell), animated: true)
        }
    }
}




