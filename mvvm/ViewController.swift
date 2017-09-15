//
//  ViewController.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/14/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewController: FeedTableViewController = FeedTableViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = tableViewController
        tableView.dataSource = tableViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

