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
                if let token = response.response?.allHeaderFields["Authorization"] as? String {
                    let trimmed = String(token.characters.dropFirst("Bearer ".characters.count))
                    self.defaults.set(trimmed, forKey: self.tokenKey)
                    self.token = trimmed
                    successCallback?()
                } else {
                    errorCallback?()
                }
            }
            response.result.ifFailure {
                errorCallback?()
            }
        }
    }
    
    func getUser(successCallback: ((User) -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/profile"
        
        Alamofire.request(url, headers: headers(withToken: token)).responseObject { (response: DataResponse<User>) in
            if let user = response.result.value {
                successCallback?(user)
            } else {
                errorCallback?()
            }
        }
    }
    
    func updateUser(_ user: User, successCallback: (() -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/profile"
        
        let params: Parameters = user.toJSON()
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers(withToken: token)).responseString { response in
            if response.result.isFailure {
                errorCallback?()
            } else {
               successCallback?()
            }
        }
    }
    
    func getPlaces(successCallback: (([Place]) -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/places"
        
        Alamofire.request(url, headers: headers()).responseObject { (response : DataResponse<PlacesResponse>) in
            if let placesResponse = response.result.value, let places = placesResponse.places {
                successCallback?(places)
            } else {
                errorCallback?()
            }
        }
    }
    
    func addEvent(_ event: EventDetails, successCallback: (() -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/event"
        
        let params: Parameters = [
            "title": event.title!,
            "description": event.description!,
            "dateTime": event.date!.toString(),
            "startPlace": event.startPlace!,
            "endPlace": event.endPlace!,
            "wayPoints": event.places!
        ]
        
        Alamofire.request(url, method: .post, parameters: params, headers: headers(withToken: token)).responseJSON { response in
            if response.result.isSuccess {
                successCallback?()
            } else {
                errorCallback?()
            }
        }
    }
    
    func getEvents(successCallback: (([Event]) -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/event"
        
        Alamofire.request(url, headers: headers(withToken: token)).responseObject { (response: DataResponse<EventsResponse>) in
            if let eventsResponse = response.result.value, let events = eventsResponse.events {
                successCallback?(events)
            } else {
                errorCallback?()
            }
        }
    }
    
    func joinToEvent(withId id: Int, successCallback: (() -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/event/join/\(id)"
        
        Alamofire.request(url, method: .post, headers: headers(withToken: token)).responseJSON { response in
            if response.result.isSuccess {
                successCallback?()
            } else {
                errorCallback?()
            }
        }
    }
    
    func getRouteForEvent(withId id: Int, successCallback: ((Route) -> Void)?, errorCallback: (() -> Void)?) {
        let url = "\(baseUrl)/route/\(id)"
        
        Alamofire.request(url, headers: headers(withToken: token)).responseObject { (response: DataResponse<Route>) in
            if let route = response.result.value {
                successCallback?(route)
            } else {
                errorCallback?()
            }
        }    }
    
    private func headers(withToken token: String? = nil) -> HTTPHeaders {
        var headers: HTTPHeaders = [
           "Content-type": "application/json",
           "Accept": "application/json"
        ]
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
