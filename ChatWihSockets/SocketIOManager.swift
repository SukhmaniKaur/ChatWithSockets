//
//  SocketIOManager.swift
//  ChatWihSockets
//
//  Created by MACBOOK on 28/09/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket: SocketIOClient!
    
    // defaultNamespaceSocket and swiftSocket both share a single connection to the server
    let manager = SocketManager(socketURL: URL(string: "http://6c90fe4479e7.ngrok.io/")!, config: [.log(true), .compress])
    
    override init() {
        super.init()
        socket = manager.defaultSocket
       
    }
    
    //Custom Connect with userID
    func connectSocket() {
       
        let userId = AppModel.shared.token
        self.manager.config = SocketIOClientConfiguration(
            arrayLiteral:.connectParams(["access_token": userId]),.extraHeaders(["Authorization" : userId]),
            .secure(true),.forceWebsockets(true)
        )
      
        
        //To connect socket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("socket connected",data,ack)
        }
        
        socket.connect()
        
    }
    
    func establishConnection() {
        SocketIOManager.sharedInstance.connectSocket()
    }
    
    
    func closeConnection() {
        socket.disconnect()
    }
    
    
    

//    func connectToServerWithNickname(message: String, completionHandler: (userList: [[String: AnyObject]]!) -> Void) {
//        socket.emit("message", message)
//
//        socket.on("userList") { ( dataArray, ack) -> Void in
//            completionHandler(userList: dataArray[0] as! [[String: AnyObject]])
//        }
//
//        listenForOtherMessages()
//    }
////
//
//    func exitChatWithNickname(nickname: String, completionHandler: () -> Void) {
//        socket.emit("exitUser", nickname)
//        completionHandler()
//    }
//
//
    func sendMessage(message: String) {
        socket.emit("message",message)
    }
    
   

//
    func getChatMessage(completionHandler: @escaping (_ messageInfo: ChatMessage) -> Void) {
        socket.on("message") { (dataArray, socketAck) -> Void in
            let messageJsonData = dataArray.first as! [String: Any]
            let jsonData = try? JSONSerialization.data(withJSONObject: messageJsonData["data"]!, options: [])
            let jsonString = String(data: jsonData!, encoding: .utf8)!
            print(jsonString)
            //Decoding data into chat message model
            do {
                let message = try JSONDecoder().decode(ChatMessage.self, from: jsonData!) // decode the response into chat message
                completionHandler(message)
            }
            catch let err {
                print("Err", err)
            }
            
        }
    }
//
//
//    private func listenForOtherMessages() {
//        socket.on("userConnectUpdate") { (dataArray, socketAck) -> Void in
//            NSNotificationCenter.defaultCenter().postNotificationName("userWasConnectedNotification", object: dataArray[0] as! [String: AnyObject])
//        }
//
//        socket.on("userExitUpdate") { (dataArray, socketAck) -> Void in
//            NSNotificationCenter.defaultCenter().postNotificationName("userWasDisconnectedNotification", object: dataArray[0] as! String)
//        }
//
//        socket.on("userTypingUpdate") { (dataArray, socketAck) -> Void in
//            NSNotificationCenter.defaultCenter().postNotificationName("userTypingNotification", object: dataArray[0] as? [String: AnyObject])
//        }
//    }
//
//
//    func sendStartTypingMessage(nickname: String) {
//        socket.emit("startType", nickname)
//    }
//
//
//    func sendStopTypingMessage(nickname: String) {
//        socket.emit("stopType", nickname)
//    }
}
