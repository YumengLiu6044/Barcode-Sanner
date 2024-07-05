//
//  ScannerView.swift
//  Barcode Sanner
//
//  Created by Yumeng Liu on 7/5/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var barcodeResult: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            self.scannerView.barcodeResult = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
            self.scannerView.barcodeResult = ""
        }
        
        
    }
    
}

#Preview {
    ScannerView(barcodeResult: .constant("Not Yet Scanned"))
}
