//
//  ContentItemCardView.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/14/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit
import Bond

protocol ContentItemCardViewDelegate:class {
    func didTapViewDetail(contentItem: ContentItem) -> Void
}

class ContentItemCardView: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var viewButton: UIButton!
    
    var viewModel = Observable<ContentItemViewModel>(ContentItemViewModel())
    weak var delegate: ContentItemCardViewDelegate?
    
    override func awakeFromNib() {
        setupBinding()
    }
    
    func setupBinding() {
        favoriteButton.reactive.tap.observeNext {[weak self] in
            print("Tap Button For \(String(describing: self?.viewModel.value.title))")
            FavoritesDataManager.shared.toggleFavorite(contentItem: (self?.viewModel.value.contentItem)!)
        }
        
        viewButton.reactive.tap.observeNext { [weak self] in
            print("View Button For \(String(describing: self?.viewModel.value.title))")
            self?.delegate?.didTapViewDetail(contentItem: (self?.viewModel.value.contentItem)!)
        }
        
        viewModel.observeNext { viewModel in
            self.titleLabel.text = viewModel.title
            self.subTitleLabel.text = viewModel.subTitle
            self.authorLabel.text = viewModel.author
            self.favoriteButton.imageView?.backgroundColor = viewModel.favorited ? UIColor.red : UIColor.white
        }
        
        FavoritesDataManager.shared.favorites.observeNext { contentItem in
            self.viewModel.value.favorited = FavoritesDataManager.shared.isFavorited(contentItem: self.viewModel.value.contentItem)
        }
    }
}
