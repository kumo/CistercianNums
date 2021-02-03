//
//  ContentView.swift
//  Shared
//
//  Created by Robert Clarke on 03/02/21.
//

import SwiftUI

struct CistercianDrawing {
    var line1: Bool
    var line2: Bool
    var line3: Bool
    var line4: Bool
    var line5: Bool
    var line11: Bool
    var line12: Bool
    var line13: Bool
    var line14: Bool
    var line15: Bool
    var line21: Bool
    var line22: Bool
    var line23: Bool
    var line24: Bool
    var line25: Bool
    var line31: Bool
    var line32: Bool
    var line33: Bool
    var line34: Bool
    var line35: Bool
}

struct ContentView: View {
    var number = 9
    
    var drawing = CistercianDrawing(
        line1: true,
        line2: true,
        line3: true,
        line4: true,
        line5: true,
        line11: true,
        line12: true,
        line13: true,
        line14: true,
        line15: true,
        line21: true,
        line22: true,
        line23: true,
        line24: true,
        line25: true,
        line31: true,
        line32: true,
        line33: true,
        line34: true,
        line35: true
    )
    
    var body: some View {
        GeometryReader { geometry in
            
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let top = CGPoint(
                    x: width * 0.5,
                    y: height * 0.0
                )
                
                let bottom = CGPoint(
                    x: width * 0.5,
                    y: height * 1.0
                )
                
                let point1 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.0
                )
                
                let point2 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.25
                )
                
                let point3 = CGPoint(
                    x: width * 0.5,
                    y: height * 0.25
                )
                
                let point4 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.0
                )

                let point11 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.0
                )
                
                let point12 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.25
                )
                
                let point14 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.0
                )

                let point21 = CGPoint(
                    x: width * 0.25,
                    y: height * 1.0
                )
                
                let point22 = CGPoint(
                    x: width * 0.25,
                    y: height * 0.75
                )
                
                let point23 = CGPoint(
                    x: width * 0.5,
                    y: height * 0.75
                )
                
                let point24 = CGPoint(
                    x: width * 0.25,
                    y: height * 1.0
                )
                
                let point31 = CGPoint(
                    x: width * 0.75,
                    y: height * 1.0
                )
                
                let point32 = CGPoint(
                    x: width * 0.75,
                    y: height * 0.75
                )
                
                let point34 = CGPoint(
                    x: width * 0.75,
                    y: height * 1.0
                )

                path.move(to: top)
                path.addLine(to: bottom)
                
                if drawing.line1 == true {
                    path.move(to: top)
                    path.addLine(to: point1)
                }
                
                if drawing.line2 == true {
                    path.move(to: point2)
                    path.addLine(to: point3)
                }
                
                if drawing.line3 == true {
                    path.move(to: top)
                    path.addLine(to: point2)
                }
                
                if drawing.line4 == true {
                    path.move(to: point3)
                    path.addLine(to: point4)
                }
                
                if drawing.line5 == true {
                    path.move(to: point1)
                    path.addLine(to: point2)
                }
                
                if drawing.line11 == true {
                    path.move(to: top)
                    path.addLine(to: point11)
                }
                
                if drawing.line12 == true {
                    path.move(to: point12)
                    path.addLine(to: point3)
                }
                
                if drawing.line13 == true {
                    path.move(to: top)
                    path.addLine(to: point12)
                }
                
                if drawing.line14 == true {
                    path.move(to: point3)
                    path.addLine(to: point14)
                }
                
                if drawing.line15 == true {
                    path.move(to: point11)
                    path.addLine(to: point12)
                }
                
                if drawing.line21 == true {
                    path.move(to: bottom)
                    path.addLine(to: point21)
                }
                
                if drawing.line22 == true {
                    path.move(to: point22)
                    path.addLine(to: point23)
                }
                
                if drawing.line23 == true {
                    path.move(to: bottom)
                    path.addLine(to: point22)
                }
                
                if drawing.line24 == true {
                    path.move(to: point23)
                    path.addLine(to: point24)
                }
                
                if drawing.line25 == true {
                    path.move(to: point21)
                    path.addLine(to: point22)
                }
                
                if drawing.line31 == true {
                    path.move(to: bottom)
                    path.addLine(to: point31)
                }
                
                if drawing.line32 == true {
                    path.move(to: point32)
                    path.addLine(to: point23)
                }
                
                if drawing.line33 == true {
                    path.move(to: bottom)
                    path.addLine(to: point32)
                }
                
                if drawing.line34 == true {
                    path.move(to: point23)
                    path.addLine(to: point34)
                }
                
                if drawing.line35 == true {
                    path.move(to: point31)
                    path.addLine(to: point32)
                }
            }
            .stroke(Color.green, style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
        }
        .aspectRatio(1, contentMode: .fit)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
