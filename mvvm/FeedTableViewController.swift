//
//  FeedTableViewController.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/14/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    weak var delegate: UIViewController?
    var viewModel: ViewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.contentItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCellView", for: indexPath) as! ContentItemCardView
        let cellViewModel = ContentItemViewModel(contentItem: viewModel.contentItems[indexPath.row])
        cell.viewModel.value = cellViewModel
        cell.delegate = self
        return cell
    }
}

extension FeedTableViewController: ContentItemCardViewDelegate {
    func didTapViewDetail(contentItem: ContentItem) {
        //show detail view
        let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.viewModel = DetailViewController.ViewModel(contentItem: contentItem)
        delegate?.present(detailViewController, animated: true, completion: nil)
    }
}

extension FeedTableViewController {
    struct ViewModel {
        let contentItems: [ContentItem]
    
        init(contentItems: [ContentItem]) {
            self.contentItems = contentItems
        }
        
        init() {
            contentItems = []
        }
    }
}
