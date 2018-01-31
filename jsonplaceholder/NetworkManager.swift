//
//  NetworkManager.swift
//  jsonplaceholder
//
//  Created by Roman Mykitchak on 1/30/18.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    var baseURL:String = "https://jsonplaceholder.typicode.com/photos"
    
    func loadImages(completion: @escaping ([JPImage]?) -> ()){ //-> [JPImage] {
        Alamofire.request(self.baseURL, headers: nil).responseJSON { response in
            debugPrint(response)
            let decoder = JSONDecoder()
            do {
                let bananas = try decoder.decode([JPImage].self, from: response.data!)
                debugPrint(bananas)
                completion(bananas)
            } catch {
                debugPrint("Error occ")
            }
        }
    }
    
    func nextImage(completion: @escaping (UIImage?) -> ()) {
        let jpimage:JPImage = DataManager.sharedInstance.images![DataManager.sharedInstance.realImages.count]
        self.loadImageFrom(urlStr: jpimage.thumbnailUrl) { (realImage) in
            debugPrint("Append image: \(realImage.debugDescription)")
            DataManager.sharedInstance.realImages.append(realImage!)
            completion(realImage)
        }
    }
    
    func loadImageFrom(urlStr:String, completion: @escaping (UIImage?) -> ()) {
        self.getDataFromUrl(urlStr: urlStr) { (data, responce, error) in
            if error != nil {
                debugPrint("Error: \(error!.localizedDescription)")
            } else {
                let bgImage = UIImage(data:data!)
                completion(bgImage)
            }
        }
    }
    
    func getDataFromUrl(urlStr: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: urlStr)
        debugPrint(urlStr)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
