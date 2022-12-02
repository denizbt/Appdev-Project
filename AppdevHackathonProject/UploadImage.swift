//
//  UploadImage.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/2/22.
//

import UIKit

struct UploadImage: Codable {
    let user_id: Int
    var url: String
    let bucketname: String
    var timestamp: String
}
