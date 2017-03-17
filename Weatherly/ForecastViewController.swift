//
//  ForecastViewController.swift
//  Weatherly
//
//  Created by Bettina on 12/29/16.
//  Copyright © 2016 Bettina Prophete. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var forecast: BPForecast?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        
        let location = CLLocation(latitude: 40.7362553, longitude: -73.9925026)
        

    }
    
    //MARK: - Setup
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.blue
        
    }
    

}

//MARK: - UICollectionViewDataSource

extension ForecastViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let forecast = forecast else {
            return 0
        }
        
        return forecast.locationModels().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let forecast = forecast else {
            return UICollectionViewCell()
        }
        
        let item = forecast.locationModels()[indexPath.item]
        
        if let item = item as? BPLocationCurrent {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! BPLocationCurrentCell
            cell.configure(locationCurrent: item)
            return cell
            
        } else if let item = item as? BPLocationHourly {
            
        } else if let item = item as? BPLocationDaily {
            
        } else {
            return UICollectionViewCell()
        }
    }
}

//MARK: - UICollectionViewDelegate

extension ForecastViewController: UICollectionViewDelegate {
    
}
