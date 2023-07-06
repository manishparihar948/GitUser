//
//  GHUserDetail.swift
//  GitUserChannel
//
//  Created by Manish Parihar on 05.07.23.
//

import Foundation


// MARK: - GHUserDetail
// Model class representing a GitHub user
struct GHUserDetail: Codable, Hashable, Identifiable {
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
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: String
    let updatedAt: String
    
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
                siteAdmin = "site_admin",
                name,
                company,
                blog,
                location,
                email,
                hireable,
                bio,
                twitterUsername = "twitter_username",
                publicRepos = "public_repos",
                publicGists = "public_gists",
                followers,
                following,
                createdAt = "created_at",
                updatedAt = "updated_at"
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
            name = try container.decodeIfPresent(String.self, forKey: .name)
            company = try container.decodeIfPresent(String.self, forKey: .company)
            blog = try container.decodeIfPresent(String.self, forKey: .blog)
            location = try container.decodeIfPresent(String.self, forKey: .location)
            email = try container.decodeIfPresent(String.self, forKey: .email)
            hireable = try container.decodeIfPresent(String.self, forKey: .hireable)
            bio = try container.decodeIfPresent(String.self, forKey: .bio)
            twitterUsername = try container.decodeIfPresent(String.self, forKey: .twitterUsername)
            publicRepos = try container.decode(Int.self, forKey: .publicRepos)
            publicGists = try container.decode(Int.self, forKey: .publicGists)
            followers = try container.decode(Int.self, forKey: .followers)
            following = try container.decode(Int.self, forKey: .following)
            createdAt = try container.decode(String.self, forKey: .createdAt)
            updatedAt = try container.decode(String.self, forKey: .updatedAt)
        }
    
    init(login:String, id:Int, nodeID:String, avatarUrl:String, gravatarId:String,
         url:String, htmlUrl:String, followersUrl:String, followingUrl:String, gistsUrl:String,
         starredUrl:String,subscriptionsUrl:String, organizationsUrl:String, reposUrl:String,
         eventsUrl:String,receivedeventsUrl:String,type:String,siteAdmin:Bool,
         name:String,company:String,blog:String,location:String,email:String,hireable:String,
         bio:String,twitterUsername:String,publicRepos:Int,publicGists:Int, followers:Int,
         following:Int, createdAt:String, updatedAt:String) {
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
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.twitterUsername = twitterUsername
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    static func example1() -> GHUserDetail {
        return   GHUserDetail(login:"mojombo",
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
                              siteAdmin: false,
                              name: "Tom Preston-Werner",
                              company: "@chatterbugapp, @redwoodjs, @preston-werner-ventures",
                              blog: "http://tom.preston-werner.com",
                              location: "San Francisco",
                              email: "",
                              hireable: "",
                              bio: "",
                              twitterUsername: "mojombo",
                              publicRepos: 65,
                              publicGists: 62,
                              followers: 23527,
                              following: 11,
                              createdAt: "2007-10-20T05:24:19Z",
                              updatedAt: "2023-03-22T15:06:06Z")
    }
}

