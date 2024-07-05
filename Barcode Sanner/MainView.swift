//
//  ContentView.swift
//  Barcode Sanner
//
//  Created by Yumeng Liu on 7/5/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var scannerViewModel = ScannerViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(barcodeResult: $scannerViewModel.barcodeValue)
                    .frame(maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 10))
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text(scannerViewModel.statusText)
                    .font(.largeTitle)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                    .fontWeight(.bold)
                    .foregroundStyle(scannerViewModel.statusTextColor)
                    .padding()
                    .transition(.blurReplace())
                    .animation(.easeIn, value: scannerViewModel.statusText)
                
            }
            .navigationTitle("Barcode Scanner")
            .padding()
            
        }
    }
}


extension AnyTransition {
    static func blurReplace() -> AnyTransition {
        AnyTransition.opacity.combined(with: .opacity)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
