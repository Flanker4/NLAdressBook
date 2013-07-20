//
//  NLEditMarkerCell.m
//  NLAdressBook
//
//  Created by Boyko A.V. on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditMarkerCell.h"



//
// MARK: - NLEditMarker
//
@implementation NLEditMarkerCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _segmentController = [[UISegmentedControl alloc] initWithItems:[NLContact allMarkers]];
        _segmentController.frame = CGRectMake(OFFSET, OFFSET, self.contentView.frame.size.width-2*OFFSET,
                                              self.contentView.frame.size.height-2*OFFSET);
        _segmentController.segmentedControlStyle = UISegmentedControlStylePlain;
        _segmentController.autoresizingMask = (UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth);
        _segmentController.selectedSegmentIndex = 0;
        [_segmentController addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_segmentController];
    }
    return self;
}

-(IBAction)segmentValueChanged:(id)sender{
    [self valueDidChange];
}

-(void) fillFromContact:(NLContact*)contact{
    self.value = contact.marker;
}

-(id) value{
    return @(_segmentController.selectedSegmentIndex);
}
-(void) setValue:(id)value{
    _segmentController.selectedSegmentIndex = [value intValue];
}

-(void) dealloc{
    [_segmentController release];
    [super dealloc];
}
@end