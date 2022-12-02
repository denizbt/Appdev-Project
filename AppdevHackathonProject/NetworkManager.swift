//
//  NetworkManager.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/29/22.
//

import Alamofire
import Foundation

class NetworkManager {

    static let host = "http://35.194.81.8"

    static func getCommentsByLocation(location_id: Int, completion: @escaping ([Comment]) -> Void) {
        let endpoint = "\(host)/api/comments/\(location_id)/"
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
    
    static func getUserID(id: Int, completion: @escaping (UserID) -> Void) {
        let endpoint = "\(host)/api/users/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(UserID.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (LoginSession) -> Void) {
        let endpoint = "\(host)/api/users/login/"
        
        let params: Parameters = [
            "email": email,
            "password": password
        ]
        print(email)
        print(password)
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                //print(String(data: data, encoding: .utf8))
                if let userResponse = try? jsonDecoder.decode(LoginSession.self, from: data) {
                    completion(userResponse)
                }
                else {
                    //print("Failed to decode login")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    static func registerUser(name: String, username: String, email: String, password: String, completion: @escaping (RegisterUser) -> Void) {
        let endpoint = "\(host)/api/users/"

        let params: Parameters = [
            "name": name,
            "username": username,
            "email": email,
            "password": password
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(RegisterUser.self, from: data) {
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
