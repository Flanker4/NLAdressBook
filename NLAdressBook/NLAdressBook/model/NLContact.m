//
//  Contact.m
//  NLAdressBook
//
//  Created by Boyko A.V. on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLContact.h"


@implementation NLContact

@dynamic firstName;
@dynamic lastName;
@dynamic patrName;
@dynamic phone;
@dynamic marker;
@dynamic markerType;


-(void) setMarkerType:(NLMarkerType)markerType{
    [self willChangeValueForKey:@"marker"];
    [self setMarker:@(markerType)];
    [self didChangeValueForKey:@"marker"];
}

-(NLMarkerType) markerType{
    [self willAccessValueForKey:@"marker"];
    NLMarkerType tmpMarkerType = [self.marker intValue];
    [self didAccessValueForKey:@"marker"];
    return tmpMarkerType;
}


//
// DESCRIPTION: Return image(cached) for marker
// RESULT:      UIImage
//
-(UIImage*) markerImage{
    return [NLContact allMarkers][self.markerType];
}

+(NSArray*) allMarkers{
    //FUUUUU
    static NSArray *allMarker = nil;
    if (allMarker==nil) {
        allMarker = [@[[UIImage imageNamed:@"marker0.png"],[UIImage imageNamed:@"marker1.png"]] retain];
    }
    return allMarker;
}

@end
