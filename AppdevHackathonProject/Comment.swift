//
//  Comment.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/28/22.
//

import Foundation

struct Comment: Codable {
    let id: String
    var title: String
    var body: String
    let poster: String
    var timeStamp: String
}

struct CommentResponse: Codable {
    let success: Bool
    let data: [Comment]
}
