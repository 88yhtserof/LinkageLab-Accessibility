//
//  MapView.swift
//  IssueCard-SwiftUI
//
//  Created by 링키지랩 on 10/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let linkagelab = CLLocationCoordinate2D(latitude: 37.544773, longitude: 127.053746)
    
    
    var body: some View {
        Map {
            Marker("LinkageLab", coordinate: linkagelab)
                .tint(.orange)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
