//
//  ViewController.swift
//  Artable
//
//  Created by Sandesh Shetty on 11/29/19.
//  Copyright © 2019 Sandesh Shetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard.init(name: Storyboards.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }

}

