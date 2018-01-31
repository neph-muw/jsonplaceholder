//
//  DataManager.swift
//  jsonplaceholder
//
//  Created by Roman Mykitchak on 1/30/18.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    static let sharedInstance = DataManager()
    
    var images:[JPImage]?
    @objc dynamic var realImages:[UIImage] = [UIImage]()
    
    
    var observation: NSKeyValueObservation?
    
}

//protocol MyObserverDelegate {
//    func observedVaslue(v:NSKeyValueObservedChange<[UIImage]>)
//}
//
//class MyObserver: NSObject {
//    @objc var objectToObserve: [UIImage]//realImages
//    var observation: NSKeyValueObservation?
//    var delegate:MyObserverDelegate?
//    
//    init(object: [UIImage]) {
//        objectToObserve = object
//        super.init()
//        
//        observation = observe(\.objectToObserve, changeHandler: { (object, change) in
//            if self.delegate != nil {
//                self.delegate?.observedVaslue(v: change)
//            }
//        })
//        
// 
//    }
//}

