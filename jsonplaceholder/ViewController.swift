//
//  ViewController.swift
//  jsonplaceholder
//
//  Created by Roman Mykitchak on 1/30/18.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource/*, MyObserverDelegate*/ {

    @IBOutlet weak var collectionView: UICollectionView!
//    var observer:MyObserver!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let observed = DataManager.sharedInstance.realImages
//        self.observer = MyObserver(object: observed)
//        self.observer.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addElement(_ sender: Any) {
        if DataManager.sharedInstance.images == nil {
            NetworkManager.sharedInstance.loadImages(completion: { (images) in
                DataManager.sharedInstance.images = images
                NetworkManager.sharedInstance.nextImage(completion: { (img) in
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                })
            })
        } else {
            NetworkManager.sharedInstance.nextImage(completion: { (img) in
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        }
    }
    
    @IBAction func clearList(_ sender: Any) {
        DataManager.sharedInstance.images = nil
        DataManager.sharedInstance.realImages = [UIImage]()
        self.collectionView.reloadData()
    }
    
    //UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if DataManager.sharedInstance.realImages.count != 0 {
            return DataManager.sharedInstance.realImages.count
        } else {
            return 0
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:JPCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "jpcell",
                                                                           for: indexPath) as! JPCollectionViewCell
        cell.imageCollectionView.image = DataManager.sharedInstance.realImages[indexPath.row]
        cell.labelCollectionView.text = DataManager.sharedInstance.images![indexPath.row].title
        return cell
    }
    
//    func observedVaslue(v:NSKeyValueObservedChange<[UIImage]>) {
//        debugPrint("observedVaslue")
//        self.collectionView.reloadData()
//    }
}

