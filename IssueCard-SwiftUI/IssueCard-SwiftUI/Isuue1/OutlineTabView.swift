//
//  OutlineTabView.swift
//  IssueCard-SwiftUI
//
//  Created by 링키지랩 on 11/7/24.
//

import SwiftUI

struct OutlineTabView: View {
    var body: some View {
        TabView {
            TaxiCallView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("순차 탐색")
                }
            TaxiCallView2()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("임의 탐색")
                }
        }
        .font(.headline)
    }
}

#Preview {
    OutlineTabView()
}
