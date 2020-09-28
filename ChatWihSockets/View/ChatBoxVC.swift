//
//  ChatBoxVC.swift
//  WellnessApp
//
//  Created by App Knit on 14/09/19.
//  Copyright © 2019 Sukhmani. All rights reserved.
//

import UIKit
import GrowingTextView
import IQKeyboardManagerSwift

class ChatBoxVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    private var chatMessages: [ChatMessage] = [ChatMessage]()
    
    private var lastestMessagesArr: [ChatMessage] = [ChatMessage]()
    private var previousMessageArr: [ChatMessage] = [ChatMessage]()
    
    @IBOutlet weak var chatTextView: GrowingTextView!
    @IBOutlet weak var tableView: UITableView!
    
    private var hasMore: Bool = false
    private var page = 1
    
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:16/255, green:27/255, blue:57/255, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "loading...")
//        latestMessages()
        tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        customization()
        
//        SocketIOManager.sharedInstance.establishConnection()
       
        // Do any additional setup after loading the view.
    }
    
    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - refreshData
    //get previous messages
    @objc private func refreshData(_ sender: Any){
            page = page + 1
//            previousMessages(page: page)
    }
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        SocketIOManager.sharedInstance.getChatMessage { (message) in
            self.chatMessages.append(message)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.scrollToBottom()
            }
            
        }
    }
    
    //MARK: - scrollToBottom
    func scrollToBottom() {
            if self.chatMessages.count > 0 {
                self.tableView.scrollToRow(at: IndexPath.init(row: self.chatMessages.count - 1, section: 0), at: .bottom, animated: false)
        }
    }
    
    //MARK: - customization
    private func customization(){
        chatTextView.layer.cornerRadius = chatTextView.frame.height / 2
        chatTextView.layer.masksToBounds = true
        chatTextView.layer.borderWidth = 1
        chatTextView.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.8078431373, blue: 0.8235294118, alpha: 1)
        chatTextView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        chatTextView.textContainerInset = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 50)
    }
    
    //MARK: - TableView Functions
    // estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatCell else{
            return UITableViewCell()
        }
        cell.MSG = chatMessages[indexPath.row]
        
        return cell
    }
    
    // willDisplay
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
            
        }
    }
    
    //MARK: - clickBackBtn
    @IBAction func clickBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clickSendMessageBtn(_ sender: UIButton) {
        SocketIOManager.sharedInstance.sendMessage(message: chatTextView.text)
        chatTextView.resignFirstResponder()
        chatTextView.text = ""
    }
    
    
    //MARK:- List Messages
    //List previous messages
    private func latestMessages(){
        let params: [String: Any] = [String: Any]()
        GCD.USER.ChatMessageList.async {
            APIManager.sharedInstance.I_AM_COOL(params: params, api: API.USER.listMessages, Loader: false, isMultipart: false, { (response) in
                if response != nil{                             //if response is not empty
                    do {
                        let success = try JSONDecoder().decode(ChatModel.self, from: response!)     //decode the response
                        switch success.code{
                        case 100:
                            self.hasMore = success.hasMore
                           self.lastestMessagesArr = success.data
                           self.chatMessages = self.previousMessageArr + self.lastestMessagesArr
                           DispatchQueue.main.async {
                             self.tableView.reloadData()
                             self.scrollToBottom()
                            }
                        default:
                            print("Error")
                        }
                    }
                    catch let err {
                        print("Err", err)
                    }
                }
            })
        }
    }

    private func previousMessages(page:Int){
        let params: [String: Any] = ["page": page]
        GCD.USER.ChatMessageList.async {
            APIManager.sharedInstance.I_AM_COOL(params: params, api: API.USER.listMessages, Loader: false, isMultipart: false, { (response) in
                if response != nil{                             //if response is not empty
                    do {
                        let success = try JSONDecoder().decode(ChatModel.self, from: response!)     //decode the response
                        switch success.code{
                        case 100:
                        self.refreshControl.endRefreshing()
                            self.hasMore = success.hasMore
                            self.previousMessageArr = success.data
                            self.chatMessages = self.previousMessageArr + self.chatMessages
                            DispatchQueue.main.async {
                                self.tableView.reloadData()

                            }
                        default:
                            print("Error")
                        }
                    }
                    catch let err {
                        print("Err", err)
                    }
                }
            })
        }
    }

}


