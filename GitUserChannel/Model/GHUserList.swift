//
//  GHUserList.swift
//  GitUserChannel
//
//  Created by Manish Parihar on 05.07.23.
//

import Foundation

 // Model class representing a GitHub user
struct GHUserList: Codable, Hashable, Identifiable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url: String
    let htmlUrl: String
    let followersUrl: String
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: String
    let organizationsUrl: String
    let reposUrl: String
    let eventsUrl: String
    let receivedeventsUrl: String
    let type: String
    let siteAdmin: Bool
    
 
 enum CodingKeys: String, CodingKey {
 case login,
      id,
      nodeId = "node_id",
      avatarUrl = "avatar_url",
      gravatarId = "gravatar_id",
      url,
      htmlUrl="html_url",
      followersUrl="followers_url",
      followingUrl="following_url",
      gistsUrl="gists_url",
      starredUrl="starred_url",
      subscriptionsUrl="subscriptions_url",
      organizationsUrl="organizations_url",
      reposUrl="repos_url",
      eventsUrl="events_url",
      receivedeventsUrl="received_events_url",
      type,
      siteAdmin="site_admin"
 }
 
 init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        id = try container.decode(Int.self, forKey: .id)
        nodeId = try container.decode(String.self, forKey: .nodeId)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        gravatarId = try container.decode(String.self, forKey: .gravatarId)
        url = try container.decode(String.self, forKey: .url)
        htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
        followersUrl = try container.decode(String.self, forKey: .followersUrl)
        followingUrl = try container.decode(String.self, forKey: .followingUrl)
        gistsUrl = try container.decode(String.self, forKey: .gistsUrl)
        starredUrl = try container.decode(String.self, forKey: .starredUrl)
        subscriptionsUrl = try container.decode(String.self, forKey: .subscriptionsUrl)
        organizationsUrl = try container.decode(String.self, forKey: .organizationsUrl)
        reposUrl = try container.decode(String.self, forKey: .reposUrl)
        eventsUrl = try container.decode(String.self, forKey: .eventsUrl)
        receivedeventsUrl = try container.decode(String.self, forKey: .receivedeventsUrl)
        type = try container.decode(String.self, forKey: .type)
        siteAdmin = try container.decode(Bool.self, forKey: .siteAdmin)
    }
    
    static func == (lhs: GHUserList, rhs: GHUserList) -> Bool {
            
            // Compare other properties if needed
            return lhs.id == rhs.id
        }
    
   
 }
