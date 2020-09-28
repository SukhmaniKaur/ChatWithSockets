//
//  AppModel.swift
//  Shoal
//
//  Created by MACBOOK on 03/07/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation

//MARK: - AppModel
class AppModel: NSObject {
    static let shared = AppModel()
//    var currentUser: User!
    var isSocialLogin: Bool = Bool()
    var fcmToken: String = ""
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNWYyOTA1ODJmZWZmNjIyZDhkNjAxYmYxIiwiZW1haWwiOiJqYWdtb2hhbi5hcHBrbml0QGdtYWlsLmNvbSIsInVzZXJUeXBlIjoxLCJ0b2tlbkxpZmUiOiI3ZCIsInJvbGUiOiJ1c2VyIn0sImlhdCI6MTYwMTI4MzEyMSwiZXhwIjoxNjAxODg3OTIxfQ.21VwTFp8kd7Gd9HcMYLosOoP0OEqBhV23y-VXZqG9GM"
//    var staticData: StaticData!
//    var faqList: [FaqListing] = [FaqListing]()
}

// MARK: - SuccessModel
struct SuccessModel: Codable {
    let code: Int
    let message, format, timestamp: String
}

//MARK: - SocialLoginData
struct SocialLoginData {
    var image, socialId: String
    var name, email: String
    var device, fcmToken: String
    var socialToken: String
    var socialIdentifier, gender: Int
    
    init() {
        self.image = DocumentDefaultValues.Empty.string
        self.socialId = DocumentDefaultValues.Empty.string
        self.name = DocumentDefaultValues.Empty.string
        self.email = DocumentDefaultValues.Empty.string
        self.device = DocumentDefaultValues.Empty.string
        self.fcmToken = DocumentDefaultValues.Empty.string
        self.socialToken = DocumentDefaultValues.Empty.string
        self.socialIdentifier = DocumentDefaultValues.Empty.int
        self.gender = DocumentDefaultValues.Empty.int
    }
}

//MARK: - CurrentLocation
struct CurrentLocation: Codable{
    var latitude: Double
    var longitude: Double
}
