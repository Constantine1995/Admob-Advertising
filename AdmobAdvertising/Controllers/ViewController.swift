//
//  ViewController.swift
//  AdmobAdvertising
//
//  Created by mac on 5/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!

    var interstitialButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.setTitle("Show interstitial", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 0.06543179506, blue: 0, alpha: 1)
        button.addTarget(self, action: #selector(showInterstitial(_ :)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initServices()
        setupBannerView(bannerView)
        setupInterstitialView()
    }
    
    func initServices()
    {
        bannerView = createAndLoadBanner()
        interstitial = createAndLoadInterstitial()
    }
    
    func createAndLoadBanner() -> GADBannerView {
        let bannerID = ProcessInfo.processInfo.environment["BANNER_UNIT_ID"]
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = bannerID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        return bannerView
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitialID = ProcessInfo.processInfo.environment["INTERSTITIAL_UNIT_ID"]
        let interstitial = GADInterstitial(adUnitID: interstitialID!)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func setupBannerView(_ bannerView: GADBannerView) {
        view.addSubview(bannerView)
        bannerView.setAnchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: -30, width: 320, height: 50)
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupInterstitialView() {
        view.addSubview(interstitialButton)
        interstitialButton.setAnchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 200, height: 50)
        interstitialButton.setCenterUIScreen(view)
    }
    
    @objc func showInterstitial(_ : UIButton) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
}

