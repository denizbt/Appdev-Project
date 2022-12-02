//
//  LogoutSession.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 12/2/22.
//

import UIKit

struct LogoutSession: Codable {
    let session_token: String
    let session_expiration: String
    let update_token: String
}
