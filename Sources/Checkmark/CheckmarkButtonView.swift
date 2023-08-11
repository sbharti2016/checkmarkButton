//
//  CheckmarkButtonView.swift
//  ButtonUI
//
//  Created by Sanjeev Bharti on 7/28/23.
//

import SwiftUI

public enum FillModeEnum {
    case empty
    case fill
}

@available(iOS 13.0, *)
public struct CheckmarkButtonView: View {
    
    @Binding public var isSelected: Bool
    
    public var foregroundColor: Color
    public var fillMode: FillModeEnum
    public var maxWidth: CGFloat
    
    private var fillImageName: String
    private var emptyImageName: String
    
    public init(isSelected: Binding<Bool>, foregroundColor: Color = .primary, fillMode: FillModeEnum = .empty, maxWidth: CGFloat = 40.0) {
        _isSelected = isSelected
        self.foregroundColor = foregroundColor
        self.fillMode = fillMode
        self.maxWidth = maxWidth
        emptyImageName = fillMode == .empty ? "square" : "square.fill"
        fillImageName = fillMode == .empty ? "checkmark.square" : "checkmark.square.fill"
    }
    
    public var body: some View {
        
        Button {
            isSelected.toggle()
        } label: {
        
            Image(systemName: isSelected ? fillImageName : emptyImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
                .frame(width: maxWidth)
                .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.1), value: isSelected)
        }

    }
}
