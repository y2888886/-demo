//
//  DiagleView.m
//  MSCDemo_UI
//
//  Created by wangdan on 14-12-22.
//
//

#import "RootViewController.h"
#import "iFlyNvpViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation RootViewController
- (id) init
{
    self = [super init];
    _functions = [[NSArray alloc]initWithObjects:@"声纹",nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"讯飞语音示例";
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
    }
#endif
    
    UITextView* thumbView = [[UITextView alloc] initWithFrame:CGRectMake(Margin, Margin, self.view.frame.size.width-Margin*2, 80)];
    
    thumbView.text =@" 本示例为讯飞语音iPhone平台开发者提供声纹测试使用demo,旨在让用户能够依据该示例快速开发出基于语音接口的应用程序。";
    
    thumbView.layer.borderWidth = 1;
    thumbView.layer.cornerRadius = 8;
    [self.view addSubview:thumbView];
    thumbView.editable = NO;
    _thumbView = thumbView;
    
    thumbView.font = [UIFont systemFontOfSize:17.0f];
    
    [thumbView sizeToFit];
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, thumbView.frame.origin.y + thumbView.frame.size.height+Margin , self.view.frame.size.width, self.view.frame.size.height- thumbView.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    [UIButton appearance].tintColor=self.navigationItem.backBarButtonItem.tintColor;
    
    return self;
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    cell.textLabel.text = [_functions objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell ;
}



#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if( indexPath.row == 0 ){
        iFlyNvpViewController * nvp = [[iFlyNvpViewController alloc] init];
        [self.navigationController pushViewController:nvp animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
