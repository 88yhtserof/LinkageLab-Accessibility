//
//  TaxiCallView.swift
//  IssueCard-SwiftUI
//
//  Created by 링키지랩 on 10/21/24.
//

import SwiftUI
import MapKit

struct TaxiCallView: View {
    
    var category = "일반택시"
    var capacity = "주변 4인승 택시 호출"
    var estimatedArrivalTime = "3분"
    var estimatedFare = "예상 22,000"
    
    var accessibilityTaxiInfo: String {
        [ category, capacity, estimatedArrivalTime ]
            .joined(separator: " ")
    }
    
    
    var body: some View {
        MapView()
//            .accessibilitySortPriority(0.5)
        
        ZStack {
            VStack {
                Color.clear
                    .contentShape(Rectangle())
            }
            .frame(height: 100)
            .frame(maxWidth: 380)
            .background(Color(red: 235 / 255, green: 247 / 255, blue: 255 / 255))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top)
            .accessibilityElement()
            .accessibilityLabel(accessibilityTaxiInfo)
//            .accessibilitySortPriority(0.3)
            
            HStack {
                Image(systemName: "car")
                    .padding(.leading)
                    .frame(width: 50, height: 50)
                    .accessibilityHidden(true)
                
                VStack {
                    HStack {
                        Text(category)
                            .accessibilityHidden(true)
                        Spacer()
                        HStack {
                            Image(systemName: "info.circle")
                            Text(estimatedFare)
                        }
                        .accessibilityElement()
                        .accessibilityLabel(estimatedFare)
//                        .accessibilitySortPriority(0.1)
                    }
                    
                    HStack {
                        Text(capacity)
                        Text(estimatedArrivalTime)
                        Spacer()
                    }
                    .accessibilityHidden(true)
                }
                .padding(.trailing, 20)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .fixedSize(horizontal: true, vertical: true)
    }
}

#Preview {
    TaxiCallView()
}
