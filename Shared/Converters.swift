//
//  Converters.swift
//  Cistercian Numerals
//
//  Created by Robert Clarke on 06/02/21.
//

import Foundation

struct CistercianDrawing: OptionSet {
    let rawValue: Int
    
    static let topRightH = CistercianDrawing(rawValue: 1 << 0)
    static let topMiddleRightH = CistercianDrawing(rawValue: 1 << 1)
    static let topRightDiagDown = CistercianDrawing(rawValue: 1 << 2)
    static let topRightDiagUp = CistercianDrawing(rawValue: 1 << 3)
    static let topRightV = CistercianDrawing(rawValue: 1 << 4)
    static let topLeftH = CistercianDrawing(rawValue: 1 << 5)
    static let topMiddleLeftH = CistercianDrawing(rawValue: 1 << 6)
    static let topLeftDiagDown = CistercianDrawing(rawValue: 1 << 7)
    static let topLeftDiagUp = CistercianDrawing(rawValue: 1 << 8)
    static let topLeftV = CistercianDrawing(rawValue: 1 << 9)
    static let bottomRightH = CistercianDrawing(rawValue: 1 << 10)
    static let bottomMiddleRightH = CistercianDrawing(rawValue: 1 << 11)
    static let bottomRightDiagUp = CistercianDrawing(rawValue: 1 << 12)
    static let bottomRightDiagDown = CistercianDrawing(rawValue: 1 << 13)
    static let bottomRightV = CistercianDrawing(rawValue: 1 << 14)
    static let bottomLeftH = CistercianDrawing(rawValue: 1 << 15)
    static let bottomMiddleLeftH = CistercianDrawing(rawValue: 1 << 16)
    static let bottomLeftDiagUp = CistercianDrawing(rawValue: 1 << 17)
    static let bottomMiddleLeftDiagDown = CistercianDrawing(rawValue: 1 << 18)
    static let bottomLeftV = CistercianDrawing(rawValue: 1 << 19)
}

func convertValue(value: Int) -> CistercianDrawing {
    let data: [(Int, CistercianDrawing)] = [
        (9000, [.bottomLeftV, .bottomMiddleLeftH, .bottomLeftH]),
        (8000, [.bottomLeftV, .bottomMiddleLeftH]),
        (7000, [.bottomLeftV, .bottomLeftH]),
        (6000, [.bottomLeftV]),
        (5000, [.bottomLeftDiagUp, .bottomLeftH]),
        (4000, [.bottomLeftDiagUp]),
        (3000, [.bottomMiddleLeftDiagDown]),
        (2000, [.bottomMiddleLeftH]),
        (1000, [.bottomLeftH]),
        (900, [.bottomRightV, .bottomMiddleRightH, .bottomRightH]),
        (800, [.bottomRightV, .bottomMiddleRightH]),
        (700, [.bottomRightV, .bottomRightH]),
        (600, [.bottomRightV]),
        (500, [.bottomRightDiagUp, .bottomRightH]),
        (400, [.bottomRightDiagUp]),
        (300, [.bottomRightDiagDown]),
        (200, [.bottomMiddleRightH]),
        (100, [.bottomRightH]),
        (90, [.topLeftV, .topMiddleLeftH, .topLeftH]),
        (80, [.topLeftV, .topMiddleLeftH]),
        (70, [.topLeftV, .topLeftH]),
        (60, [.topLeftV]),
        (50, [.topLeftDiagUp, .topLeftH]),
        (40, [.topLeftDiagUp]),
        (30, [.topLeftDiagDown]),
        (20, [.topMiddleLeftH]),
        (10, [.topLeftH]),
        (9, [.topRightV, .topMiddleRightH, .topRightH]),
        (8, [.topRightV, .topMiddleRightH]),
        (7, [.topRightV, .topRightH]),
        (6, [.topRightV]),
        (5, [.topRightDiagUp, .topRightH]),
        (4, [.topRightDiagUp]),
        (3, [.topRightDiagDown]),
        (2, [.topMiddleRightH]),
        (1, [.topRightH])
    ]
    
    var convertableValue = value
    
    var result = CistercianDrawing()
    
    for (number, lines) in data {
        if number <= convertableValue {
            result.insert(lines)
            convertableValue = convertableValue - number
        }
    }
    
    return result
}

func convertValue2(value: String) -> CistercianDrawing? {
    guard var convertMe = Int(value) else {
        return nil
    }
    
    guard convertMe > 0 && convertMe < 10_000 else {
        return CistercianDrawing()
    }
    
    var conversionData: [(Int, CistercianDrawing)] = [
        (9000, [.bottomLeftV, .bottomMiddleLeftH, .bottomLeftH]),
        (8000, [.bottomLeftV, .bottomMiddleLeftH]),
        (7000, [.bottomLeftV, .bottomLeftH]),
        (6000, [.bottomLeftV]),
        (5000, [.bottomMiddleLeftDiagDown, .bottomLeftH]),
        (4000, [.bottomMiddleLeftDiagDown]),
        (3000, [.bottomLeftDiagUp]),
        (2000, [.bottomMiddleLeftH]),
        (1000, [.bottomLeftH]),
    ]

    var result = CistercianDrawing()

    for _ in 0...3 {
        for (index, data) in conversionData.enumerated() {
            if data.0 <= convertMe {
                result.insert(data.1)
                convertMe = convertMe - data.0
            }
            
            conversionData[index] = (data.0 / 10, CistercianDrawing(rawValue: data.1.rawValue >> 5))
        }
    }
    
    return result
}
