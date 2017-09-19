//
//  ContentItemModelController.swift
//  mvvm
//
//  Created by Sam Phomsopha on 9/15/17.
//  Copyright © 2017 Whalerock Industries. All rights reserved.
//

import Foundation

struct ContentItemModelController {
    
    static func fetchContentItems() -> [ContentItem] {
        var contentItem = ContentItem(title: "My Story 1", author: "by Sam P", subTitle: "My Sub 1", favorited: false)
        var contentItems:[ContentItem] = []
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 2", author: "by Sam P", subTitle: "My Sub 2", favorited: true)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 3", author: "by Sam P", subTitle: "My Sub 3", favorited: false)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 4", author: "by Sam P", subTitle: "My Sub 4", favorited: false)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 5", author: "by Sam P", subTitle: "My Sub 5", favorited: true)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 6", author: "by Sam P", subTitle: "My Sub 6", favorited: false)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 7", author: "by Sam P", subTitle: "My Sub 7", favorited: false)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 8", author: "by Sam P", subTitle: "My Sub 8", favorited: false)
        contentItems.append(contentItem)
        
        contentItem = ContentItem(title: "My Story 9", author: "by Sam P", subTitle: "My Sub 9", favorited: false)
        contentItems.append(contentItem)
        
        return contentItems
    }
}
