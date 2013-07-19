//
//  Contact.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


typedef NS_ENUM(NSInteger, NLMarkerType){
    NLMarkerTypeNone,
    NLMarkerTypeFirst,
    NLMarkerTypeSec
};

@interface NLContact : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * patrName;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSNumber * marker;
@property (nonatomic)  NLMarkerType markerType;

//
// DESCRIPTION: Return image(cached) for marker
// RESULT:      UIImage
//
-(UIImage*) markerImage;
@end
