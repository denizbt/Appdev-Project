//
//  Comment.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/28/22.
//

import Foundation

struct Comment: Codable {
    let id: Int
    var text: String
    let number: Int
    let user_id: Int
    let location_id: Int
    var timestamp: String
    var expiration: Bool
}

struct CommentResponse: Codable {
    let comments: [Comment]
}
