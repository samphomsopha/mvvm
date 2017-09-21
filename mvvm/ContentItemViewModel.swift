//
//  ContentItemViewModel.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/20/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import Foundation

struct ContentItemViewModel {
    let contentItem: ContentItem
    let id: Int
    let title: String
    let subTitle: String
    let author: String
    var favorited: Bool
    
    init(contentItem: ContentItem) {
        self.contentItem = contentItem
        id = contentItem.id
        title = contentItem.title
        subTitle = contentItem.subTitle
        author = contentItem.author
        favorited = FavoritesDataManager.shared.isFavorited(contentItem: contentItem)
    }
    
    init() {
        contentItem = ContentItem(id: 0, title: "", author: "", subTitle: "")
        id = 0
        title = ""
        subTitle = ""
        author = ""
        favorited = false
    }
}
