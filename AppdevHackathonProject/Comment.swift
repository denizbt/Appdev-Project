//
//  Comment.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/28/22.
//

import Foundation

struct Comment: Codable {
    let id: String
    var body: String
    let poster: String
    var timeStamp: String
    let number: Int
    let user_id: Int
    let location_id: Int
    
}

struct CommentResponse: Codable {
    let success: Bool
    let data: [Comment]
}
