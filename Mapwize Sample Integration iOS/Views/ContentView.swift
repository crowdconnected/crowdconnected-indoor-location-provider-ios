//
//  ContentView.swift
//  Mapwize Sample Integration iOS
//
//  Created by Robert Tanase on 29/06/2021.
//

import SwiftUI
import CrowdConnectedCore
import MapwizeUI

struct ContentView: View {
    var body: some View {
        MapwizeView()
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                CrowdConnected.shared.startNavigation()
            })
            .onDisappear(perform: {
                CrowdConnected.shared.stopNavigation()
            })
    }
}
