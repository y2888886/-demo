//
//  DiagleView.m
//  MSCDemo_UI
//
//  Created by wangdan on 14-12-22.
//
//

#import "RootViewController.h"
#import "iFlyNvpViewController.h"
#import "FingerViewController.h"
#import "FaceViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation RootViewController
- (id) init
{
    self = [super init];
    //_functions = [[NSArray alloc]initWithObjects:@"声纹",nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"识别demo";
    
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
    
    thumbView.text =@" 本示例为声纹识别、指纹识别、人脸检测相关的内容";
    
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _functions.count;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    //cell.textLabel.text = [_functions objectAtIndex:indexPath.row];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"声纹";
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"指纹";
    }else if (indexPath.section == 2){
        cell.textLabel.text =@"人脸";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell ;
}



#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if( indexPath.row == 0 ){
//        iFlyNvpViewController * nvp = [[iFlyNvpViewController alloc] init];
//        [self.navigationController pushViewController:nvp animated:YES];
//        
//    }
    if( indexPath.section == 0 ){
        iFlyNvpViewController * nvp = [[iFlyNvpViewController alloc] init];
        [self.navigationController pushViewController:nvp animated:YES];
        
    }else if( indexPath.section == 1 ){
        FingerViewController * fin = [[FingerViewController alloc] init];
        [self.navigationController pushViewController:fin animated:YES];
        
    }else if (indexPath.section == 2){
        FaceViewController *face = [[FaceViewController alloc]init];
        [self.navigationController pushViewController:face animated:YES];
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
