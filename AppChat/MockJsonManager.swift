//
//  MockJsonManager.swift
//  AppChat
//
//  Created by Titipan Sakunwongsalee on 3/5/2564 BE.
//

import UIKit

class MockJsonManager {
    
    static let shared = MockJsonManager()

    func getJsonListChat() -> String {
        let json =
"""
{
  "ListChat": [
    {
      "UserId": "1",
      "Username": "Titipan",
      "UserImage": "https://www.pngkey.com/png/full/503-5035055_a-festival-celebrating-tractors-profile-picture-placeholder-round.png",
      "LastMessage": "Hello To CHe"
    },
    {
      "UserId": "2",
      "Username": "iOS Dev",
      "UserImage": "https://cdn3.iconfinder.com/data/icons/popular-services-brands-vol-2/512/apple-512.png",
      "LastMessage": "GGWP Good Game Well Play"
    }
  ]
}
"""
        return json
    }
    
    func getJsonInChatRoom() -> String {
        let json =
"""
{
  "ListChat": [
    {
      "UserId": "1",
      "Username": "Titipan",
      "UserImage": "https://www.pngkey.com/png/full/503-5035055_a-festival-celebrating-tractors-profile-picture-placeholder-round.png",
      "LastMessage": "Hello To CHe"
    },
    {
      "UserId": "3",
      "Username": "CHe",
      "UserImage": "https://www.pngkey.com/png/full/503-5035055_a-festival-celebrating-tractors-profile-picture-placeholder-round.png",
      "LastMessage": "Hi Titipan"
    },
    {
      "UserId": "3",
      "Username": "CHe",
      "UserImage": "https://www.pngkey.com/png/full/503-5035055_a-festival-celebrating-tractors-profile-picture-placeholder-round.png",
      "LastMessage": "GGWP Good Game Well Play"
    },
    {
      "UserId": "1",
      "Username": "Titipan",
      "UserImage": "https://www.pngkey.com/png/full/503-5035055_a-festival-celebrating-tractors-profile-picture-placeholder-round.png",
      "LastMessage": "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."
    }
  ]
}
"""
        return json
    }
}
