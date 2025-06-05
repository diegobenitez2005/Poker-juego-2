//
//  String+format.swift
//  tarea_poker_2
//
//  Created by bootcamp on 2025-06-04.
//
import UIKit
import Foundation

extension Date {
    func formatearFecha() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter.string(from: self)
    }
}


