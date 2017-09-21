//
//  DetailCardView.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/20/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import UIKit
import Bond
class DetailCardView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var viewModel = Observable<ContentItemViewModel>(ContentItemViewModel())
    weak var delegate: UIViewController?
    
    override func awakeFromNib() {
        setupBinding()
    }
    
    func setupBinding() {
        favButton.reactive.tap.observeNext { [weak self] in
            print("Tap Favorite")
        }
        
        closeButton.reactive.tap.observeNext {
            self.delegate?.dismiss(animated: true, completion: nil)
        }
        
        viewModel.observeNext { viewModel in
            self.titleLabel.text = viewModel.title
            self.subTitleLabel.text = viewModel.subTitle
            self.authorLabel.text = viewModel.author
            self.favButton.imageView?.backgroundColor = viewModel.favorited ? UIColor.red : UIColor.white
        }
    }
}
