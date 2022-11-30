//
//  NetworkManager.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import Alamofire
import Foundation

class NetworkManager {

    static let host = "https://ios-course-message-board.herokuapp.com"

    static func getAllComments(completion: @escaping ([Comment]) -> Void) {
        let endpoint = "\(host)/posts/all/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode([Comment].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    static func createComment(title: String, body: String, poster: String, completion: @escaping (Comment) -> Void) {
        let endpoint = "\(host)/posts/"
        
        let params: Parameters = [
            "title": title,
            "body": body,
            "poster": poster
        ]
        
        AF.request(endpoint, method: .post, parameters: params).validate().responseData {response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Comment.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode createPost")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func updatePost(id: String, body: String, poster: String, completion: @escaping (Comment) -> Void) {

    }
    
    static func deletePost(id: String, poster: String, completion: @escaping (Comment) -> Void) {

    }
    
    // Extra Credit

    static func getPostersPosts(poster: String, completion: Any) {
        
    }
}
