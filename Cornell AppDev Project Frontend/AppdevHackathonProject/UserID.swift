//
//  UserID.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/1/22.
//

import UIKit

struct UserID: Codable{
    let id: Int
    let name: String
    let username: String
    let email: String
    let favorites: [Int]
    let session_token: String
    let session_expiration: String
    let update_token: String
}
