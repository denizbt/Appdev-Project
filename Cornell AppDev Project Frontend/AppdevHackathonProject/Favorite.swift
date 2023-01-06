//
//  Favorite.swift
//  AppdevHackathonProject
//
//  Created by Jenny Chen on 12/1/22.
//

import UIKit

class Favorite {
    var star = UIImage()
    var selected: Bool
    
    init(selected: Bool) {
        self.selected = selected
        if(selected){
            star = UIImage(named: "filledStar")!
        }
        else{
            star = UIImage(named: "emptyStar")!
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
