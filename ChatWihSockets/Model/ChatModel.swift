//
//  ChatModel.swift
//  ChatWihSockets
//
//  Created by MACBOOK on 28/09/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

// MARK: - Chat Model
struct ChatModel: Codable {
    let code: Int
    let message: String
    let data: [ChatMessage]
    let page, limit, size: Int
    let hasMore: Bool
    let format, timestamp: String
}



// MARK: - ChatMessage
struct ChatMessage: Codable {
    let message, messageID, name: String
    let type: Int
    let userID: String
    let userType: Int
    let timeStamp: Double
    
    enum CodingKeys: String, CodingKey {
        case message
        case messageID = "messageId"
        case name, timeStamp, type
        case userID = "userId"
        case userType
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        messageID = try values.decodeIfPresent(String.self, forKey: .messageID) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        userID = try values.decodeIfPresent(String.self, forKey: .userID) ?? ""
        type = try values.decodeIfPresent(Int.self, forKey: .type) ?? 0
        userType = try values.decodeIfPresent(Int.self, forKey: .userType) ?? 0
        timeStamp = try values.decodeIfPresent(Double.self, forKey: .timeStamp) ?? 0
    }
}
