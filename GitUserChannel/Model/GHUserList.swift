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
    
    init(login:String, id:Int, nodeID:String, avatarUrl:String, gravatarId:String,
         url:String, htmlUrl:String, followersUrl:String, followingUrl:String, gistsUrl:String,
         starredUrl:String,subscriptionsUrl:String, organizationsUrl:String, reposUrl:String,
         eventsUrl:String,receivedeventsUrl:String,type:String,siteAdmin:Bool) {
        self.login = login
        self.id = id
        self.nodeId = nodeID
        self.avatarUrl = avatarUrl
        self.gravatarId = gravatarId
        self.url = url
        self.htmlUrl = htmlUrl
        self.followersUrl = followersUrl
        self.followingUrl = followingUrl
        self.gistsUrl = gistsUrl
        self.starredUrl = starredUrl
        self.subscriptionsUrl = subscriptionsUrl
        self.organizationsUrl = organizationsUrl
        self.reposUrl = reposUrl
        self.eventsUrl = eventsUrl
        self.receivedeventsUrl = receivedeventsUrl
        self.type = type
        self.siteAdmin = siteAdmin
    }
    
    static func example1() -> GHUserList {
        return   GHUserList(login:"mojombo",
                              id:1,
                              nodeID:"MDQ6VXNlcjE=",
                              avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
                              gravatarId: "",
                              url: "https://api.github.com/users/mojombo",
                              htmlUrl: "https://github.com/mojombo",
                              followersUrl: "https://api.github.com/users/mojombo/followers",
                              followingUrl: "https://api.github.com/users/mojombo/following{/other_user}",
                              gistsUrl: "https://api.github.com/users/mojombo/gists{/gist_id}",
                              starredUrl: "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
                              subscriptionsUrl: "https://api.github.com/users/mojombo/subscriptions",
                              organizationsUrl: "https://api.github.com/users/mojombo/orgs",
                              reposUrl: "https://api.github.com/users/mojombo/repos",
                              eventsUrl: "https://api.github.com/users/mojombo/events{/privacy}",
                              receivedeventsUrl: "https://api.github.com/users/mojombo/received_events",
                              type: "User",
                              siteAdmin: false)
    }
    
   
 }
