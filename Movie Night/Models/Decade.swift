//
//  Decade.swift
//  Movie Night
//
//  Created by Lukas Kasakaitis on 12.07.19.
//  Copyright © 2019 Lukas Kasakaitis. All rights reserved.
//

import Foundation

enum Decade {

    case nineteenTwenties
    case nineteenThirties
    case nineteenForties
    case nineteenFifties
    case nineteenSixties
    case nineteenSeventies
    case nineteenEighties
    case nineteenNineties
    case twoThousands
    case twentyTens
    
    
    var startDate: String {
        switch self {
        case .nineteenTwenties:
            return "1920-01-01"
        case .nineteenThirties:
            return "1930-01-01"
        case .nineteenForties:
            return "1940-01-01"
        case .nineteenFifties:
            return "1950-01-01"
        case .nineteenSixties:
            return "1960-01-01"
        case .nineteenSeventies:
            return "1970-01-01"
        case .nineteenEighties:
            return "1980-01-01"
        case .nineteenNineties:
            return "1990-01-01"
        case .twoThousands:
            return "2000-01-01"
        case .twentyTens:
            return "2010-01-01"
        }
    }
    
    var endDate: String {
        switch self {
        case .nineteenTwenties:
            return "1929-12-31"
        case .nineteenThirties:
            return "1939-12-31"
        case .nineteenForties:
            return "1949-12-31"
        case .nineteenFifties:
            return "1959-12-31"
        case .nineteenSixties:
            return "1969-12-31"
        case .nineteenSeventies:
            return "1979-12-31"
        case .nineteenEighties:
            return "1989-12-31"
        case .nineteenNineties:
            return "1999-12-31"
        case .twoThousands:
            return "2009-12-31"
        case .twentyTens:
            return "2019-12-31"
        }
    }
    
}
