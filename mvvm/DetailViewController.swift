//
//  DetailViewController.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/20/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var cardView: DetailCardView!
    
    var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardView.delegate = self
        cardView.viewModel.value = ContentItemViewModel(contentItem: viewModel.contentItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DetailViewController {
    struct ViewModel {
        let contentItem: ContentItem
        
        init(contentItem: ContentItem) {
            self.contentItem = contentItem
        }
        
        init() {
            contentItem = ContentItem(id: 0, title: "", author: "", subTitle: "", favorited: false)
        }
    }
}
