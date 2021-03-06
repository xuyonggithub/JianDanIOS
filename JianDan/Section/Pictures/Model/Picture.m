//
//  Picture.m
//  JianDan
//
//  Created by 刘献亭 on 15/9/19.
//  Copyright (c) 2015年 刘献亭. All rights reserved.
//

#import "Picture.h"
#import "NSDate+MJ.h"
#import "NSString+Date.h"
#import "FastImage.h"

@interface Picture()

@end

@implementation Video

-(void)setBigPicUrl:(NSString *)bigPicUrl{
    if (bigPicUrl) {
        _thumbnail=bigPicUrl;
    }
}

-(void)setBimg:(NSString *)bimg{
    if (bimg) {
        _thumbnail=bimg;
    }
}

MJCodingImplementation

@end

@implementation Picture{
    NSString *_comment_count;
}

-(NSString *)getPost_id{
    return self.post_id;
}

-(NSInteger)encreaseVote_negative{
    return  ++self.vote_negative;
}

-(NSInteger)encreaseVote_positive{
    return  ++self.vote_positive;
}

-(NSString *)idStr{
    return self.post_id;
}


+(NSDictionary *)objectClassInArray{
    return @{@"videos":[Video class]};
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"post_id" : @"comment_ID",@"picUrl":@"pics[0]"};
}

+(NSArray *)ignoredCodingPropertyNames{
    return @[@"image",];
}

-(void)setVote_negative:(NSInteger)vote_negative{
    _vote_negative=vote_negative;
    appendCString(&_vote_negativeStr, "XX ", (long)vote_negative);
}

-(void)setVote_positive:(NSInteger)vote_positive{
    _vote_positive=vote_positive;
     appendCString(&_vote_positiveStr, "OO ", (long)vote_positive);
}

-(void)setPicUrl:(NSString *)picUrl{
    _picUrl=picUrl;
    if ([_picUrl hasSuffix:@".gif"]) {
        _thumnailGiFUrl=[Picture thumbGIFURLFromURL:[_picUrl copy]];
    }
}

//http:/\/ww2.sinaimg.cn/mw600/bfc243a3gw1exavl0cvioj20dw0hvwge.jpg
+(NSString *)thumbGIFURLFromURL:(NSString *)imageURL{
    NSRange mwRange=[imageURL rangeOfString:@"mw"];
    if (mwRange.length) {
       NSRange slashRange=[imageURL rangeOfString:@"/" options:NSCaseInsensitiveSearch range:NSMakeRange(mwRange.location, 8)];
        if (slashRange.length) {
            imageURL=[imageURL stringByReplacingCharactersInRange:NSMakeRange(mwRange.location, slashRange.location-mwRange.location) withString:@"small"];
        }
    }
    return [imageURL stringByReplacingOccurrencesOfString:@"large" withString:@"small"];
}

-(void)setComment_date:(NSString *)comment_date{
    _comment_date=comment_date;
    
    NSDate* date = [_comment_date dateFromString];
    _date=[NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    
    _deltaToNow=[_comment_date deltaTimeToNow];
}

-(void)setComment_count:(NSString *)comment_count{
    if (!_comment_count) {
        appendCString(&_comment_count, "吐槽 ",(long)[comment_count integerValue]);
    }
}

-(void)setText_content:(NSString *)text_content{
    _text_content=[text_content stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
}

MJCodingImplementation
@end
