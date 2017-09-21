//
//  FavoriteContentDataManager.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/20/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import Foundation
import Bond

class FavoritesDataManager {
    var favorites = Observable<[ContentItem]>([])
    static let shared = FavoritesDataManager()
    
    init() {
        let contentItem = ContentItem(id: 2, title: "My Story 3", author: "by Sam P", subTitle: "My Sub 3")
        favorites.value.append(contentItem)
    }
    
    func toggleFavorite(contentItem: ContentItem) {
        //save and return new contentItem
        if let index = favorites.value.index(where: { (item) -> Bool in
            item.id == contentItem.id
        }) {
            favorites.value.remove(at: index)
        } else {
            favorites.value.append(contentItem)
        }
    }
    
    func isFavorited(contentItem: ContentItem) -> Bool {
        if let _ = favorites.value.index(where: { (item) -> Bool in
            item.id == contentItem.id
        }) {
            return true
        }
        
        return false
    }
}
