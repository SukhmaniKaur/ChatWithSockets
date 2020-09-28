//
//  ViewController.swift
//  ChatWihSockets
//
//  Created by MACBOOK on 28/09/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startChattingBtnIsPressed(_ sender: UIButton) {
        SocketIOManager.sharedInstance.establishConnection()
        let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)
        let vc = STORYBOARD.instantiateViewController(withIdentifier: "ChatBoxVC") as! ChatBoxVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

