//
//  JPImage.swift
//  jsonplaceholder
//
//  Created by Roman Mykitchak on 1/30/18.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//

import Foundation

struct JPImage: Codable {
    var albumId:Int
    var id:Int
    var title:String
    var url:String
    var thumbnailUrl:String
}

/*{
 "albumId": 1,
 "id": 1,
 "title": "accusamus beatae ad facilis cum similique qui sunt",
 "url": "http://placehold.it/600/92c952",
 "thumbnailUrl": "http://placehold.it/150/92c952"
 },*/
