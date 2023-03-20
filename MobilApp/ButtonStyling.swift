//
//  ButtonStyling.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 30/09/2022.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

var backgroundColor: Color = .green
var textColor: Color = Color.white
var height: CGFloat = 90
var cornerRadius: CGFloat = 15
var fontSize: CGFloat = 17
var disabled: Bool = false
var textSidePadding: CGFloat = 20
var weight: Font.Weight = .semibold

func makeBody(configuration: Configuration) -> some View {
    configuration.label
        .padding([.leading, .trailing], textSidePadding)
        .frame(maxWidth: .infinity, maxHeight: height)
        .background(disabled ? .gray : backgroundColor)
        .foregroundColor(textColor)
        .cornerRadius(cornerRadius)
        .font(.system(size: fontSize, weight: weight, design: .default))
        .scaleEffect(configuration.isPressed ? 1.2 : 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
       
        }
        
    }

