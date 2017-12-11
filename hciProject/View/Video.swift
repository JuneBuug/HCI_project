//
//  Video.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import Foundation


class Video{
    
    public var id : String
    public var videoName : String
    public var videoEng :  String
    
    init(){
        id = ""
        videoName = ""
        videoEng = ""
    }
    
    init(id:String, videoName: String, videoEng: String){
        self.id = id
        self.videoName = videoName
        self.videoEng = videoEng
    }
}
