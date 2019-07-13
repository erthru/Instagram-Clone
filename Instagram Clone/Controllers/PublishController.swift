//
//  PublishController.swift
//  Instagram Clone
//
//  Created by Suprianto Djamalu on 13/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PublishController: UIViewController{
    
    private let imgSelected = UIImageView(image: UIImage(named: "img_placeholder"))
    private let collectionLibrary = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var libraries = [UIImage]()
    private var didLibariesReady = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLibrary()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupUI()
    }
    
    private func fetchLibrary(){
        
        PHPhotoLibrary.requestAuthorization({ status in
            
            switch status{
            case .authorized:
                
                let imgManager = PHImageManager.default()
                let requestOptions = PHImageRequestOptions()
                requestOptions.isSynchronous = true
                
                let fetchOptions = PHFetchOptions()
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                
                for i in 0..<fetchResult.count {
                    let asset = fetchResult.object(at: i) as PHAsset
                    imgManager.requestImage(for: asset, targetSize: UIScreen.main.bounds.size, contentMode: .aspectFill, options: requestOptions, resultHandler: { uiimage, info in
                        self.libraries.append(uiimage!)
                    })
                }
                
                DispatchQueue.main.async {
                    self.didLibariesReady = true
                    self.imgSelected.image = self.libraries[0]
                    self.collectionLibrary.reloadData()
                }
                
                break
            case .denied:
                self.fetchLibrary()
                break
            case .notDetermined:
                self.fetchLibrary()
                break
            case .restricted:
                self.fetchLibrary()
                break
            @unknown default:
                break
            }
            
        })
        
    }
    
    private func setupUI(){
        
        // view
        view.addSubview(imgSelected)
        view.addSubview(collectionLibrary)
        
        // navigation
        navigationItem.title = "All Photos"
        let rightButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: nil)
        rightButtonItem.tintColor = .blue
        navigationItem.rightBarButtonItem = rightButtonItem
        
        // imgSelected
        imgSelected.translatesAutoresizingMaskIntoConstraints = false
        imgSelected.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imgSelected.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgSelected.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgSelected.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        // collectionLibrary
        collectionLibrary.translatesAutoresizingMaskIntoConstraints = false
        collectionLibrary.topAnchor.constraint(equalTo: imgSelected.bottomAnchor, constant: 2).isActive = true
        collectionLibrary.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionLibrary.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionLibrary.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionLibrary.backgroundColor = .white
        collectionLibrary.register(LibraryCell.self, forCellWithReuseIdentifier: "LibraryCell")
        collectionLibrary.dataSource = self
        collectionLibrary.delegate = self
        
    }
    
}

extension PublishController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return libraries.count
    }
    
}

extension PublishController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as! LibraryCell
        cell.build(image: libraries[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if didLibariesReady {
            
            imgSelected.image = libraries[indexPath.row]
            
        }
        
    }
    
}

extension PublishController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 4) - 8, height: (view.frame.width / 4) - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
}
