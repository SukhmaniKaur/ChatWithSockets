//
//  Instagram_API.swift
//  Shoal
//
//  Created by MACBOOK on 31/07/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation

class InstagramApi {
    
    static let shared = InstagramApi()
    private let instagramAppID = "282702412858650"
    private let redirectURI = "https://httpstat.us/200"
    private let app_secret = "b3eef4343ee5294d41abd98a6b3b93a5"
    private let scope = "user_profile,user_media"
    private let responseType = "code"
    private init () {}
    
    //MARK: - BaseURL
    private enum BaseURL: String {
        case displayApi = "https://api.instagram.com/"
    }
    
    //MARK: - Method
    private enum Method: String {
        case authorize = "oauth/authorize"
    }
    
    //MARK: - authorizeApp
    func authorizeApp(completion: @escaping (_ url: URL?) -> Void ) {
        let urlString = "\(BaseURL.displayApi.rawValue)\(Method.authorize.rawValue)?app_id=\(instagramAppID)&redirect_uri=\(redirectURI)&scope=\(scope)&response_type=\(responseType)"
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response {
                print(response)
                completion(response.url)
            }
        })
        task.resume()
    }
    
    //MARK: - getTokenFromCallbackURL
    func getTokenFromCallbackURL(request: URLRequest) -> String? {
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.starts(with: "\(redirectURI)?code=") {
            print("Response uri:",requestURLString)
            if let range = requestURLString.range(of: "\(redirectURI)?code=") {
                let authorization = String(requestURLString[range.upperBound...].dropLast(2))
                return authorization
            }
        }
        return nil
    }
}
