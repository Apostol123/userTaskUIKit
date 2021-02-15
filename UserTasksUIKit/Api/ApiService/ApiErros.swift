//
//  ApiErros.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidResponse
    case decodingError
    case urlNotFound
    case unknown
    case apiServiceError
}
