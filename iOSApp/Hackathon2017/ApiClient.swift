//
//  ApiClient.swift
//  Hackathon2017
//
//  Created by Arkadiusz Żmudzin on 16.07.2017.
//  Copyright © 2017 CzorneSalami. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ApiClient {
    
    let defaults = UserDefaults.standard
    let baseUrl = "http://localhost:8080/skladak"
    let tokenKey = "token"
    var token: String?
    
    static let shared = ApiClient()
    
    init() {
        self.token = defaults.string(forKey: tokenKey)
    }
    
    func login(username: String, password: String, successCallback: (() -> Void)?, errorCallback: (() -> Void)?) {
        let url = baseUrl + "/login"
        let params: Parameters = [
            "username": username,
            "password": password
        ]

        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers()).responseJSON { [unowned self] response in
            debugPrint(response)
            response.result.ifSuccess {
                let token = response.response?.allHeaderFields["Authorization"]
                self.defaults.set(token, forKey: self.tokenKey)
                successCallback?()
            }
            response.result.ifFailure {
                errorCallback?()
            }
        }
    }
    
    func getProfile(successCallback: ((User) -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/profile"
        
        Alamofire.request(url, headers: headers(withToken: token)).responseObject { (response: DataResponse<User>) in
            if let profile = response.result.value {
                successCallback?(profile)
            } else {
                errorCallback?()
            }
        }
    }
    
    private func headers(withToken token: String? = nil) -> HTTPHeaders {
        var headers: HTTPHeaders = [
           "Content-type": "application/json"
        ]
        if let token = token {
            headers["Authentication"] = "Bearer \(token)"
        }
        return headers
    }
}
