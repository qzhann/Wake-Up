//
//  Color+Helpers.swift
//  Wake Up WatchKit Extension
//
//  Created by Zihan Qi on 4/26/20.
//  Copyright © 2020 Zihan Qi. All rights reserved.
//

import Foundation
import SwiftUI


extension Color {
    
    /// Initializes a Color using rgb value of range 0-255.
    init(integerValueRed red: Int, green: Int, blue: Int) {
        let maxValue = 255.0
        self.init(red: Double(red) / maxValue, green: Double(green) / maxValue, blue: Double(blue) / maxValue)
    }
    static var systemRed: Color {
        Color(integerValueRed: 255, green: 59, blue: 48)
    }
    static var systemOrange: Color {
        Color(integerValueRed: 255, green: 149, blue: 0)
    }
    static var systemYellow: Color {
        Color(integerValueRed: 255, green: 230, blue: 32)
    }
    static var systemGreen: Color {
        Color(integerValueRed: 4, green: 222, blue: 113)
    }
    static var systemMint: Color {
        Color(integerValueRed: 0, green: 245, blue: 234)
    }
    static var systemTealBlue: Color {
        Color(integerValueRed: 90, green: 200, blue: 250)
    }
    static var systemBlue: Color {
        Color(integerValueRed: 32, green: 148, blue: 250)
    }
    static var systemPurple: Color {
        Color(integerValueRed: 120, green: 122, blue: 255)
    }
    static var systemPink: Color {
        Color(integerValueRed: 250, green: 17, blue: 79)
    }
    static var systemGrey: Color {
        Color(integerValueRed: 155, green: 160, blue: 170)
    }
    static var systemTextGrey: Color {
        Color(integerValueRed: 174, green: 180, blue: 191)
    }
    
    static var darkText: Color {
        Color(integerValueRed: 34, green: 34, blue: 35)
    }
    static var darkOrange: Color {
        Color(integerValueRed: 179, green: 106, blue: 7)
    }
    static var darkBackground: Color {
        Color(integerValueRed: 51, green: 51, blue: 51)
    }
    static var buttonBackground: Color {
        Color(integerValueRed: 30, green: 30, blue: 30)
    }
}

// MARK: - View model
extension Color {
    static func listRowPlatterColor(for alarmDay: AlarmDay, in userData: UserData) -> Color {
        let sheduleState = alarmDay.alarmScheduleState(in: userData)
        switch sheduleState {
        case .futureActive, .ringing:
            return .systemOrange
        case .futureMuted:
            return .darkOrange
        case .pastActive, .pastMuted, .noAlarm:
            return .darkBackground
        }
    }
    
    static func rowActionBackgroundColor(for alarmDay: AlarmDay) -> Color {
        guard let alarm = alarmDay.alarm else { return .clear }
        if alarm.isMuted {
            return .systemOrange
        } else {
            return .systemGrey
        }
    }
    
    static func primaryTextColor(for alarmDay: AlarmDay, in userData: UserData) -> Color {
        let sheduleState = alarmDay.alarmScheduleState(in: userData)
        switch sheduleState {
        case .futureActive, .ringing, .futureMuted:
            return .darkText
        case .pastActive, .pastMuted, .noAlarm:
            return .white
        }
    }
    
    static func secondaryTextColor(for alarmDay: AlarmDay, in userData: UserData) -> Color {
        let sheduleState = alarmDay.alarmScheduleState(in: userData)
        switch sheduleState {
        case .futureActive, .ringing, .futureMuted:
            return .white
        case .pastActive, .pastMuted, .noAlarm:
            return .systemTextGrey
        }
    }
    
    static func alarmStateImageColor(for alarmDay: AlarmDay, in userData: UserData) -> Color {
        let sheduleState = alarmDay.alarmScheduleState(in: userData)
        switch sheduleState {
        case .pastActive:
            return .systemOrange
        default:
            return .secondaryTextColor(for: alarmDay, in: userData)
        }
    }
}

struct ColorsPreview: PreviewProvider {
    
    static var systemColors: [Color] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemMint, .systemTealBlue, .systemBlue, .systemPurple, .systemPink, .systemGrey, .systemTextGrey, .darkText, .darkOrange, .darkBackground]
    static var colorNames: [Color: String] = [.systemRed: "Red", .systemOrange: "Orange", .systemYellow: "Yellow", .systemGreen: "Green", .systemMint: "Mint", .systemTealBlue: "TealBlue", .systemBlue: "Blue", .systemPurple: "Purple", .systemPink: "Pink", .systemGrey: "Grey", .systemTextGrey: "TextGrey", .darkText: "DarkText", .darkOrange: "DarkOrange", .darkBackground: "DarkBackground"]
    
    static var previews: some View {
        
        ForEach(systemColors, id: \.self) { color in
            Spacer()
                .frame(width: 80, height: 60)
                .background(color)
                .previewDisplayName("\(color)")
        }
        .previewLayout(.sizeThatFits)
    }
}
