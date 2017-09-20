//
//  ContentItemCardView.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/14/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit
import Bond

class ContentItemCardView: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var viewModel: ViewModel = ViewModel() {
        didSet {
            titleLabel.text = viewModel.title
            subTitleLabel.text = viewModel.subTitle
            authorLabel.text = viewModel.author
            
            if viewModel.favorited {
                favoriteButton.imageView?.backgroundColor = UIColor.red
            }
        }
    }
    
    override func awakeFromNib() {
        setupBinding()
    }
    
    func setupBinding() {
        favoriteButton.reactive.tap.observeNext {[weak self] in
            print("Tap Button For \(String(describing: self?.viewModel.title))")
        }
    }
}

extension ContentItemCardView {
    struct ViewModel {
        let title: String
        let subTitle: String
        let author: String
        let favorited: Bool
    }
}

extension ContentItemCardView.ViewModel {
    init(contentItem: ContentItem) {
        title = contentItem.title
        subTitle = contentItem.subTitle
        author = contentItem.author
        favorited = contentItem.favorited
    }
    
    init() {
        title = ""
        subTitle = ""
        author = ""
        favorited = false
    }
}
