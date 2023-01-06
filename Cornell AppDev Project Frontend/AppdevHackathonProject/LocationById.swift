//
//  LocationById.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/2/22.
//

import UIKit

struct LocationById: Codable {
    let id: Int
    let name: String
    let address: String
    var latitude: Float
    var longitude: Float
    var busyness: Float
    var comments: [CreateComment]
}
