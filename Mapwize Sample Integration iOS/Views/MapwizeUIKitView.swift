//
//  MapwizeUIKitView.swift
//  Mapwize Sample Integration iOS
//
//  Created by Robert Tanase on 29/06/2021.
//

import UIKit
import MapwizeUI

class MapwizeUIKitView: UIView {
    
    private let locationProvider: CrowdConnectedLocationProvider = CrowdConnectedLocationProvider()
    private var mapView: MWZUIView
    
    init() {
        mapView = MWZUIView(frame: .zero, mapwizeOptions: MWZUIOptions(), uiSettings: MWZUISettings())
        super.init(frame: .zero)

        setupView()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
    
        addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

extension MapwizeUIKitView: MWZUIViewDelegate {

    func mapwizeViewDidLoad(_ mapwizeView: MWZUIView) {
        locationProvider.start()
        mapView.setIndoorLocationProvider(locationProvider)
    }
}
