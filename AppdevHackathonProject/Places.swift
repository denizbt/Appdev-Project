//
//  Places.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/21/22.
//

import Foundation
import UIKit
 
class Places {
    var imageName: String
    var name: String
    var category: String
    var crowded: Float //TODO: have user rate busy-ness from 1-10 and maybe update some sort of visual or meter (red, yellow, green)
    var mon: String
    var tue: String
    var wed: String
    var thu: String
    var fri: String
    var sat: String
    var sun: String
    var id: Int


 
    init (imageName: String, name: String, category: String, crowded: Float, mon: String, tue: String, wed: String, thu: String, fri: String, sat: String, sun: String, id: Int) {
        self.imageName = imageName
        self.name = name
        self.category = category
        self.crowded = crowded
        self.mon = "Mon: " + mon
        self.tue = "Tue: " + tue
        self.wed = "Wed: " + wed
        self.thu = "Thu: " + thu
        self.fri = "Fri: " + fri
        self.sat = "Sat: " + sat
        self.sun = "Sun: " + sun
        self.id = id
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

