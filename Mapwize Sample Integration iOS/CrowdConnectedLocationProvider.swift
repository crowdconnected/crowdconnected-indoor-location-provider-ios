//
//  CrowdConnectedLocationProvider.swift
//  Mapwize Sample Integration iOS
//
//  Created by Robert Tanase on 29/06/2021.
//

import IndoorLocation
import CrowdConnectedCore

class CrowdConnectedLocationProvider: ILIndoorLocationProvider {

    private var isRunning = false

    override init() {
        super.init()

        CrowdConnected.shared.start(appKey: "YOUR_APP_KEY", token: "YOUR_TOKEN", secret: "YOUR_SECRET") { deviceId, error in
            guard error == nil else {
                // Check credentials/network connection
                return
            }
        }
        CrowdConnected.shared.delegate = self
    }

    override func start() {
        isRunning = true
    }
    
    override func stop() {
        isRunning = false
    }
    
    override func isStarted() -> Bool {
        isRunning
    }
    
    override func supportsFloor() -> Bool {
        true
    }
}

extension CrowdConnectedLocationProvider: CrowdConnectedDelegate {

    func didUpdateLocation(_ locations: [Location]) {
        guard isRunning else { return }

        for location in locations {
            let indoorLocation = ILIndoorLocation(provider: self,
                                                  latitude: location.latitude,
                                                  longitude: location.longitude,
                                                  floor: location.floor as NSNumber)
            dispatchDidUpdate(indoorLocation)
        }
    }
}
