//
//  AnimationListTableViewController.m
//  MyStudyDemoList
//
//  Created by Konan on 16/3/7.
//  Copyright © 2016年 Konan. All rights reserved.
//

#import "AnimationListTableViewController.h"
#import "CircleViewController.h"

static NSString *const cellID = @"cellIdentifier";

@interface AnimationListTableViewController ()
{
    NSArray *_dataArr;
}
@end

@implementation AnimationListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    NSString *listDataPath = [[NSBundle mainBundle] pathForResource:@"AnimationTitleList" ofType:@"plist"];
    _dataArr = [NSArray arrayWithContentsOfFile:listDataPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArr ? _dataArr.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = _dataArr[indexPath.row][@"title"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:_dataArr[indexPath.row][@"segueIndentifier"] sender:@{@"row":[NSString stringWithFormat:@"%ld",indexPath.row]}];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSDictionary *senderDictionary = sender;
    NSInteger row = [senderDictionary[@"row"] integerValue];
//    [_dataArr[row][@"viewControllerClass"] Class]
//       Class vcClass = NSClassFromString(_dataArr[row][@"viewControllerClass"]);
//    (UIViewController *)vcClass * detailVC = segue.destinationViewController;
//    detailTableViewController.hidesBottomBarWhenPushed = YES;
//    detailTableViewController.imgUrl = senderDictionary[@"imageURL"];
    
    UIViewController *vc =segue.destinationViewController;
    
    
    
}


@end
