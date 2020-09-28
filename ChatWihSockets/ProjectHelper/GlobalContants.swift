//
//  GlobalContants.swift
//  Shoal
//
//  Created by Rohit Saini on 11/06/20.
//  Copyright © 2020 Rohit Saini. All rights reserved.
//

import Foundation
import UIKit

//MARK: - STORYBOARD
struct STORYBOARD {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
    static let HOME = UIStoryboard(name: "Home", bundle: nil)
    static let PROFILE = UIStoryboard(name: "Profile", bundle: nil)
}

//MARK: - SCREEN
struct SCREEN
{
    static var WIDTH = UIScreen.main.bounds.size.width
    static var HEIGHT = UIScreen.main.bounds.size.height
}

// MARK: - SETTING_HEADINGS
struct SETTING_HEADINGS {
    let heading: String
    let subHeading:[String]
    var isOpened: Bool
}

//MARK: - AppImageUrl
struct AppImageUrl {
    //Staging
//    static let IMAGE_BASE = "https://shoal-app.s3.us-east-2.amazonaws.com/staging/images/"
    //Dev
    static let IMAGE_BASE = "https://shoal-app.s3.us-east-2.amazonaws.com/development/images/"
    static let small = IMAGE_BASE + "small/"
    static let average = IMAGE_BASE + "average/"
    static let best = IMAGE_BASE + "best/"
}

//MARK:- DocumentDefaultValues
struct DocumentDefaultValues{
    struct Empty{
        static let string =  ""
        static let int =  0
        static let bool = false
        static let double = 0.0
    }
}

//MARK:- AppColors
struct AppColors{
    static let LoaderColor =  #colorLiteral(red: 0.9137254902, green: 0.6980392157, blue: 0.2941176471, alpha: 1)
}

//MARK: - CONSTANTS
struct CONSTANTS {
    static let genderArray = ["Male", "Female", "Other"]
    static let zodiacArray = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    static let relationshipArray = ["Single", "In A Relationship", "Complicated"]
    static let heightArray = ["4 ft (122cm)", "4.1 ft (124cm)", "4.2 ft (127cm)", "4.3 ft (130cm)", "4.4 ft (132cm)", "4.5 ft (135cm)", "4.6 ft (137cm)", "4.7 ft (140cm)", "4.8 ft (142cm)", "4.9 ft (145cm)", "4.10 ft (147cm)", "4.11 ft (150cm)", "5 ft (152cm)", "5.1 ft (155cm)", "5.2 ft (157cm)", "5.3 ft (160cm)", "5.4 ft (163cm)", "5.5 ft (165cm)", "5.6 ft (168cm)", "5.7 ft (170cm)", "5.8 ft (173cm)", "5.9 ft (175cm)", "5.10 ft (178cm)", "5.11 ft (180cm)", "6 ft (183cm)", "6.1 ft (185cm)", "6.2 ft (188cm)", "6.3 ft (190cm)", "6.4 ft (193cm)", "6.5 ft (196cm)", "6.6 ft (198cm)", "6.7 ft (201cm)", "6.8 ft (203cm)", "6.9 ft (206cm)", "6.10 ft (208cm)", "6.11 ft (211cm)"]
    static let DISTANCE_IN_METERS_FOR_CHECK_IN = 280
}

//MARK: - UserDefaultKeys
struct UserDefaultKeys {
    static let currentUser = "currentUser"
    static let token = "accessToken"
//    static let latitude = "latitude"
//    static let longitude = "longitude"
    static let city = "city"
    static let country = "country"
    static let userLocation = "userLocation"
    static let isLocationSaved = "isLocationSaved"
    static let isAtShoalingVC = "isShoalingVC"
    static let locationSavedDate = "locationSavedDate"
    static let runTimeUserLocation = "runTimeUserLocation"
}

//MARK: - PlaceListingType
enum PlaceListingType {
    case nearByPlaces, allPlaces
}

//MARK:- Notifications
struct NOTIFICATIONS{
    static let getPlaceId = Notification.Name("PlaceId")
}

//MARK: - For Menu Item Types
enum MenuType: Int {
    case onMenuTypeStarter = 1
    case onMenuTypeMainCourse = 2
    case onMenuTypeDessert = 3
    case onMenuTypeBeverages = 4
    case onMenuTypeOther = 5
}

//MARK: - GOOGLE
struct GOOGLE{
    static var CLIENT_ID = "747509549851-ski34kienreq17sbui69lprn3qfpp5v0.apps.googleusercontent.com"
    static var API_KEY = "AIzaSyCfssY5ega2OOwKhq9MPJhpF9-EcmrxwW8"
}

//MARK: - SignUpType
enum SignUpType {
    case socialUser, normalUser
}

//MARK: - CheckCount
enum CheckCount{
    case isFromShoaling, isFromEdit, isFromSignUp
}

//MARK: - SOCIAL_DATA
struct SOCIAL_DATA{
    static var socialType:SignUpType = .normalUser
    static var socialDict: SocialLoginData = SocialLoginData()
}

//MARK: - ALERT_TYPE
enum ALERT_TYPE {
    case disconnectInstagram, deleteAccount, logout
}

//MARK: - GENDER
enum GENDER: String{
    case Female
    case Male
    case Other
    case Select
    func getGender() -> String{
        return self.rawValue
    }
}

//MARK: - ZODIAC_TYPE
enum ZODIAC_TYPE:String{
    case Aries
    case Taurus
    case Gemini
    case Cancer
    case Leo
    case Virgo
    case Libra
    case Scorpio
    case Sagittarius
    case Capricorn
    case Aquarius
    case Pisces
    case Select
    func getType() -> String{
        return self.rawValue
    }
}

//MARK: - RELATIONSHIP_STATUS
enum RELATIONSHIP_STATUS:String{
    case Single
    case InARelationship = "In A Relationship"
    case Complicated
    func getStatus() -> String{
        return self.rawValue
    }
}

//MARK: - STATIC_DATA
enum STATIC_DATA: Int{
    case terms = 1
    case privacy = 2
    case about = 3
}

//MARK: - CHECK_IN_BTN_TYPE
enum CHECK_IN_BTN_TYPE{
    case checkIn
    case checkOut
}

//MARK: - ScrollDirection
enum ScrollDirection{
    case up
    case down
}
