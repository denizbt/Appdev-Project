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
        AF.request(endpoint, method: .get, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode([Comment].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllComments")
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
                    print("Failed to decode getUserInfo")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getLocationById(id: Int, completion: @escaping (LocationById) -> Void) {
        let endpoint = "\(host)/api/locations/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(LocationById.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getUserInfo")
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
                    print("Failed to decode login")
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
                    print("Failed to decode registerUser")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //TODO: PASS SOMETHING THROUGH HEADER/ NO PARAMS
    static func logout(name: String, username: String, email: String, password: String, completion: @escaping (LogoutSession) -> Void) {
        let endpoint = "\(host)/api/users/logout/"
        
        let params: Parameters = [
            "email": email,
            "password": password
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(LogoutSession.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode registerUser")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func uploadImage(user_id: Int, image_data: String, completion: @escaping (UploadImage) -> Void) {
        let endpoint = "\(host)/api/users/upload/\(user_id)/"
        
        let params: Parameters = [
            "image_data": image_data
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(UploadImage.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode registerUser")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func createComment(user_id: Int, number: Int, text: String?, latitude: Float, longitude: Float, completion: @escaping (CreateComment) -> Void) {
        let endpoint = "\(host)/api/comments/1/"
        
        let params: Parameters = [
            "text": text!,
            "user_id": user_id,
            "number": number,
            "latitude": latitude,
            "longitude": longitude
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(CreateComment.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode createComment")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addFavorite(user_id: Int, number: Int, text: String, completion: @escaping (CreateComment) -> Void) {
        let endpoint = "\(host)/api/comments/1/"
        
        let params: Parameters = [
            "text": text,
            "user_id": user_id,
            "number": number
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(CreateComment.self, from: data) {
                    completion(userResponse)
                }
                else {
                    print("Failed to decode createComment")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
