//
//  AlbumListViewModel.swift
//  AlbumDemo
//
//  Created by wuwulailai on 2017/8/23.
//  Copyright © 2017年 wuwulailai. All rights reserved.
//

import UIKit
import Photos

class AlbumListViewModel: NSObject {

    var selectedFiles: [AlbumFile] {
        get {
            var array: [AlbumFile] = Array()
            for item in self.selectedItems {
                array.append(item.value)
            }
            return array
        }
    }
    
    var selectedItems: Dictionary<String, AlbumFile> = Dictionary.init()
    var maxSelectCount = 20
    var disableSelectedMore = false

    var albumList: [AlbumCollection] = []

    fileprivate var isRefreshing = false
    func refreshData(_ complete: @escaping ()->Void ) {
        if isRefreshing {
            return
        } else {
            isRefreshing = true
        }
        self.albumList = self.fetchAlbumsList()
        complete()
        self.isRefreshing = false
    }

    
    func fetchAlbumsList() -> [AlbumCollection] {
        
        var collections: [AlbumCollection] = Array.init()
        
        self.fetchAlbum(with: PHAssetCollectionType.smartAlbum, subtype: PHAssetCollectionSubtype.any, options: nil, toArray: &collections, reName:nil)
        
        self.fetchAlbum(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.albumRegular, options: nil, toArray: &collections, reName:nil)
        
        return collections
    }
    
    func fetchAlbum(with: PHAssetCollectionType, subtype: PHAssetCollectionSubtype, options: PHFetchOptions?, toArray: UnsafeMutablePointer<[AlbumCollection]>, reName:String?) -> Void {
        let results: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAlbum(with: with, subtype: subtype, options: options)
        results.enumerateObjects({ (collection, index, stop) in
            let result = PHAsset.fetchAssets(in: collection, options: nil)
            if result.count > 0 {
                let mycollection = AlbumCollection.init(with: collection)
                if let reName = reName {
                    mycollection.name = reName
                }
                toArray.pointee.append(mycollection)
            }
        })
    }
}

