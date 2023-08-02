//
//  ContentView.swift
//  ProjectX
//
//  Created by Damodar Namala on 02/08/23.
//

import SwiftUI
import Core

struct ContentView: View {
    @State var addItem: Bool = false
    var body: some View {
        VStack {
            
        }
        .padding()
        .sheet(isPresented: $addItem) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


