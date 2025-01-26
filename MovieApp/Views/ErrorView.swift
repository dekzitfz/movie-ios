//
//  ErrorView.swift
//  MovieApp
//
//  Created by Adi Andrea on 26/01/25.
//
import SwiftUI

struct ErrorView: View {
    let message: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Error")
                .font(.title)
            Text(message)
                .foregroundStyle(.secondary)
            
            Button("Retry", action: action)
                .buttonStyle(.borderedProminent)
        }
    }
}
