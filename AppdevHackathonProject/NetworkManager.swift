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
    
    static func getCommentsByLocation(location_id: Int, completion: @escaping (CommentResponse) -> Void) {
        let endpoint = "\(host)/api/comments/\(location_id)/"
        AF.request(endpoint, method: .get, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(CommentResponse.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllComments")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImage(user_id: Int, completion: @escaping (GetImage) -> Void) {
        let endpoint = "\(host)/api/users/images/\(user_id)/"
        AF.request(endpoint, method: .get, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(GetImage.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getImage")
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
                print(String(data: data, encoding: .utf8))
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(LocationById.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getLocationById")
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
    static func logout(session_token: String, completion: @escaping (LogoutSession) -> Void) {
        let endpoint = "\(host)/api/users/logout/"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + session_token,
        ]
        
        AF.request(endpoint, method: .post, headers: headers).validate().responseData {response in
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
            "image_data": "data:image/png;base64,\(image_data)"
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
    
    
//    static func uploadImage(user_id: Int, image_data: String, completion: @escaping (UploadImage) -> Void) {
//        let endpoint = "\(host)/api/users/upload/\(user_id)/"
//
//        let params: Parameters = [
//            "image_data": "data:image/png;base64,\(image_data)"
//        ]
//
//        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                do {
//                    let imageData = try jsonDecoder.decode(UploadImage.self, from: data)
//                    let img = imageData.data
//                    completion(.success(img))
//
//                }
//                catch {
//                    completion(.failure(error))
//                }
//
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
    
    
    static func createComment(location_id: Int, user_id: Int, number: Int, text: String?, latitude: Double, longitude: Double, completion: @escaping (CreateComment) -> Void) {
        let endpoint = "\(host)/api/comments/\(location_id)/"
        
        let params: Parameters = [
            "text": text!,
            "user_id": user_id,
            "number": number,
            "latitude": 42.45538808894801,
            "longitude": -76.47925119890485
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
    
//    static func addFavorite(location_id: Int, user_id: Int, completion: @escaping (AddFavorite) -> Void) {
//        let endpoint = "\(host)/api/comments/\(location_id)"
//
//        let params: Parameters = [
//            "user_id": user_id,
//        ]
//
//        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode(AddFavorite.self, from: data) {
//                    completion(userResponse)
//                }
//                else {
//                    print("Failed to decode createComment")
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    static func addPosition(user_id: Int, number: Int, text: String, completion: @escaping (CreateComment) -> Void) {
//        let endpoint = "\(host)/api/comments/1/"
//
//        let params: Parameters = [
//            "text": text,
//            "user_id": user_id,
//            "number": number
//        ]
//
//        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode(CreateComment.self, from: data) {
//                    completion(userResponse)
//                }
//                else {
//                    print("Failed to decode createComment")
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    static func updateBusyness(location_id: Int, completion: @escaping (UpdateBusyness) -> Void) {
        let endpoint = "\(host)/api/locations/busyness/\(location_id)/"
        
        let params: Parameters = [
            "location_id": location_id,
        ]
        
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(UpdateBusyness.self, from: data) {
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
