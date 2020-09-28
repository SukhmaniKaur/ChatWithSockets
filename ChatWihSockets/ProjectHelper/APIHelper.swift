//
//  APIHelper.swift
//  WellnessApp
//
//  Created by apple on 29/08/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit

//Development
struct API {
    
    //Development
    static let BASE_URL = "http://ec2-18-218-192-105.us-east-2.compute.amazonaws.com/development/api/"
    
    //local
    //static let BASE_URL =  "http://192.168.1.27:3000/api/"
    
    struct USER {
        static let listMessages = BASE_URL + "user/listConversation"
        static let create = BASE_URL + "user/create"
        static let update = BASE_URL + "user/update"
        static let resendVerification = BASE_URL + "user/resendVerification"
        static let details = BASE_URL + "user/details"
        static let comment = BASE_URL + "user/comment"
        static let reply = BASE_URL + "user/reply"
        static let listUser = BASE_URL + "user/listUsers"
        static let listNotification = BASE_URL + "user/listNotificaion"
        static let list = BASE_URL + "user/listUsers"
        static let contactUs = BASE_URL + "user/contactUs"
        static let listRequest = BASE_URL + "user/listRequest"
        static let staticData = BASE_URL + "user/staticData"
        static let listTimeSlots = BASE_URL + "consultation/listTimeslot"
        static let requestConsultation = BASE_URL + "consultation/requestConsultation"
    }
   
    struct POST {
        static let create = BASE_URL + "post/create"
        static let update = BASE_URL + "post/update"
        static let delete = BASE_URL + "post/delete"
        static let list = BASE_URL + "post/list"
        static let commentList = BASE_URL + "post/commentList"
        static let replyList = BASE_URL + "post/replyList"
    }
    
    struct SLOT {
        static let create = BASE_URL + "consultation/createTimeslot"
        static let update = BASE_URL + "consultation/updateTimeslot"
        static let delete = BASE_URL + "consultation/deleteTimeslot"
        static let list = BASE_URL + "consultation/listTimeslot"
        static let listRequest = BASE_URL + "consultation/listRequest"
        static let requestAction = BASE_URL + "consultation/requestAction"
        static let requestConsultation = BASE_URL + "consultation/requestConsultation"
    }
    
    struct SYMPTOM {
        static let create = BASE_URL + "symptom/create"
        static let update = BASE_URL + "symptom/update"
        static let delete = BASE_URL + "symptom/delete"
        static let list = BASE_URL + "symptom/list"
    }
    
    struct FOOD {
        static let create = BASE_URL + "food/create"
        static let update = BASE_URL + "food/update"
        static let delete = BASE_URL + "food/delete"
        static let list = BASE_URL + "food/list"
    }
}

//MARK:- GCD
//MultiThreading
struct GCD{
    
    struct USER {
        
         static let ChatMessageList = DispatchQueue(label: "com.app.ChatMessageList", qos: DispatchQoS.userInteractive, attributes: DispatchQueue.Attributes.concurrent)
        static let CREATE = DispatchQueue(label: "com.app.WellnessApp_CREATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //1
        static let UPDATE = DispatchQueue(label: "com.app.WellnessApp_UPDATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //2
        static let RESEND_VERIFICATION = DispatchQueue(label: "com.app.WellnessApp_RESEND_VERIFICATION", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //3
        static let DETAILS = DispatchQueue(label: "com.app.WellnessApp_DETAILS", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //4
        static let COMMENT = DispatchQueue(label: "com.app.WellnessApp_COMMENT", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //5
        static let REPLY = DispatchQueue(label: "com.app.WellnessApp_REPLY", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //6
        static let LIST_USER = DispatchQueue(label: "com.app.WellnessApp_LIST_USER", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //7
        static let LIST_NOTIFICATION = DispatchQueue(label: "com.app.WellnessApp_LIST_NOTIFICATION", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //8
        static let LIST = DispatchQueue(label: "com.app.WellnessApp_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //9
        static let CONTACT_US = DispatchQueue(label: "com.app.WellnessApp_CONTACT_US", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //10
        static let LIST_REQUEST = DispatchQueue(label: "com.app.WellnessApp_LIST_REQUEST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //11
        static let STATIC_DATA = DispatchQueue(label: "com.app.WellnessApp_STATIC_DATA", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
        static let LIST_TIME_SLOTS = DispatchQueue(label: "com.app.WellnessApp_LIST_TIME_SLOTS", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
        static let REQUEST_CONSULTATION = DispatchQueue(label: "com.app.WellnessApp_REQUEST_CONSULTATION", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
    }
    
    struct POST {
        static let CREATE = DispatchQueue(label: "com.app.WellnessApp_CREATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //12
        static let UPDATE = DispatchQueue(label: "com.app.WellnessApp_UPDATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //13
        static let DELETE = DispatchQueue(label: "com.app.WellnessApp_DELETE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //14
        static let LIST = DispatchQueue(label: "com.app.WellnessApp_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //15
        static let COMMENT_LIST = DispatchQueue(label: "com.app.WellnessApp_COMMENT_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //16
        static let REPLY_LIST = DispatchQueue(label: "com.app.WellnessApp_REPLY_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //17
    }
    
    struct SLOT {
        static let CREATE = DispatchQueue(label: "com.app.WellnessApp_CREATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) // 18
        static let UPDATE = DispatchQueue(label: "com.app.WellnessApp_UPDATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //19
        static let DELETE = DispatchQueue(label: "com.app.WellnessApp_DELETE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //20
        static let LIST = DispatchQueue(label: "com.app.WellnessApp_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //21
        static let LIST_REQUEST = DispatchQueue(label: "com.app.WellnessApp_LIST_REQUEST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //22
        static let REQUEST_ACTION = DispatchQueue(label: "com.app.WellnessApp_REQUEST_ACTION", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //23
        static let REQUEST_CONSULTATION = DispatchQueue(label: "com.app.WellnessApp_REQUEST_CONSULTATION", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //24
    }
    
    struct SYMPTOM {
        static let CREATE = DispatchQueue(label: "com.app.WellnessApp_CREATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //25
        static let UPDATE = DispatchQueue(label: "com.app.WellnessApp_UPDATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //26
        static let DELETE = DispatchQueue(label: "com.app.WellnessApp_DELETE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //27
        static let LIST = DispatchQueue(label: "com.app.WellnessApp_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //28
    }
    
    struct FOOD {
        static let CREATE = DispatchQueue(label: "com.app.WellnessApp_CREATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //29
        static let UPDATE = DispatchQueue(label: "com.app.WellnessApp_UPDATE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //30
        static let DELETE = DispatchQueue(label: "com.app.WellnessApp_DELETE", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //31
        static let LIST = DispatchQueue(label: "com.app.WellnessApp_LIST", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent) //32
    }
}
