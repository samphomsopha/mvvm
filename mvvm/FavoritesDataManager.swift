//
//  FavoriteContentDataManager.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/20/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import Foundation
class FavoritesDataManager {
    var favorites: [ContentItem] = []
    let shared = FavoritesDataManager()
    
    func toggleFavorite(contentItem: ContentItem) {
        //save and return new contentItem
        if let index = favorites.index(where: { (item) -> Bool in
            item.id == contentItem.id
        }) {
            favorites.remove(at: index)
        } else {
            favorites.append(contentItem)
        }
    }
}
