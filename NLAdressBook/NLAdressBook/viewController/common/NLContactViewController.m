//
//  NLContactViewController.m
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLContactViewController.h"


@interface NLContactViewController (){
    NLContact *_contactItem;
    BOOL _isNew;
}

@end

@implementation NLContactViewController

//
// MARK: - init dealloc
//

//
// DESCRIPTION: init
// PARAMS:      contactItem. If nil - create new
// RESULT:      void
//
-(id) initWithContact:(NLContact*) contactItem{
    self = [self initWithNibName:@"NLContactViewController" bundle:nil];
    if (self) {
        _isNew = NO;
        _contactItem = [contactItem retain];
        
        if (_contactItem==nil) {
            _isNew = YES;
            NLAppDelegate *dataProvider = (NLAppDelegate*)[UIApplication sharedApplication].delegate;
             
            
            NSManagedObjectContext *context = dataProvider.managedObjectContext;
            _contactItem = [[NSEntityDescription insertNewObjectForEntityForName:@"NLContact"
                                                          inManagedObjectContext:context] retain];
        }

    }
    return self;
}

-(void)dealloc{
    [_contactItem release];
    [super dealloc];
}


//
// MARK: - view controller life cycle
//
-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *saveButton = [[[UIBarButtonItem alloc] initWithTitle:(_isNew?@"Add":@"Save") style:UIBarButtonItemStyleDone target:self action:@selector(pressSave:)] autorelease];
    self.navigationItem.rightBarButtonItem = saveButton;
    self.title = _isNew?@"Create New":@"Edit Contact";
    
}

-(void) viewWillDisappear:(BOOL)animated{
    NLAppDelegate *dataProvider = (NLAppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = dataProvider.managedObjectContext;
    [context rollback];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

//
// MARK: - TableView data source
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NLContactAttributeCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case NLContactAttributeMarker:
            return @"Marker:";
            break;
        case NLContactAttributePatrName:
            return @"Patronymic Name:";
            break;
        case NLContactAttributeName:
            return @"First Name:";
            break;
        case NLContactAttributePhone:
            return @"Phone:";
            break;
        case  NLContactAttributeSecondName:
            return @"Last Name:";
            break;
        default:
            return @"";
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NLEditCell *cell = [NLEditCell editCellForAttribute:indexPath.section inTableView:tableView];
    cell.delegate = self;
    [cell fillFromContact:_contactItem];
    return cell;
}

//
// MARK: - delegate
//
-(void) didValueChanged:(id)newValue forAttribute:(NLContactAttribute)attribute{
    
    //TODO: FUUUUUUUU
    
    switch (attribute) {
        case NLContactAttributeMarker:
            _contactItem.marker = newValue;
            break;
        case NLContactAttributePatrName:
            _contactItem.patrName = newValue;
            break;
        case NLContactAttributeName:
            _contactItem.firstName = newValue;
            break;
        case NLContactAttributePhone:
            _contactItem.phone = newValue;
            break;
        case  NLContactAttributeSecondName:
            _contactItem.lastName = newValue;
            break;
        default:
            break;
    }
}


//
// MARK: - User interaction
//
-(IBAction)pressSave:(id)sender{
    NLAppDelegate *dataProvider = (NLAppDelegate*)[UIApplication sharedApplication].delegate;
    [dataProvider saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
