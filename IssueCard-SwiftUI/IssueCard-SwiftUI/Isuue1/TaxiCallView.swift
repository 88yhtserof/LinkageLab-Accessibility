//
//  TaxiCallView.swift
//  IssueCard-SwiftUI
//
//  Created by 링키지랩 on 10/21/24.
//

import SwiftUI
import MapKit
struct TaxiCallView: View {
    var body: some View {
        MapView()
        VStack {
            HStack {
                Image(systemName: "car")
//                    .frame(width: 50, height: 50)
                    .padding(.leading)
                
                VStack {
                    HStack {
                        Text("일반택시")
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "info.circle")
                            Text("예상 22,000")
                        }
                    }
                    HStack {
                        Text("주변 4인승 택시 호출")
                        Text("3분")
                        Spacer()
                    }
                }
                .padding(.leading)
                .padding(.trailing, 20)
            }
            .frame(height: 100)
            .frame(maxWidth: 380)
            .background(Color(red: 235 / 255, green: 247 / 255, blue: 255 / 255))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top)
            
            
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    TaxiCallView()
}
