//
//  AdsManager.swift
//  AdmobAdvertising
//
//  Created by mac on 5/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdsManager {
    
    static  let shared = AdsManager()
    private init() {}
    
    private var bannerView: GADBannerView!
    private var interstitial: GADInterstitial!
    
    func createAndLoadBanner(delegate: GADBannerViewDelegate, viewController: UIViewController) -> GADBannerView {
        let bannerID = ProcessInfo.processInfo.environment["BANNER_UNIT_ID"]
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = bannerID
        bannerView.rootViewController = viewController
        bannerView.load(GADRequest())
        bannerView.delegate = delegate
        return bannerView
    }
    
    func createAndLoadInterstitial(delegate: GADInterstitialDelegate) -> GADInterstitial {
        let interstitialID = ProcessInfo.processInfo.environment["INTERSTITIAL_UNIT_ID"]
        let interstitial = GADInterstitial(adUnitID: interstitialID!)
        interstitial.delegate = delegate
        interstitial.load(GADRequest())
        return interstitial
    }
}

