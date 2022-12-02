//
//  RegisterUser.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/1/22.
//

import UIKit

struct RegisterUser: Codable {
    let session_token: String
    let session_expiration: String
    let update_token: String
    let id: Int
}
