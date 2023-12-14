//
//  MeasurementFormatterExtension.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-13.
//

import Foundation

extension MeasurementFormatter{
    
    static var distance: MeasurementFormatter{
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .naturalScale
        formatter.locale = Locale.current
        return formatter
    }
    
}
