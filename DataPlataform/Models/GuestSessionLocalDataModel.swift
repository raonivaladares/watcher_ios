//
//  GuestSessionLocalDataModel.swift
//  DataPlataform
//
//  Created by Raoni Valadares on 02/12/18.
//  Copyright © 2018 solo. All rights reserved.
//

import Foundation

public struct GuestSessionLocalDataModel {
	public let success: Bool
	public let expiresAt: Date
	public let id: String
	
	public init (success: Bool, expiresAt: Date, id: String) {
		self.success = success
		self.expiresAt = expiresAt
		self.id = id
	}
}

extension GuestSessionLocalDataModel: Codable {}
