//
//  MapwizeView.swift
//  Mapwize Sample Integration iOS
//
//  Created by Robert Tanase on 29/06/2021.
//

import SwiftUI

struct MapwizeView: UIViewRepresentable {

    func makeUIView(context: Context) -> MapwizeUIKitView {
        return MapwizeUIKitView()
    }
    
    func updateUIView(_ uiView: MapwizeUIKitView, context: Context) { }
}
