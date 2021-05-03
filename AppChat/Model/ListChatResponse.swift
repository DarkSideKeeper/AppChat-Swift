/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ListChatResponse : Codable {
	let listChat : [ListChat]?

	enum CodingKeys: String, CodingKey {

		case listChat = "ListChat"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		listChat = try values.decodeIfPresent([ListChat].self, forKey: .listChat)
	}

    struct ListChat : Codable {
        let userId : String?
        let username : String?
        let userImage : String?
        var lastMessage : String?

        enum CodingKeys: String, CodingKey {

            case userId = "UserId"
            case username = "Username"
            case userImage = "UserImage"
            case lastMessage = "LastMessage"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            userId = try values.decodeIfPresent(String.self, forKey: .userId)
            username = try values.decodeIfPresent(String.self, forKey: .username)
            userImage = try values.decodeIfPresent(String.self, forKey: .userImage)
            lastMessage = try values.decodeIfPresent(String.self, forKey: .lastMessage)
        }

    }

}
