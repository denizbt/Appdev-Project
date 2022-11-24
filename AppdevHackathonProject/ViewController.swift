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
    
    let burgerking = Places(imageName: "library", name: "Burger King", category: "Library", crowded: 0.0, hours: "10-9")
    let chipotle = Places(imageName: "dining", name: "Burger King", category: "Dining Hall", crowded: 0.0, hours: "10-9")
    let mcdonalds = Places(imageName: "cafe", name: "Burger King", category: "Café", crowded: 0.0, hours: "10-9")
    let pizza = Places(imageName: "service", name: "Burger King", category: "Service Center", crowded: 0.0, hours: "10-9")
    
    
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
        title = "Restaurants"
        view.backgroundColor = .white
        
        places = [burgerking, chipotle, mcdonalds, pizza, burgerking, chipotle, mcdonalds, pizza, burgerking, chipotle, mcdonalds, pizza]
            
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
            placesCell.configure(places: places[indexPath.row])
            return placesCell

        }
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (placesCollectionView.frame.width - 10)/2.0
        return CGSize(width: size, height: size)
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
//            let cell = songTableView.cellForRow(at: indexPath) as! SongTableViewCell
//            present(DetailViewController(song: songs[indexPath.row], delegate: cell), animated: true)
        }
    }
}




